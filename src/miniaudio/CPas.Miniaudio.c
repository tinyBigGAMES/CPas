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

__attribute__((section(".rdata"), used)) char* CPAS_MINIAUDIO = "{987B809C-2837-4459-92E8-9B052E85570E}";

#define STB_VORBIS_HEADER_ONLY
#include "stb_vorbis.c"    // Enables Vorbis decoding.

#define MINIAUDIO_IMPLEMENTATION
#include "miniaudio.h"

// The stb_vorbis implementation must come after the implementation of miniaudio.
#undef STB_VORBIS_HEADER_ONLY
#include "stb_vorbis.c"
