# - Try to find QuickBook executable
# Usage of this module as follows:
#
#   find_package( QuickBook )
#   if(QUICKBOOK_FOUND)
#      DO SOMETHING
#   endif()
#
# Variables defined by this module:
#
#   QUICKBOOK_FOUND                     System has QuickBook,
#
#   QUICKBOOK_EXECUTABLE                QuickBook executable.
#

#=============================================================================
# Copyright 2013 Jeremy Coulon
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

find_program(QUICKBOOK_EXECUTABLE quickbook)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set QUICKBOOK_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(QuickBook DEFAULT_MSG QUICKBOOK_EXECUTABLE)

mark_as_advanced(QUICKBOOK_EXECUTABLE)
