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

unit CPas.stb_truetype;

{$I CPas.Defines.inc}

interface

uses
  WinApi.Windows,
  CPas.CRtl;

const
  STBTT_MACSTYLE_DONTCARE = 0;
  STBTT_MACSTYLE_BOLD = 1;
  STBTT_MACSTYLE_ITALIC = 2;
  STBTT_MACSTYLE_UNDERSCORE = 4;
  STBTT_MACSTYLE_NONE = 8;

const
  STBTT_vmove = 1;
  STBTT_vline = 2;
  STBTT_vcurve = 3;
  STBTT_vcubic = 4;

const
  STBTT_PLATFORM_ID_UNICODE = 0;
  STBTT_PLATFORM_ID_MAC = 1;
  STBTT_PLATFORM_ID_ISO = 2;
  STBTT_PLATFORM_ID_MICROSOFT = 3;

const
  STBTT_UNICODE_EID_UNICODE_1_0 = 0;
  STBTT_UNICODE_EID_UNICODE_1_1 = 1;
  STBTT_UNICODE_EID_ISO_10646 = 2;
  STBTT_UNICODE_EID_UNICODE_2_0_BMP = 3;
  STBTT_UNICODE_EID_UNICODE_2_0_FULL = 4;

const
  STBTT_MS_EID_SYMBOL = 0;
  STBTT_MS_EID_UNICODE_BMP = 1;
  STBTT_MS_EID_SHIFTJIS = 2;
  STBTT_MS_EID_UNICODE_FULL = 10;

const
  STBTT_MAC_EID_ROMAN = 0;
  STBTT_MAC_EID_ARABIC = 4;
  STBTT_MAC_EID_JAPANESE = 1;
  STBTT_MAC_EID_HEBREW = 5;
  STBTT_MAC_EID_CHINESE_TRAD = 2;
  STBTT_MAC_EID_GREEK = 6;
  STBTT_MAC_EID_KOREAN = 3;
  STBTT_MAC_EID_RUSSIAN = 7;

const
  STBTT_MS_LANG_ENGLISH = 1033;
  STBTT_MS_LANG_ITALIAN = 1040;
  STBTT_MS_LANG_CHINESE = 2052;
  STBTT_MS_LANG_JAPANESE = 1041;
  STBTT_MS_LANG_DUTCH = 1043;
  STBTT_MS_LANG_KOREAN = 1042;
  STBTT_MS_LANG_FRENCH = 1036;
  STBTT_MS_LANG_RUSSIAN = 1049;
  STBTT_MS_LANG_GERMAN = 1031;
  STBTT_MS_LANG_SPANISH = 1033;
  STBTT_MS_LANG_HEBREW = 1037;
  STBTT_MS_LANG_SWEDISH = 1053;

const
  STBTT_MAC_LANG_ENGLISH = 0;
  STBTT_MAC_LANG_JAPANESE = 11;
  STBTT_MAC_LANG_ARABIC = 12;
  STBTT_MAC_LANG_KOREAN = 23;
  STBTT_MAC_LANG_DUTCH = 4;
  STBTT_MAC_LANG_RUSSIAN = 32;
  STBTT_MAC_LANG_FRENCH = 1;
  STBTT_MAC_LANG_SPANISH = 6;
  STBTT_MAC_LANG_GERMAN = 2;
  STBTT_MAC_LANG_SWEDISH = 5;
  STBTT_MAC_LANG_HEBREW = 10;
  STBTT_MAC_LANG_CHINESE_SIMPLIFIED = 33;
  STBTT_MAC_LANG_ITALIAN = 3;
  STBTT_MAC_LANG_CHINESE_TRAD = 19;

type
  // Forward declarations
  PPUTF8Char = ^PUTF8Char;
  Pstbtt__buf = ^stbtt__buf;
  Pstbtt_bakedchar = ^stbtt_bakedchar;
  Pstbtt_aligned_quad = ^stbtt_aligned_quad;
  Pstbtt_packedchar = ^stbtt_packedchar;
  Pstbtt_pack_range = ^stbtt_pack_range;
  Pstbtt_pack_context = ^stbtt_pack_context;
  Pstbtt_fontinfo = ^stbtt_fontinfo;
  Pstbtt_kerningentry = ^stbtt_kerningentry;
  Pstbtt_vertex = ^stbtt_vertex;
  PPstbtt_vertex = ^Pstbtt_vertex;
  Pstbtt__bitmap = ^stbtt__bitmap;

  stbtt__buf = record
    data: PByte;
    cursor: Integer;
    size: Integer;
  end;

  stbtt_bakedchar = record
    x0: Word;
    y0: Word;
    x1: Word;
    y1: Word;
    xoff: Single;
    yoff: Single;
    xadvance: Single;
  end;

  stbtt_aligned_quad = record
    x0: Single;
    y0: Single;
    s0: Single;
    t0: Single;
    x1: Single;
    y1: Single;
    s1: Single;
    t1: Single;
  end;

  stbtt_packedchar = record
    x0: Word;
    y0: Word;
    x1: Word;
    y1: Word;
    xoff: Single;
    yoff: Single;
    xadvance: Single;
    xoff2: Single;
    yoff2: Single;
  end;

  Pstbrp_rect = Pointer;
  PPstbrp_rect = ^Pstbrp_rect;

  stbtt_pack_range = record
    font_size: Single;
    first_unicode_codepoint_in_range: Integer;
    array_of_unicode_codepoints: PInteger;
    num_chars: Integer;
    chardata_for_range: Pstbtt_packedchar;
    h_oversample: Byte;
    v_oversample: Byte;
  end;

  stbtt_pack_context = record
    user_allocator_context: Pointer;
    pack_info: Pointer;
    width: Integer;
    height: Integer;
    stride_in_bytes: Integer;
    padding: Integer;
    skip_missing: Integer;
    h_oversample: Cardinal;
    v_oversample: Cardinal;
    pixels: PByte;
    nodes: Pointer;
  end;

  stbtt_fontinfo = record
    userdata: Pointer;
    data: PByte;
    fontstart: Integer;
    numGlyphs: Integer;
    loca: Integer;
    head: Integer;
    glyf: Integer;
    hhea: Integer;
    hmtx: Integer;
    kern: Integer;
    gpos: Integer;
    svg: Integer;
    index_map: Integer;
    indexToLocFormat: Integer;
    cff: stbtt__buf;
    charstrings: stbtt__buf;
    gsubrs: stbtt__buf;
    subrs: stbtt__buf;
    fontdicts: stbtt__buf;
    fdselect: stbtt__buf;
  end;

  stbtt_kerningentry = record
    glyph1: Integer;
    glyph2: Integer;
    advance: Integer;
  end;

  stbtt_vertex = record
    x: Smallint;
    y: Smallint;
    cx: Smallint;
    cy: Smallint;
    cx1: Smallint;
    cy1: Smallint;
    &type: Byte;
    padding: Byte;
  end;

  stbtt__bitmap = record
    w: Integer;
    h: Integer;
    stride: Integer;
    pixels: PByte;
  end;

function  stbtt_BakeFontBitmap(const data: PByte; offset: Integer; pixel_height: Single; pixels: PByte; pw: Integer; ph: Integer; first_char: Integer; num_chars: Integer; chardata: Pstbtt_bakedchar): Integer; cdecl; external;
procedure stbtt_GetBakedQuad(const chardata: Pstbtt_bakedchar; pw: Integer; ph: Integer; char_index: Integer; xpos: PSingle; ypos: PSingle; q: Pstbtt_aligned_quad; opengl_fillrule: Integer); cdecl; external;
procedure stbtt_GetScaledFontVMetrics(const fontdata: PByte; index: Integer; size: Single; ascent: PSingle; descent: PSingle; lineGap: PSingle); cdecl; external;
function  stbtt_PackBegin(spc: Pstbtt_pack_context; pixels: PByte; width: Integer; height: Integer; stride_in_bytes: Integer; padding: Integer; alloc_context: Pointer): Integer; cdecl; external;
procedure stbtt_PackEnd(spc: Pstbtt_pack_context); cdecl; external;
function  stbtt_PackFontRange(spc: Pstbtt_pack_context; const fontdata: PByte; font_index: Integer; font_size: Single; first_unicode_char_in_range: Integer; num_chars_in_range: Integer; chardata_for_range: Pstbtt_packedchar): Integer; cdecl; external;
function  stbtt_PackFontRanges(spc: Pstbtt_pack_context; const fontdata: PByte; font_index: Integer; ranges: Pstbtt_pack_range; num_ranges: Integer): Integer; cdecl; external;
procedure stbtt_PackSetOversampling(spc: Pstbtt_pack_context; h_oversample: Cardinal; v_oversample: Cardinal); cdecl; external;
procedure stbtt_PackSetSkipMissingCodepoints(spc: Pstbtt_pack_context; skip: Integer); cdecl; external;
procedure stbtt_GetPackedQuad(const chardata: Pstbtt_packedchar; pw: Integer; ph: Integer; char_index: Integer; xpos: PSingle; ypos: PSingle; q: Pstbtt_aligned_quad; align_to_integer: Integer); cdecl; external;
function  stbtt_PackFontRangesGatherRects(spc: Pstbtt_pack_context; const info: Pstbtt_fontinfo; ranges: Pstbtt_pack_range; num_ranges: Integer; rects: Pstbrp_rect): Integer; cdecl; external;
procedure stbtt_PackFontRangesPackRects(spc: Pstbtt_pack_context; rects: Pstbrp_rect; num_rects: Integer); cdecl; external;
function  stbtt_PackFontRangesRenderIntoRects(spc: Pstbtt_pack_context; const info: Pstbtt_fontinfo; ranges: Pstbtt_pack_range; num_ranges: Integer; rects: Pstbrp_rect): Integer; cdecl; external;
function  stbtt_GetNumberOfFonts(const data: PByte): Integer; cdecl; external;
function  stbtt_GetFontOffsetForIndex(const data: PByte; index: Integer): Integer; cdecl; external;
function  stbtt_InitFont(info: Pstbtt_fontinfo; const data: PByte; offset: Integer): Integer; cdecl; external;
function  stbtt_FindGlyphIndex(const info: Pstbtt_fontinfo; unicode_codepoint: Integer): Integer; cdecl; external;
function  stbtt_ScaleForPixelHeight(const info: Pstbtt_fontinfo; pixels: Single): Single; cdecl; external;
function  stbtt_ScaleForMappingEmToPixels(const info: Pstbtt_fontinfo; pixels: Single): Single; cdecl; external;
procedure stbtt_GetFontVMetrics(const info: Pstbtt_fontinfo; ascent: PInteger; descent: PInteger; lineGap: PInteger); cdecl; external;
function  stbtt_GetFontVMetricsOS2(const info: Pstbtt_fontinfo; typoAscent: PInteger; typoDescent: PInteger; typoLineGap: PInteger): Integer; cdecl; external;
procedure stbtt_GetFontBoundingBox(const info: Pstbtt_fontinfo; x0: PInteger; y0: PInteger; x1: PInteger; y1: PInteger); cdecl; external;
procedure stbtt_GetCodepointHMetrics(const info: Pstbtt_fontinfo; codepoint: Integer; advanceWidth: PInteger; leftSideBearing: PInteger); cdecl; external;
function  stbtt_GetCodepointKernAdvance(const info: Pstbtt_fontinfo; ch1: Integer; ch2: Integer): Integer; cdecl; external;
function  stbtt_GetCodepointBox(const info: Pstbtt_fontinfo; codepoint: Integer; x0: PInteger; y0: PInteger; x1: PInteger; y1: PInteger): Integer; cdecl; external;
procedure stbtt_GetGlyphHMetrics(const info: Pstbtt_fontinfo; glyph_index: Integer; advanceWidth: PInteger; leftSideBearing: PInteger); cdecl; external;
function  stbtt_GetGlyphKernAdvance(const info: Pstbtt_fontinfo; glyph1: Integer; glyph2: Integer): Integer; cdecl; external;
function  stbtt_GetGlyphBox(const info: Pstbtt_fontinfo; glyph_index: Integer; x0: PInteger; y0: PInteger; x1: PInteger; y1: PInteger): Integer; cdecl; external;
function  stbtt_GetKerningTableLength(const info: Pstbtt_fontinfo): Integer; cdecl; external;
function  stbtt_GetKerningTable(const info: Pstbtt_fontinfo; table: Pstbtt_kerningentry; table_length: Integer): Integer; cdecl; external;
function  stbtt_IsGlyphEmpty(const info: Pstbtt_fontinfo; glyph_index: Integer): Integer; cdecl; external;
function  stbtt_GetCodepointShape(const info: Pstbtt_fontinfo; unicode_codepoint: Integer; vertices: PPstbtt_vertex): Integer; cdecl; external;
function  stbtt_GetGlyphShape(const info: Pstbtt_fontinfo; glyph_index: Integer; vertices: PPstbtt_vertex): Integer; cdecl; external;
procedure stbtt_FreeShape(const info: Pstbtt_fontinfo; vertices: Pstbtt_vertex); cdecl; external;
function  stbtt_FindSVGDoc(const info: Pstbtt_fontinfo; gl: Integer): PByte; cdecl; external;
function  stbtt_GetCodepointSVG(const info: Pstbtt_fontinfo; unicode_codepoint: Integer; svg: PPUTF8Char): Integer; cdecl; external;
function  stbtt_GetGlyphSVG(const info: Pstbtt_fontinfo; gl: Integer; svg: PPUTF8Char): Integer; cdecl; external;
procedure stbtt_FreeBitmap(bitmap: PByte; userdata: Pointer); cdecl; external;
function  stbtt_GetCodepointBitmap(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; codepoint: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl; external;
function  stbtt_GetCodepointBitmapSubpixel(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; codepoint: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl; external;
procedure stbtt_MakeCodepointBitmap(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; codepoint: Integer); cdecl; external;
procedure stbtt_MakeCodepointBitmapSubpixel(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; codepoint: Integer); cdecl; external;
procedure stbtt_MakeCodepointBitmapSubpixelPrefilter(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; oversample_x: Integer; oversample_y: Integer; sub_x: PSingle; sub_y: PSingle; codepoint: Integer); cdecl; external;
procedure stbtt_GetCodepointBitmapBox(const font: Pstbtt_fontinfo; codepoint: Integer; scale_x: Single; scale_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl; external;
procedure stbtt_GetCodepointBitmapBoxSubpixel(const font: Pstbtt_fontinfo; codepoint: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl; external;
function  stbtt_GetGlyphBitmap(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; glyph: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl; external;
function  stbtt_GetGlyphBitmapSubpixel(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; glyph: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl; external;
procedure stbtt_MakeGlyphBitmap(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; glyph: Integer); cdecl; external;
procedure stbtt_MakeGlyphBitmapSubpixel(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; glyph: Integer); cdecl; external;
procedure stbtt_MakeGlyphBitmapSubpixelPrefilter(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; oversample_x: Integer; oversample_y: Integer; sub_x: PSingle; sub_y: PSingle; glyph: Integer); cdecl; external;
procedure stbtt_GetGlyphBitmapBox(const font: Pstbtt_fontinfo; glyph: Integer; scale_x: Single; scale_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl; external;
procedure stbtt_GetGlyphBitmapBoxSubpixel(const font: Pstbtt_fontinfo; glyph: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl; external;
procedure stbtt_Rasterize(result: Pstbtt__bitmap; flatness_in_pixels: Single; vertices: Pstbtt_vertex; num_verts: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; x_off: Integer; y_off: Integer; invert: Integer; userdata: Pointer); cdecl; external;
procedure stbtt_FreeSDF(bitmap: PByte; userdata: Pointer); cdecl; external;
function  stbtt_GetGlyphSDF(const info: Pstbtt_fontinfo; scale: Single; glyph: Integer; padding: Integer; onedge_value: Byte; pixel_dist_scale: Single; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl; external;
function  stbtt_GetCodepointSDF(const info: Pstbtt_fontinfo; scale: Single; codepoint: Integer; padding: Integer; onedge_value: Byte; pixel_dist_scale: Single; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl; external;
function  stbtt_FindMatchingFont(const fontdata: PByte; const name: PUTF8Char; flags: Integer): Integer; cdecl; external;
function  stbtt_CompareUTF8toUTF16_bigendian(const s1: PUTF8Char; len1: Integer; const s2: PUTF8Char; len2: Integer): Integer; cdecl; external;
function  stbtt_GetFontNameString(const font: Pstbtt_fontinfo; length: PInteger; platformID: Integer; encodingID: Integer; languageID: Integer; nameID: Integer): PUTF8Char; cdecl; external;

implementation

{$L CPas.stb_truetype.o}

end.
