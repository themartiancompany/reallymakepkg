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


======================
termux-install-shared
======================

-------------------------------------
C
-------------------------------------
:Version: termux-install-shared |version|
:Manual section: 1

Synopsis
========

termux-install-shared *[options]* -- *input_file* *root_dir* *tree_dir* *shared_dir*

Description
===========

Seamlessly install Termux files in Android
shared storage area.


Arguments
===========


* *input_file* The file to install.

* *root_dir* The value of the 'pkgdir'
             variable in the PKGBUILD.

* *tree_dir* The destination path of the 
             file in the Termux tree at
             which to place the link.

* *shared_dir* The destination path of the
               file in the Android shared
               directory.

* *output_file* Output file name. 


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

* reallymakepkg
* ur
* lur
* fur
* gur
* PKGBUILD
* makepkg
* inteppacman
* pacman

.. include:: variables.rst
