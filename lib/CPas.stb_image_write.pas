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

unit CPas.stb_image_write;

{$I CPas.Defines.inc}

interface

uses
  WinApi.Windows,
  CPas.CRtl;

type
  Pstbi_write_func = procedure(context: Pointer; data: Pointer; size: Integer); cdecl;

function  stbi_write_png(const filename: PUTF8Char; w: Integer; h: Integer; comp: Integer; const data: Pointer; stride_in_bytes: Integer): Integer; cdecl; external;
function  stbi_write_bmp(const filename: PUTF8Char; w: Integer; h: Integer; comp: Integer; const data: Pointer): Integer; cdecl; external;
function  stbi_write_tga(const filename: PUTF8Char; w: Integer; h: Integer; comp: Integer; const data: Pointer): Integer; cdecl; external;
function  stbi_write_hdr(const filename: PUTF8Char; w: Integer; h: Integer; comp: Integer; const data: PSingle): Integer; cdecl; external;
function  stbi_write_jpg(const filename: PUTF8Char; x: Integer; y: Integer; comp: Integer; const data: Pointer; quality: Integer): Integer; cdecl; external;
function  stbi_write_png_to_func(func: Pstbi_write_func; context: Pointer; w: Integer; h: Integer; comp: Integer; const data: Pointer; stride_in_bytes: Integer): Integer; cdecl; external;
function  stbi_write_bmp_to_func(func: Pstbi_write_func; context: Pointer; w: Integer; h: Integer; comp: Integer; const data: Pointer): Integer; cdecl; external;
function  stbi_write_tga_to_func(func: Pstbi_write_func; context: Pointer; w: Integer; h: Integer; comp: Integer; const data: Pointer): Integer; cdecl; external;
function  stbi_write_hdr_to_func(func: Pstbi_write_func; context: Pointer; w: Integer; h: Integer; comp: Integer; const data: PSingle): Integer; cdecl; external;
function  stbi_write_jpg_to_func(func: Pstbi_write_func; context: Pointer; x: Integer; y: Integer; comp: Integer; const data: Pointer; quality: Integer): Integer; cdecl; external;
procedure stbi_flip_vertically_on_write(flip_boolean: Integer); cdecl; external;

implementation

{$L CPas.stb_image_write.o}

end.
