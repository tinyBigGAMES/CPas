(******************************************************************************
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
******************************************************************************)

unit CPas.Print;

{$I CPas.Defines.inc}

interface

uses
  WinApi.Windows,
  CPas.CRuntime;

const
  // Console linefeed & carriage return
  LF   = AnsiChar(#10);
  CR   = AnsiChar(#13);
  CRLF = LF+CR;

  // Primary console colors
  FG_BLUE         = 1;
  FG_GREEN        = 2;
  FG_RED          = 4;
  FG_INTENSITY    = 8;
  BG_BLUE         = $10;
  BG_GREEN        = $20;
  BG_RED          = $40;
  BG_INTENSITY    = $80;

  // Custom console color
  FG_BRIGHTYELLOW = FG_RED OR FG_GREEN OR FG_INTENSITY;
  FG_YELLOW       = FG_RED OR FG_GREEN;
  FG_WHITE        = FG_RED OR FG_GREEN OR FG_BLUE;
  FG_BRIGHTWHITE  = FG_WHITE OR FG_INTENSITY;
  FG_DARKGREEN    = FG_GREEN;
  FG_LIGHTGREEN   = FG_GREEN or FG_INTENSITY;
  FG_DARKGRAY     = FG_INTENSITY;
  FG_CYAN         = FG_GREEN OR FG_BLUE;
  FG_MAGENTA      = FG_RED OR FG_BLUE;

  BG_BRIGHTYELLOW = BG_RED OR BG_GREEN OR BG_INTENSITY;
  BG_YELLOW       = BG_RED OR BG_GREEN;
  BG_WHITE        = BG_RED OR BG_GREEN OR BG_BLUE;
  BG_BRIGHTWHITE  = BG_WHITE OR BG_INTENSITY;
  BG_DARKGREEN    = BG_GREEN;
  BG_LIGHTGREEN   = BG_GREEN or BG_INTENSITY;
  BG_DARKGRAY     = BG_INTENSITY;
  BG_CYAN         = BG_GREEN OR FG_BLUE;
  BG_MAGENTA      = BG_RED OR FG_BLUE;

procedure Print(const AText: PWideChar; const AColor: Integer); cdecl; varargs; external;
procedure PrintLn(const AText: PWideChar; const AColor: Integer); cdecl; varargs; external;

implementation

{$L CPas_Print.o}

end.
