# :beer: homebrew-tap

> Unified tap to distribute my Homebrew formulas.

[![License](https://img.shields.io/github/license/idleberg/homebrew-tap?color=blue&style=for-the-badge)](LICENSE)
[![Build](https://img.shields.io/github/actions/workflow/status/idleberg/homebrew-tap/audit.yml?style=for-the-badge)](https://github.com/idleberg/homebrew-tap/actions)

## Formulas

- `alejandra`: The Uncompromising Nix Code Formatter
- `dbxcli`: Command-line client for Dropbox
- `dropboxignore`: Command-line tool for ignoring files in Dropbox
- `krampus`: Command-line tool to kill one or more processes by their port number
- `nixfmt`: Command-line tool to format Nix language code

## Usage

Tap this repository to install the available formulas:

```sh
$ brew tap idleberg/tap
$ brew install <formula> --build-from-source
```

Alternatively, you can install any packages skipping the tap step:

```sh
$ brew install idleberg/tap/<formula> --build-from-source
```

## License

This work is licensed under [The MIT License](LICENSE).
