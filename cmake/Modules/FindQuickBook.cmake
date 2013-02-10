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
# Copyright (C) 2013 Jeremy Coulon <jeremy.coulon@free.fr>
#
# Distributed under the Boost Software License, Version 1.0.
# See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt
#=============================================================================

find_program(QUICKBOOK_EXECUTABLE quickbook)

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set QUICKBOOK_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(QuickBook DEFAULT_MSG QUICKBOOK_EXECUTABLE)

mark_as_advanced(QUICKBOOK_EXECUTABLE)
