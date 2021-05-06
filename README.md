# Lightbend Labs Homebrew Tap

This repository is a `tap` that you can use with [`brew`](https://brew.sh) to install Lightbend tools onto your system. Currently supported tools are:

* `akkasls` the command line interface for [Akka Serverless](https://akkaserverless.com)
* `kubectl-cloudflow` the command line interface for [Cloudflow](https://cloudflow.io) and [Akka Data Pipelines](https://developer.lightbend.com/docs/cloudflow/current/index.html)

## Using this tap

### Install

To use these formulae with `brew`, you'll need to install the tap first

```bash
brew tap lightbend-labs/brew
```

### Uninstall

If you want to remove the tap, you can run

```bash
brew untap lightbend-labs/brew
```

### Update

Updating for formulae installed from this tap is all done via `brew update`. 

## `akkasls`

### Install

To install `akkasls` using this tap run `brew install lightbend-labs/brew/akkasls` (which will install the tap automatically) or run

```bash
brew tap lightbend-labs/brew
brew install akkasls
```

### Uninstall

To uninstall `akkasls` run `brew uninstall akkasls`

### Update

To update `akkasls` run `brew update akkasls`

## `kubectl-cloudflow`

### Install

To install `kubectl-cloudflow` using this tap run `brew install lightbend-labs/brew/kubectl-cloudflow` (which will install the tap automatically) or run

```bash
brew tap lightbend-labs/brew
brew install kubectl-cloudflow
```

### Uninstall

To uninstall `kubectl-cloudflow` run `brew uninstall kubectl-cloudflow`

### Update

To update `kubectl-cloudflow` run `brew update kubectl-cloudflow`

## Update the `akkasls` formula

To update the `akkasls.rb` formula file, run `node scripts/update.js`

## Contributing

We welcome all contributions! [Pull requests](https://github.com/lightbend-labs/homebrew-brew/pulls) are the preferred way to share your contributions. For major changes, please open [an issue](https://github.com/lightbend-labs/homebrew-brew/issues) first to discuss what you would like to change.

## Support

This project is provided on an as-is basis and is not covered by the Lightbend Support policy.

## License

See the [LICENSE](./LICENSE).