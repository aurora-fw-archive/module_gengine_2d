# ┌─┐┬ ┬┬─┐┌─┐┬─┐┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┬ ┬┌─┐┬─┐┬┌─
# ├─┤│ │├┬┘│ │├┬┘├─┤  ├┤ ├┬┘├─┤│││├┤ ││││ │├┬┘├┴┐
# ┴ ┴└─┘┴└─└─┘┴└─┴ ┴  └  ┴└─┴ ┴┴ ┴└─┘└┴┘└─┘┴└─┴ ┴
# A Powerful General Purpose Framework
# More information in: https://aurora-fw.github.io/
#
# Copyright (C) 2017 Aurora Framework, All rights reserved.
#
# This file is part of the Aurora Framework. This framework is free
# software; you can redistribute it and/or modify it under the terms of
# the GNU Lesser General Public License version 3 as published by the
# Free Software Foundation and appearing in the file LICENSE included in
# the packaging of this file. Please review the following information to
# ensure the GNU Lesser General Public License version 3 requirements
# will be met: https://www.gnu.org/licenses/lgpl-3.0.html.

message(STATUS "Loading gengine-2d module...")

if (NOT CONFIGURED_ONCE)
	set(AURORAFW_MODULE_GENGINE_2D_SOURCE_DIR ${AURORAFW_MODULE_GENGINE_2D_DIR}/src)
endif()

include_directories(${AURORAFW_MODULE_GENGINE_2D_DIR}/include)
include_directories(${OPENGL_INCLUDE_DIRS} ${GLEW_INCLUDE_DIRS})

file(GLOB_RECURSE AURORAFW_MODULE_GENGINE_2D_HEADERS ${AURORAFW_MODULE_GENGINE_2D_DIR}/include/*.*)
file(GLOB_RECURSE AURORAFW_MODULE_GENGINE_2D_SOURCE ${AURORAFW_MODULE_GENGINE_2D_SOURCE_DIR}/*.*)

add_library (aurorafw-gengine-2d STATIC ${AURORAFW_MODULE_GENGINE_2D_SOURCE})
aurorafw_add_library_target(aurorafw-gengine-2d STATIC)

if(AURORAFW_PCH)
add_precompiled_header(aurorafw-gengine-2d "${AURORAFW_MODULE_GENGINE_2D_HEADERS}")
endif()

set_target_properties(aurorafw-gengine-2d PROPERTIES OUTPUT_NAME "aurorafw-gengine-2d_${AURORAFW_PLATFORM_PREFIX}_${AURORAFW_CPUARCH_PREFIX}")

install(TARGETS aurorafw-gengine-2d DESTINATION lib)

file(GLOB AURORAFW_MODULE_GENGINE_2D_HEADERS_AURORAFW_GENGINE ${AURORAFW_MODULE_GENGINE_2D_DIR}/include/GEngine/*.*)

install(FILES ${AURORAFW_MODULE_GENGINE_2D_HEADERS_AURORAFW_GENGINE} DESTINATION include/AuroraFW/GEngine)
