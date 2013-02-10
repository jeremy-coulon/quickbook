# - Try to find BoostBook DTD and XSL dirs
# Usage of this module as follows:
#
#   find_package( BoostBook )
#   if(BOOSTBOOK_FOUND)
#      DO SOMETHING
#   endif()
#
# Variables defined by this module:
#
#   BOOSTBOOK_FOUND                     System has BoostBook, 
#                                       this means the DTD and XSL dirs were found.
#
#   BOOSTBOOK_DTD_DIR                   Directory containing BoostBook DTD
#
#   BOOSTBOOK_XSL_DIR                   Directory containing BoostBook XSL stylesheets
#
#   BOOSTBOOK_CATALOG                   Generated boostbook_catalog.xml file
#

#=============================================================================
# Copyright (C) 2013 Jeremy Coulon <jeremy.coulon@free.fr>
#
# Distributed under the Boost Software License, Version 1.0.
# See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt
#=============================================================================

# BoostBook depends on DocBook
if(BoostBook_FIND_REQUIRED AND BoostBook_FIND_QUIETLY)
  find_package(DocBook 4.2 EXACT QUIET REQUIRED)
elseif(BoostBook_FIND_REQUIRED)
  find_package(DocBook 4.2 EXACT REQUIRED)
elseif(BoostBook_FIND_QUIETLY)
  find_package(DocBook 4.2 EXACT QUIET)
else()
  find_package(DocBook 4.2 EXACT)
endif()

if(NOT DOCBOOK_FOUND)
  return()
endif()

# Find the BoostBook DTD
find_path(BOOSTBOOK_DTD_DIR boostbook.dtd PATHS
  "/usr/share/boostbook/dtd"
)

# Find the BoostBook XSL stylesheets
find_path(BOOSTBOOK_XSL_DIR html.xsl PATHS
  "/usr/share/boostbook/xsl"
)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set BOOSTBOOK_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(BoostBook DEFAULT_MSG
                                  BOOSTBOOK_DTD_DIR BOOSTBOOK_XSL_DIR)

# Generate boostbook.catalog.xml
if(BOOSTBOOK_FOUND AND DOCBOOK_FOUND)
  find_file(BOOSTBOOK_CATALOG_TEMPLATE boostbook_catalog.xml.in ${CMAKE_MODULE_PATH})
  set(BOOSTBOOK_CATALOG "${CMAKE_BINARY_DIR}/boostbook_catalog.xml" CACHE FILEPATH "")
  configure_file(${BOOSTBOOK_CATALOG_TEMPLATE} "${BOOSTBOOK_CATALOG}")
endif()

mark_as_advanced(BOOSTBOOK_DTD_DIR)
mark_as_advanced(BOOSTBOOK_XSL_DIR)
mark_as_advanced(BOOSTBOOK_CATALOG)
mark_as_advanced(BOOSTBOOK_CATALOG_TEMPLATE)
