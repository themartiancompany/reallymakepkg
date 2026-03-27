..
   SPDX-License-Identifier: AGPL-3.0-or-later

   ----------------------------------------------------------------------
   Copyright © 2024, 2025, 2026  Pellegrino Prevete

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


=================
platform-get
=================

------------------------------------------------------
Returns platform name
------------------------------------------------------
:Version: platform-get |version|
:Manual section: 1

Synopsis
========

platform-get *[options]* -- *os-name*


Description
===========


Return platform name.


Arguments
===========

* os-name
  
  OS string returned by 'uname -o'.


Options
========

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

* recipe-get
* reallymakepkg
* package-info-get
* termux-install-shared
* version-split
* ur
* lur
* fur
* gur
* PKGBUILD
* makepkg
* inteppacman
* pacman

.. include:: variables.rst
