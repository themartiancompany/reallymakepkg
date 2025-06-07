..
   SPDX-License-Identifier: AGPL-3.0-or-later

   ----------------------------------------------------------------------
   Copyright © 2024, 2025  Pellegrino Prevete

   All rights reserved
   ----------------------------------------------------------------------

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.

   You should have received a copy of the GNU Affero General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.


==============
reallymakepkg
==============

-------------------------------------
Cross-platform makepkg extension
-------------------------------------
:Version: reallymakepkg |version|
:Manual section: 1

Synopsis
========

reallymakepkg *[options]* -- *[makepkg_opts]*

Description
===========

Cross-platform makepkg extension.

Reallymakepkg is the reference build tool
for Ur universal recipes and so the reference
build tool for Life and DogeOS programs.

Options
========

-C config_file     Configuration file to source
                   before running makepkg.
-w work_dir        Builds the package in a
                   specific directory instead
                   than in a temporary one.
-g libc            C library to use in
                   Termux environments
                   ('glibc', 'bionic').
-l linker          C linker to use in
                   Termux environments
                   ('ld', 'lld').
-P platform        Can be 'termux' or 'arch'.
-u                 Whether to enable automatic
                   'pkgver' update in the recipe.

-h                 Display help.
-c                 Enable color output
-v                 Enable verbose output

Bugs
====

https://github.com/themartiancompany/reallymakepkg/-/issues

Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* ur
* lur
* fur
* gur
* PKGBUILD
* makepkg
* inteppacman
* pacman

.. include:: variables.rst
