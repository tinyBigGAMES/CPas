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

#pragma hdrstop

#include <stdarg.h>
#include <stdio.h>
#include <io.h>
#include <fcntl.h>
#include <windows.h>

#include "CPas_Print.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)


void __cdecl Print(const wchar_t* AText, const int AColor, ...)
{
    SetConsoleCP(CP_UTF8);
    SetConsoleOutputCP(CP_UTF8);
    _setmode(_fileno(stdout), _O_WTEXT);

    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_SCREEN_BUFFER_INFO consoleInfo;
    WORD saved_attributes;

    // Save current console attributes
    GetConsoleScreenBufferInfo(hConsole, &consoleInfo);
    saved_attributes = consoleInfo.wAttributes;

    // Set new text color
    SetConsoleTextAttribute(hConsole, AColor);

    // Print the text with additional arguments
    va_list args;
    va_start(args, AColor);

    vfwprintf(stdout, AText, args);

    va_end(args);

    // Restore original console attributes
    SetConsoleTextAttribute(hConsole, saved_attributes);

    _setmode(_fileno(stdout), _O_TEXT);
}

void __cdecl PrintLn(const wchar_t* AText, const int AColor, ...)
{
    SetConsoleCP(CP_UTF8);
    SetConsoleOutputCP(CP_UTF8);
    _setmode(_fileno(stdout), _O_WTEXT);

    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_SCREEN_BUFFER_INFO consoleInfo;
    WORD saved_attributes;

    // Save current console attributes
    GetConsoleScreenBufferInfo(hConsole, &consoleInfo);
    saved_attributes = consoleInfo.wAttributes;

    // Set new text color
    SetConsoleTextAttribute(hConsole, AColor);

    // Print the text with additional arguments
    va_list args;
    va_start(args, AColor);

    vfwprintf(stdout, AText, args);

    va_end(args);

    // Restore original console attributes
    SetConsoleTextAttribute(hConsole, saved_attributes);

    _setmode(_fileno(stdout), _O_TEXT);

    printf("\n");
}

