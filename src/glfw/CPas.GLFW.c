/****************************************************************************
							___  ___
						   / __|| _ \ __ _  ___™
						  | (__ |  _// _` |(_-<
						   \___||_|  \__,_|/__/

					   Static C Libraries for Delphi

				 Copyright © 2024-present tinyBigGAMES™ LLC
						  All Rights Reserved.

					Website: https://tinybiggames.com
					Email  : support@tinybiggames.com

				 See LICENSE file for license information
****************************************************************************/

__attribute__((section(".rdata"), used)) char* CPAS_GLFW = "{B6415C6D-8260-4A9D-8685-2A9415A035F5}";

#define _GLFW_WIN32
#define GLFW_EXPOSE_NATIVE_WIN32
#include "glfw\src\context.c"
#include "glfw\src\egl_context.c"
#include "glfw\src\init.c"
#include "glfw\src\input.c"
#include "glfw\src\monitor.c"
#include "glfw\src\osmesa_context.c"
#include "glfw\src\platform.c"
#include "glfw\src\vulkan.c"
#include "glfw\src\wgl_context.c"
#include "glfw\src\win32_init.c"
#include "glfw\src\win32_joystick.c"
#include "glfw\src\win32_module.c"
#include "glfw\src\win32_monitor.c"
#include "glfw\src\win32_thread.c"
#include "glfw\src\win32_time.c"
#include "glfw\src\win32_window.c"
#include "glfw\src\window.c"
