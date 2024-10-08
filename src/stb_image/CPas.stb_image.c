/****************************************************************************
							___  ___
						   / __|| _ \ __ _  ___�
						  | (__ |  _// _` |(_-<
						   \___||_|  \__,_|/__/

					   Static C Libraries for Delphi

				 Copyright � 2024-present tinyBigGAMES� LLC
						  All Rights Reserved.

					Website: https://tinybiggames.com
					Email  : support@tinybiggames.com

				 See LICENSE file for license information
****************************************************************************/

__attribute__((section(".rdata"), used)) char* CPAS_STB_IMAGE = "{ECDE6752-8636-400A-9DD7-C57E5D73CC22}";

#define STB_IMAGE_IMPLEMENTATION
#define STBI_NO_THREAD_LOCALS
#include "stb_image.h"