/******************************************************************************
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
******************************************************************************/

#ifndef CPas_PrintH
#define CPas_PrintH

extern "C"
{

void __cdecl Print(const wchar_t* AText, const int AColor, ...);
void __cdecl PrintLn(const wchar_t* AText, const int AColor, ...);

}

#endif
