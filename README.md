# Jud's Dotfiles

This set of configuration items gets my Mac set up just how I like it.

The repo was originally forked from [Mathias Bynens](https://github.com/mathiasbynens/dotfiles),
but has drifted far beyond that original configuration. Thanks for the inspiration!


## Installation

There's a few commands that have to be run manually to bootstrap things:

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
git clone https://github.com/lordjabez/dotfiles ~/.dotfiles
cd ~/.dotfiles
```

Once the above is done, run the following:

```bash
./prep.sh
./brew.sh
```

Close your terminal and open the newly-installed iTerm. Also open the following apps
and login to them (if applicable) to get their initial configurations established

*  `chrome`
*  `keybase`
*  `docker`
*  `atom`
*  `keepingyouawake`

Finally run the following:

```bash
./dev.sh
./macos.sh
```
