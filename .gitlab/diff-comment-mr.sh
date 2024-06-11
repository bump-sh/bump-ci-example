#!/bin/sh
#
# The script takes 3 parameters as input:
# - 1. The specification file path
# - 2. The bump slug (`BUMP_ID`)
# - 3. The Bump token (`BUMP_TOKEN`)
#
# Usage: ./diff-comment-mr.sh "doc/openapi.yml" "bump_documentation_slug" "bump_token"
#

bump_preview() {
    npm exec -- bump preview "${1}"
}

bump_diff() {
    npm exec -- bump diff --doc="$2" --token="$3" --format=markdown "${1}"
}

generate_api_changelog() {
    echo "## $1"
    echo "### Preview"
    echo "$2" | cut -c3-
    echo
    echo "### Diff"
    echo "$3" | sed 's/^#\(#*\) /###\1 /g'
}

is_breaking() {
    echo "$1" | grep -q '\[Breaking\]'
}

PREVIEW=$(bump_preview "${1}") || exit 1
DIFF=$(bump_diff "${1}" "${2:-$BUMP_ID}" "${3:-$BUMP_TOKEN}")
COMMENT="
$(generate_api_changelog "${CI_PROJECT_NAME}" "$PREVIEW" "$DIFF")
"

echo "$COMMENT"

if [ -n "$CI_MERGE_REQUEST_IID" ]; then
    echo "Trying to send comment to Gitlab MR ${CI_MERGE_REQUEST_IID}..."
    curl \
        --silent \
        --request POST \
        --header "Authorization: Bearer $CI_JOB_TOKEN" \
        --form body="$COMMENT" \
        "$CI_API_V4_URL/projects/$CI_PROJECT_ID/merge_requests/$CI_MERGE_REQUEST_IID/notes"
fi

if is_breaking "$DIFF"; then
    exit 42
fi
