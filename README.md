# El-Fetch

<p align="center">
    <a href="https://melpa.org/#/el-fetch">
        <img src="https://melpa.org/packages/el-fetch-badge.svg">
    </a>
    <a href="https://stable.melpa.org/#/el-fetch">
        <img src="https://stable.melpa.org/packages/el-fetch-badge.svg">
    </a>
    <a href="https://archive.softwareheritage.org/browse/origin/?origin_url=https://gitlab.com/xgqt/emacs-el-fetch">
        <img src="https://archive.softwareheritage.org/badge/origin/https://gitlab.com/xgqt/emacs-el-fetch/">
    </a>
    <a href="https://gitlab.com/xgqt/emacs-el-fetch/pipelines">
        <img src="https://gitlab.com/xgqt/emacs-el-fetch/badges/master/pipeline.svg">
    </a>
</p>

Show system information in Neofetch-like style (eg CPU, RAM).


## About

Show system information in Neofetch-like style (eg CPU, RAM).

Neofetch: https://github.com/dylanaraps/neofetch

Inspiration also has been driven from RKTFetch - older fetch-like program
that I have helped to write some time ago.

RKTFetch: https://github.com/mythical-linux/rktfetch

Though, this is not a re-implementation;
this program is meant to extend "fetch" to this new domain, i.e. Emacs Lisp.
El-Fetch does not implement some of Neofetch's features users of the program
may take for granted, e.g.: ASCII art.
El-Fetch adds some Emacs-specific information gathering,
e.g.: Emacs version/packages, used theme, time spent in the editor.

WARNING: El-Fetch is primarily developed on GNU/Linux,
Windows support is experimental, macOS support is totally untested.

To run El-Fetch add it to your load-path,
execute M-x load-library el-fetch and then M-x el-fetch
You may want to add it to startup or run Emacs with:
--eval "(load-library \"el-fetch\")" --eval "(el-fetch)"


## Appearance

[Example output](./extras/example-output.txt)


## License

Copyright (c) 2022-2023, Maciej Barć <xgqt@riseup.net>
Licensed under the GNU GPL v3 License

SPDX-License-Identifier: GPL-3.0-or-later
