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

unit CPas.stb_image;

{$I CPas.Defines.inc}

interface

uses
  WinApi.Windows,
  CPas.CRtl;

const
  STBI_VERSION = 1;

const
  STBI_default = 0;
  STBI_grey = 1;
  STBI_grey_alpha = 2;
  STBI_rgb = 3;
  STBI_rgb_alpha = 4;

type
  // Forward declarations
  PPInteger = ^PInteger;
  PPointer = ^Pointer;
  Pstbi_io_callbacks = ^stbi_io_callbacks;

  stbi_uc = Byte;
  Pstbi_uc = ^stbi_uc;
  stbi_us = Word;
  Pstbi_us = ^stbi_us;

  stbi_io_callbacks = record
    read: function(user: Pointer; data: PUTF8Char; size: Integer): Integer; cdecl;
    skip: procedure(user: Pointer; n: Integer); cdecl;
    eof: function(user: Pointer): Integer; cdecl;
  end;

function  stbi_load_from_memory(const buffer: Pstbi_uc; len: Integer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_uc; cdecl; external;
function  stbi_load_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_uc; cdecl; external;
function  stbi_load(const filename: PUTF8Char; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_uc; cdecl; external;
function  stbi_load_gif_from_memory(const buffer: Pstbi_uc; len: Integer; delays: PPInteger; x: PInteger; y: PInteger; z: PInteger; comp: PInteger; req_comp: Integer): Pstbi_uc; cdecl; external;
function  stbi_load_16_from_memory(const buffer: Pstbi_uc; len: Integer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_us; cdecl; external;
function  stbi_load_16_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_us; cdecl; external;
function  stbi_load_16(const filename: PUTF8Char; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_us; cdecl; external;
function  stbi_loadf_from_memory(const buffer: Pstbi_uc; len: Integer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): PSingle; cdecl; external;
function  stbi_loadf_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): PSingle; cdecl; external;
function  stbi_loadf(const filename: PUTF8Char; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): PSingle; cdecl; external;
procedure stbi_hdr_to_ldr_gamma(gamma: Single); cdecl; external;
procedure stbi_hdr_to_ldr_scale(scale: Single); cdecl; external;
procedure stbi_ldr_to_hdr_gamma(gamma: Single); cdecl; external;
procedure stbi_ldr_to_hdr_scale(scale: Single); cdecl; external;
function  stbi_is_hdr_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer): Integer; cdecl; external;
function  stbi_is_hdr_from_memory(const buffer: Pstbi_uc; len: Integer): Integer; cdecl; external;
function  stbi_is_hdr(const filename: PUTF8Char): Integer; cdecl; external;
function  stbi_failure_reason(): PUTF8Char; cdecl; external;
procedure stbi_image_free(retval_from_stbi_load: Pointer); cdecl; external;
function  stbi_info_from_memory(const buffer: Pstbi_uc; len: Integer; x: PInteger; y: PInteger; comp: PInteger): Integer; cdecl; external;
function  stbi_info_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer; x: PInteger; y: PInteger; comp: PInteger): Integer; cdecl; external;
function  stbi_is_16_bit_from_memory(const buffer: Pstbi_uc; len: Integer): Integer; cdecl; external;
function  stbi_is_16_bit_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer): Integer; cdecl; external;
function  stbi_info(const filename: PUTF8Char; x: PInteger; y: PInteger; comp: PInteger): Integer; cdecl; external;
function  stbi_is_16_bit(const filename: PUTF8Char): Integer; cdecl; external;
procedure stbi_set_unpremultiply_on_load(flag_true_if_should_unpremultiply: Integer); cdecl; external;
procedure stbi_convert_iphone_png_to_rgb(flag_true_if_should_convert: Integer); cdecl; external;
procedure stbi_set_flip_vertically_on_load(flag_true_if_should_flip: Integer); cdecl; external;
function  stbi_zlib_decode_malloc_guesssize(const buffer: PUTF8Char; len: Integer; initial_size: Integer; outlen: PInteger): PUTF8Char; cdecl; external;
function  stbi_zlib_decode_malloc_guesssize_headerflag(const buffer: PUTF8Char; len: Integer; initial_size: Integer; outlen: PInteger; parse_header: Integer): PUTF8Char; cdecl; external;
function  stbi_zlib_decode_malloc(const buffer: PUTF8Char; len: Integer; outlen: PInteger): PUTF8Char; cdecl; external;
function  stbi_zlib_decode_buffer(obuffer: PUTF8Char; olen: Integer; const ibuffer: PUTF8Char; ilen: Integer): Integer; cdecl; external;
function  stbi_zlib_decode_noheader_malloc(const buffer: PUTF8Char; len: Integer; outlen: PInteger): PUTF8Char; cdecl; external;
function  stbi_zlib_decode_noheader_buffer(obuffer: PUTF8Char; olen: Integer; const ibuffer: PUTF8Char; ilen: Integer): Integer; cdecl; external;

implementation

{$L CPas.stb_image.o}

end.
