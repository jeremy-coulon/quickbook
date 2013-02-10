# - Try to find DocBook DTD and XSL dirs
# Usage of this module as follows:
#
#   find_package( DocBook 4.2 )
#   if(DOCBOOK_FOUND)
#      DO SOMETHING
#   endif()
#
# Variables defined by this module:
#
#   DOCBOOK_FOUND                       System has DocBook, 
#                                       this means the DTD and XSL dirs were found.
#
#   DOCBOOK_DTD_DIR                     Directory containing DocBook DTD
#
#   DOCBOOK_XSL_DIR                     Directory containing DocBook XSL stylesheets
#

#=============================================================================
# Copyright (C) 2013 Jeremy Coulon <jeremy.coulon@free.fr>
#
# Distributed under the Boost Software License, Version 1.0.
# See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt
#=============================================================================

if(NOT DocBook_FIND_VERSION)
  message(FATAL_ERROR "No DocBook version provided. You should call find_package(DocBook 4.2).")
endif()

# Find the DocBook DTD
find_path(DOCBOOK_DTD_DIR docbookx.dtd PATHS
  "/opt/local/share/xml/docbook/${DocBook_FIND_VERSION}"
  "/usr/share/sgml/docbook/xml-dtd-${DocBook_FIND_VERSION}"
  "/usr/share/xml/docbook/schema/dtd/${DocBook_FIND_VERSION}"
  "/usr/share/xml/docbook/xml-dtd-${DocBook_FIND_VERSION}"
)

# Find the DocBook XSL stylesheets
find_path(DOCBOOK_XSL_DIR html/html.xsl PATHS
  "/opt/local/share/xsl/docbook-xsl"
  "/usr/share/sgml/docbook/xsl-stylesheets"
  "/usr/share/xml/docbook/*"
  "/usr/share/xml/docbook/stylesheet/nwalsh"
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set DOCBOOK_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(DocBook DEFAULT_MSG
                                  DOCBOOK_DTD_DIR DOCBOOK_XSL_DIR)

mark_as_advanced(DOCBOOK_DTD_DIR)
mark_as_advanced(DOCBOOK_XSL_DIR)
