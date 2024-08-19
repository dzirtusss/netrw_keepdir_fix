# netrw_keepdir_fix

A small plugin to fix `netrw`'s `mc` and `mm` commands for `netrw_keepdir=1`. E.g.:

```
**error** (netrw) tried using g:netrw_localcopycmd<cp>; it doesn't work!
```

Written in vimscript, so works for both `vim` and `neovim`.

## Why?

Atm, `netrw`'s `mc` and `mm` commands don't work properly when `netrw_keepdir=1` because
under the hood they require either correct `lcd` every time or `keepdir_dir=0`.

All the internet advises to just set `keepdir_dir=0` and be happy, or manually `lcd` and be happy.
This is the Vim way™ baby. But this may not be the case for all users and interferes with
other plugin defaults or simply I want `netrw` not to crash and work properly.

On the other side, upstream fixes to `netrw` are extremely slow and may take years. And on a rainy
day, I may open a PR to fix it properly and wait.

## How it works

The only thing this plugin does is wrap `mc` and `mm` commands in a function that correctly prepends
the correct current directory and restores it to the original directory afterward.

## Installation

Just use whatever plugin manager you like or check the source and copy-paste it to your local config.
But IMO, using a plugin manager is marginally better, as potentially there might be fixes.

### vim-plug

```vim
Plug 'dzirtusss/netrw_keepdir_fix'
```

### lazy.nvim

```vim
{ 'dzirtusss/netrw_keepdir_fix' }
```

## License

MIT
