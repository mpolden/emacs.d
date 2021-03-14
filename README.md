# emacs.d

My personal Emacs settings with inspiration from:

* [magnars/.emacs.d](https://github.com/magnars/.emacs.d)
* [purcell/emacs.d](https://github.com/purcell/emacs.d)
* [technomancy/better-defaults](https://github.com/technomancy/better-defaults)

## Considerations

This `emacs.d` makes Emacs into a highly productive editor for me. I try to keep
the following in mind when maintaining it:

* Let Emacs be Emacs. Don't attempt to transform it into another editor.
* Keep the configuration as small as possible.
* Improve upon unusable default settings.
* Build the configuration from scratch. Avoid Emacs distributions such as
    [syl20bnr/spacemacs](https://github.com/syl20bnr/spacemacs),
    [bbatsov/prelude](https://github.com/bbatsov/prelude) or
    [hlissner/doom-emacs](https://github.com/hlissner/doom-emacs). This is not a
    comment on the quality or purpose of such distributions, they're just not
    for me.
* Keep the number of external packages to a minimum.
  * Eschew heavy-weight packages that fundamentally change how Emacs works.
  * Prefer packages that compose well with the rest of Emacs.
* Try to unify keybindings across similar modes (e.g. `o` and `C-o` in `dired`
  and `grep`). Keybindings can be notoriously inconsistent across modes.
* Be vigilant in throwing away keybindings, packages or other configuration that
  remains unused for long periods.
* Don't complicate `org-mode` too much. I use `org` to manage much of my life
  and a minimum configuration exists to accomplish this.
  * Avoid additional `org` packages as `org` itself is more than big enough.
* Make code navigation quick and easy.
  * Most non-trivial code repositories contain many source files and
    navigating them efficiently is key to my productivity.
* Don't take on too many responsibilities. I.e. I have tried and failed to use
  Emacs for email and RSS.

## Language Server Protocol

The `Makefile` contains targets for installing servers that implement the
Language Server Protocol (LSP).

Once installed, `eglot` should detect and use the servers automatically.

## Version compatibility

Lowest supported Emacs version is the one found in [Debian
stable](https://packages.debian.org/stable/emacs). No guarantees for older
versions.

## Setup

Clone the repository:

    $ git clone https://github.com/mpolden/emacs.d

Install symlink in `~/.emacs.d`:

**This will overwrite any existing file or symlink!**

    $ cd emacs.d
    $ make install

Start Emacs!

## Local customizations

Local customizations can be added to `lisp/init-local.el`. This file is in
`.gitignore`.

Setting the variable `inhibited-packages` (e.g. in `lisp/init-local.el`) allows
inhibiting loading of one or more packages. Example:

``` emacs-lisp
(setq inhibited-packages '(init-foo))
```
