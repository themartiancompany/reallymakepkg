[comment]: <> (SPDX-License-Identifier: AGPL-3.0)

[comment]: <> (-------------------------------------------------------------)
[comment]: <> (Copyright © 2024, 2025  Pellegrino Prevete)
[comment]: <> (All rights reserved)
[comment]: <> (-------------------------------------------------------------)

[comment]: <> (This program is free software: you can redistribute)
[comment]: <> (it and/or modify it under the terms of the GNU Affero)
[comment]: <> (General Public License as published by the Free)
[comment]: <> (Software Foundation, either version 3 of the License.)

[comment]: <> (This program is distributed in the hope that it will be useful,)
[comment]: <> (but WITHOUT ANY WARRANTY; without even the implied warranty of)
[comment]: <> (MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the)
[comment]: <> (GNU Affero General Public License for more details.)

[comment]: <> (You should have received a copy of the GNU Affero General Public)
[comment]: <> (License along with this program.)
[comment]: <> (If not, see <https://www.gnu.org/licenses/>.)

# Reallymakepkg

Cross-platform pacman extension.

Helps to seamlessly build PKGBUILDs, in this
context called 'Universal Recipes'.

Reference build tool for the DogeOS and Life
OS-like collection of software.

In particular compatible with Arch Linux
and Android (Termux).

This program is written using the
[Crash Bash](
  https://github.com/themartiancompany/crash-bash)
  library.


## Installation

The programs in this source repo
can be installed from source using GNU Make.

```bash
make \
  install
```

or even run directly.

The program has officially published on the
the uncensorable
[Ur](
  https://github.com/themartiancompany/ur)
user repository and application store as
`evm-contracts-tools`.
The source code is published on the
[Ethereum Virtual Machine File System](
  https://github.com/themartiancompany/evmfs)
so it can't possibly be taken down.

To install it from there just type

```bash
ur \
  reallymakepkg
```

A censorable HTTP Github mirror of the recipe published there,
containing a full list of the software dependencies needed to run the
tools is hosted on
[reallymakepkg-ur](
  https://github.com/themartiancompany/reallymakepkg-ur).

Be aware the mirror could go offline any time as Github and more
in general all HTTP resources are inherently unstable and censorable.

### Usage

The manual is available by typing

```bash
man \
  reallymakepkg
```

  To display the command-line help you can type

```bash
reallymakepkg \
  -h
```

## License

This program is released by Pellegrino Prevete under the terms
of the GNU Affero General Public License version 3.
