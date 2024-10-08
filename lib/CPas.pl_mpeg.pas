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

unit CPas.pl_mpeg;

{$I CPas.Defines.inc}

interface

uses
  WinApi.Windows,
  CPas.CRtl;

const
  PLM_PACKET_INVALID_TS = -1;
  PLM_AUDIO_SAMPLES_PER_FRAME = 1152;
  PLM_BUFFER_DEFAULT_SIZE = (128*1024);

type
  // Forward declarations
  PUInt8 = ^UInt8;
  PPointer = ^Pointer;
  Pplm_packet_t = ^plm_packet_t;
  Pplm_plane_t = ^plm_plane_t;
  Pplm_frame_t = ^plm_frame_t;
  Pplm_samples_t = ^plm_samples_t;

  Pplm_t = Pointer;
  PPplm_t = ^Pplm_t;
  Pplm_buffer_t = Pointer;
  PPplm_buffer_t = ^Pplm_buffer_t;
  Pplm_demux_t = Pointer;
  PPplm_demux_t = ^Pplm_demux_t;
  Pplm_video_t = Pointer;
  PPplm_video_t = ^Pplm_video_t;
  Pplm_audio_t = Pointer;
  PPplm_audio_t = ^Pplm_audio_t;

  plm_packet_t = record
    &type: Integer;
    pts: Double;
    length: NativeUInt;
    data: PUInt8;
  end;

  plm_plane_t = record
    width: Cardinal;
    height: Cardinal;
    data: PUInt8;
  end;

  plm_frame_t = record
    time: Double;
    width: Cardinal;
    height: Cardinal;
    y: plm_plane_t;
    cr: plm_plane_t;
    cb: plm_plane_t;
  end;

  plm_video_decode_callback = procedure(self: Pplm_t; frame: Pplm_frame_t; user: Pointer); cdecl;

  plm_samples_t = record
    time: Double;
    count: Cardinal;
    interleaved: array [0..2303] of Single;
  end;

  plm_audio_decode_callback = procedure(self: Pplm_t; samples: Pplm_samples_t; user: Pointer); cdecl;
  plm_buffer_load_callback = procedure(self: Pplm_buffer_t; user: Pointer); cdecl;

const
  PLM_DEMUX_PACKET_PRIVATE: Integer = $BD;
  PLM_DEMUX_PACKET_AUDIO_1: Integer = $C0;
  PLM_DEMUX_PACKET_AUDIO_2: Integer = $C1;
  PLM_DEMUX_PACKET_AUDIO_3: Integer = $C2;
  PLM_DEMUX_PACKET_AUDIO_4: Integer = $C3;
  PLM_DEMUX_PACKET_VIDEO_1: Integer = $E0;

function  plm_create_with_filename(const filename: PUTF8Char): Pplm_t; cdecl; external;
function  plm_create_with_file(fh: PPointer; close_when_done: Integer): Pplm_t; cdecl; external;
function  plm_create_with_memory(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_t; cdecl; external;
function  plm_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_t; cdecl; external;
procedure plm_destroy(self: Pplm_t); cdecl; external;
function  plm_has_headers(self: Pplm_t): Integer; cdecl; external;
function  plm_probe(self: Pplm_t; probesize: NativeUInt): Integer; cdecl; external;
function  plm_get_video_enabled(self: Pplm_t): Integer; cdecl; external;
procedure plm_set_video_enabled(self: Pplm_t; enabled: Integer); cdecl; external;
function  plm_get_num_video_streams(self: Pplm_t): Integer; cdecl; external;
function  plm_get_width(self: Pplm_t): Integer; cdecl; external;
function  plm_get_height(self: Pplm_t): Integer; cdecl; external;
function  plm_get_pixel_aspect_ratio(self: Pplm_t): Double; cdecl; external;
function  plm_get_framerate(self: Pplm_t): Double; cdecl; external;
function  plm_get_audio_enabled(self: Pplm_t): Integer; cdecl; external;
procedure plm_set_audio_enabled(self: Pplm_t; enabled: Integer); cdecl; external;
function  plm_get_num_audio_streams(self: Pplm_t): Integer; cdecl; external;
procedure plm_set_audio_stream(self: Pplm_t; stream_index: Integer); cdecl; external;
function  plm_get_samplerate(self: Pplm_t): Integer; cdecl; external;
function  plm_get_audio_lead_time(self: Pplm_t): Double; cdecl; external;
procedure plm_set_audio_lead_time(self: Pplm_t; lead_time: Double); cdecl; external;
function  plm_get_time(self: Pplm_t): Double; cdecl; external;
function  plm_get_duration(self: Pplm_t): Double; cdecl; external;
procedure plm_rewind(self: Pplm_t); cdecl; external;
function  plm_get_loop(self: Pplm_t): Integer; cdecl; external;
procedure plm_set_loop(self: Pplm_t; loop: Integer); cdecl; external;
function  plm_has_ended(self: Pplm_t): Integer; cdecl; external;
procedure plm_set_video_decode_callback(self: Pplm_t; fp: plm_video_decode_callback; user: Pointer); cdecl; external;
procedure plm_set_audio_decode_callback(self: Pplm_t; fp: plm_audio_decode_callback; user: Pointer); cdecl; external;
procedure plm_decode(self: Pplm_t; seconds: Double); cdecl; external;
function  plm_decode_video(self: Pplm_t): Pplm_frame_t; cdecl; external;
function  plm_decode_audio(self: Pplm_t): Pplm_samples_t; cdecl; external;
function  plm_seek(self: Pplm_t; time: Double; seek_exact: Integer): Integer; cdecl; external;
function  plm_seek_frame(self: Pplm_t; time: Double; seek_exact: Integer): Pplm_frame_t; cdecl; external;
function  plm_buffer_create_with_filename(const filename: PUTF8Char): Pplm_buffer_t; cdecl; external;
function  plm_buffer_create_with_file(fh: PPointer; close_when_done: Integer): Pplm_buffer_t; cdecl; external;
function  plm_buffer_create_with_memory(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_buffer_t; cdecl; external;
function  plm_buffer_create_with_capacity(capacity: NativeUInt): Pplm_buffer_t; cdecl; external;
function  plm_buffer_create_for_appending(initial_capacity: NativeUInt): Pplm_buffer_t; cdecl; external;
procedure plm_buffer_destroy(self: Pplm_buffer_t); cdecl; external;
function  plm_buffer_write(self: Pplm_buffer_t; bytes: PUInt8; length: NativeUInt): NativeUInt; cdecl; external;
procedure plm_buffer_signal_end(self: Pplm_buffer_t); cdecl; external;
procedure plm_buffer_set_load_callback(self: Pplm_buffer_t; fp: plm_buffer_load_callback; user: Pointer); cdecl; external;
procedure plm_buffer_rewind(self: Pplm_buffer_t); cdecl; external;
function  plm_buffer_get_size(self: Pplm_buffer_t): NativeUInt; cdecl; external;
function  plm_buffer_get_remaining(self: Pplm_buffer_t): NativeUInt; cdecl; external;
function  plm_buffer_has_ended(self: Pplm_buffer_t): Integer; cdecl; external;
function  plm_demux_create(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_demux_t; cdecl; external;
procedure plm_demux_destroy(self: Pplm_demux_t); cdecl; external;
function  plm_demux_has_headers(self: Pplm_demux_t): Integer; cdecl; external;
function  plm_demux_probe(self: Pplm_demux_t; probesize: NativeUInt): Integer; cdecl; external;
function  plm_demux_get_num_video_streams(self: Pplm_demux_t): Integer; cdecl; external;
function  plm_demux_get_num_audio_streams(self: Pplm_demux_t): Integer; cdecl; external;
procedure plm_demux_rewind(self: Pplm_demux_t); cdecl; external;
function  plm_demux_has_ended(self: Pplm_demux_t): Integer; cdecl; external;
function  plm_demux_seek(self: Pplm_demux_t; time: Double; &type: Integer; force_intra: Integer): Pplm_packet_t; cdecl; external;
function  plm_demux_get_start_time(self: Pplm_demux_t; &type: Integer): Double; cdecl; external;
function  plm_demux_get_duration(self: Pplm_demux_t; &type: Integer): Double; cdecl; external;
function  plm_demux_decode(self: Pplm_demux_t): Pplm_packet_t; cdecl; external;
function  plm_video_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_video_t; cdecl; external;
procedure plm_video_destroy(self: Pplm_video_t); cdecl; external;
function  plm_video_has_header(self: Pplm_video_t): Integer; cdecl; external;
function  plm_video_get_framerate(self: Pplm_video_t): Double; cdecl; external;
function  plm_video_get_pixel_aspect_ratio(self: Pplm_video_t): Double; cdecl; external;
function  plm_video_get_width(self: Pplm_video_t): Integer; cdecl; external;
function  plm_video_get_height(self: Pplm_video_t): Integer; cdecl; external;
procedure plm_video_set_no_delay(self: Pplm_video_t; no_delay: Integer); cdecl; external;
function  plm_video_get_time(self: Pplm_video_t): Double; cdecl; external;
procedure plm_video_set_time(self: Pplm_video_t; time: Double); cdecl; external;
procedure plm_video_rewind(self: Pplm_video_t); cdecl; external;
function  plm_video_has_ended(self: Pplm_video_t): Integer; cdecl; external;
function  plm_video_decode(self: Pplm_video_t): Pplm_frame_t; cdecl; external;
procedure plm_frame_to_rgb(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl; external;
procedure plm_frame_to_bgr(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl; external;
procedure plm_frame_to_rgba(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl; external;
procedure plm_frame_to_bgra(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl; external;
procedure plm_frame_to_argb(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl; external;
procedure plm_frame_to_abgr(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl; external;
function  plm_audio_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_audio_t; cdecl; external;
procedure plm_audio_destroy(self: Pplm_audio_t); cdecl; external;
function  plm_audio_has_header(self: Pplm_audio_t): Integer; cdecl; external;
function  plm_audio_get_samplerate(self: Pplm_audio_t): Integer; cdecl; external;
function  plm_audio_get_time(self: Pplm_audio_t): Double; cdecl; external;
procedure plm_audio_set_time(self: Pplm_audio_t; time: Double); cdecl; external;
procedure plm_audio_rewind(self: Pplm_audio_t); cdecl; external;
function  plm_audio_has_ended(self: Pplm_audio_t): Integer; cdecl; external;
function  plm_audio_decode(self: Pplm_audio_t): Pplm_samples_t; cdecl; external;

implementation

{$L CPas.pl_mpeg.o}

end.
