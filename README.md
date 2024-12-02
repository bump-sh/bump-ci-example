# Bump CI integration examples

CI integration examples for Github Action, Travis CI, CircleCI and Gitlab CI.

<p align="center">
  <img width="20%" src="https://bump.sh/icon-default-maskable-large.png" />
</p>

<p align="center">
  <a href="https://help.bump.sh/">Help</a> |
  <a href="https://bump.sh/users/sign_up">Sign up</a>
</p>

Bump is a Continuous Documentation Platform: it lets you keep your API doc always synchronized with your codebase. With these CI integration examples you can automatically generate your API reference (with changelog and diff) on [Bump](https://bump.sh) from any [OpenAPI](https://github.com/OAI/OpenAPI-Specification) or [AsyncAPI](https://github.com/asyncapi/asyncapi) file.

## Examples

Here are examples for integrating Bump with the most known CI products:
- CircleCI : https://github.com/bump-sh/bump-ci-example/blob/master/.circleci/config.yml
- Gitlab CI: https://github.com/bump-sh/bump-ci-example/blob/master/.gitlab-ci.yml
- Travis CI:  https://github.com/bump-sh/bump-ci-example/blob/master/.travis.yml
- GitHub action: https://github.com/bump-sh/github-action

The GitHub action example uses a dedicated action we crafted especially for you. You may find more information on our [GitHub marketplace page](https://github.com/marketplace/actions/api-documentation-on-bump).

Note that if you don't want to keep the private token and documentation id in your code base, you should use environment variables. Our CLI automatically recognizes these 3 variables:
- `BUMP_ID`: your documentation public id or slug
- `BUMP_TOKEN`: your documentation private token
- `BUMP_HUB_ID`: if using hubs, your hub public id or slug

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bump-sh/bump-ci-example. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE).

## Code of Conduct

Everyone interacting in the Bump `bump-ci-example` code repository, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bump-sh/.github/blob/master/CODE_OF_CONDUCT.md).
