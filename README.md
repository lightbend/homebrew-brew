# Lightbend Homebrew Tap

This repository is a `tap` that you can use with [`brew`](https://brew.sh) to install Lightbend tools onto your system. Currently, supported tools are:

* `kalix` the command line interface for [Kalix](https://kalix.io)

## Using this tap

### Install

To use these formulae with `brew`, you'll need to install the tap first

```bash
brew tap lightbend/brew
```

### Uninstall

If you want to remove the tap, you can run

```bash
brew untap lightbend/brew
```

### Update

Updating for formulae installed from this tap is all done via `brew update`. 

## `kalix`

### Install

To install `kalix` using this tap run `brew install lightbend/brew/kalix` (which will install the tap automatically) or run

```bash
brew tap lightbend/brew
brew install kalix
```

### Uninstall

To uninstall `kalix` run `brew uninstall kalix`

### Update

To update `kalix` run `brew update kalix`

## Contributing

We welcome all contributions! [Pull requests](https://github.com/lightbend/homebrew-brew/pulls) are the preferred way to share your contributions. For major changes, please open [an issue](https://github.com/lightbend/homebrew-brew/issues) first to discuss what you would like to change.

## Support

This project is provided on an as-is basis and is not covered by the Lightbend Support policy.

## License

See the [LICENSE](./LICENSE).
