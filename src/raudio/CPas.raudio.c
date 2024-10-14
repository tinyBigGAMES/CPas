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

__attribute__((section(".rdata"), used)) char* CPAS_RAUDIO = "{09385F22-4827-405D-87B7-2BB99B4CEB0F}";

#define TRACELOG(level, ...)

#define SUPPORT_MODULE_RAUDIO
#define RAUDIO_STANDALONE
#define SUPPORT_FILEFORMAT_WAV
#define SUPPORT_FILEFORMAT_OGG
#define SUPPORT_FILEFORMAT_MP3
#define SUPPORT_FILEFORMAT_QOA
#define SUPPORT_FILEFORMAT_FLAC
#define SUPPORT_FILEFORMAT_XM
#define SUPPORT_FILEFORMAT_MOD
#include "..\vendor\raudio\raudio.c"
