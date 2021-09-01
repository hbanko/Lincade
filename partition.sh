#!/bin/bash
#---------------------------------------------------------------------------------
#-- Copyright Lincade Project (http://www.pc2jamma.org)				--
#-- Copyleft :) Lincade Project							--
#--										--
#-- Lincade Setup - Bash Version						--
#-- Created by Holger Banko							--
#--										--
#-- Date: 10th August 2006							--
#-- Version: 0.4								--
#-- Licence: GPL2								--
#--										--
#-- Program: setup.sh								--
#-- Usage: "setup.sh"								--
#-- Purpose: Will easy install the gentoo based Lincade distribution		--
#---------------------------------------------------------------------------------
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
#---------------------------------------------------------------------------------
#
# History #
#-------------------------------------------------------------------------
# v0.41 - 24/11/2006
#	* added simple Update feature (keeps the content of the old home folder)
# v0.4 - 18/11/2006 
#	* Added CD drive detection, one more GFX driver, French language, seperated
#	  home folder from the distribution
# v0.3 - 10/08/2006
#	* Added NIC configuration and a chooser for gfx card. Fixed bugs.
# v0.2 - 22/07/2006
#	* First release with partitioning and grub installation.
# v0.1 - 23/06/2006
#       * Created
#-------------------------------------------------------------------------

### How much memory and harddrive capacity we have, to make a good proposal?
size=`sfdisk -s /dev/hda 2> /dev/null`
mem=`cat /proc/meminfo|grep MemTotal|tr -d [:alpha:][:blank:]:`
let "size=$size/1024"
let "mem=$mem/1024"
let "root=$size-10-2*$mem"
let "swap=$mem*2"

echo Speicher: $mem
echo Root: $root

