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

unit CPas.raudio;

{$I CPas.Defines.inc}

interface

uses
  WinApi.Windows,
  CPas.CRtl;

const
  RAUDIO_STANDALONE = 1;

type
  // Forward declarations
  PWave = ^Wave;
  PAudioStream = ^AudioStream;
  PSound = ^Sound;
  PMusic = ^Music;

  AudioCallback = procedure(bufferData: Pointer; frames: Cardinal); cdecl;

  Wave = record
    frameCount: Cardinal;
    sampleRate: Cardinal;
    sampleSize: Cardinal;
    channels: Cardinal;
    data: Pointer;
  end;

  PrAudioBuffer = Pointer;
  PPrAudioBuffer = ^PrAudioBuffer;
  PrAudioProcessor = Pointer;
  PPrAudioProcessor = ^PrAudioProcessor;

  AudioStream = record
    buffer: PrAudioBuffer;
    processor: PrAudioProcessor;
    sampleRate: Cardinal;
    sampleSize: Cardinal;
    channels: Cardinal;
  end;

  Sound = record
    stream: AudioStream;
    frameCount: Cardinal;
  end;

  Music = record
    stream: AudioStream;
    frameCount: Cardinal;
    looping: Boolean;
    ctxType: Integer;
    ctxData: Pointer;
  end;

procedure InitAudioDevice(); cdecl; external;
procedure CloseAudioDevice(); cdecl; external;
function  IsAudioDeviceReady(): Boolean; cdecl; external;
procedure SetMasterVolume(volume: Single); cdecl; external;
function  GetMasterVolume(): Single; cdecl; external;
function  LoadWave(const fileName: PUTF8Char): Wave; cdecl; external;
function  LoadWaveFromMemory(const fileType: PUTF8Char; const fileData: PByte; dataSize: Integer): Wave; cdecl; external;
function  IsWaveReady(wave: Wave): Boolean; cdecl; external;
function  LoadSound(const fileName: PUTF8Char): Sound; cdecl; external;
function  LoadSoundFromWave(wave: Wave): Sound; cdecl; external;
function  LoadSoundAlias(source: Sound): Sound; cdecl; external;
function  IsSoundReady(sound: Sound): Boolean; cdecl; external;
procedure UpdateSound(sound: Sound; const data: Pointer; frameCount: Integer); cdecl; external;
procedure UnloadWave(wave: Wave); cdecl; external;
procedure UnloadSound(sound: Sound); cdecl; external;
procedure UnloadSoundAlias(alias: Sound); cdecl; external;
function  ExportWave(wave: Wave; const fileName: PUTF8Char): Boolean; cdecl; external;
function  ExportWaveAsCode(wave: Wave; const fileName: PUTF8Char): Boolean; cdecl; external;
procedure PlaySound(sound: Sound); cdecl; external;
procedure StopSound(sound: Sound); cdecl; external;
procedure PauseSound(sound: Sound); cdecl; external;
procedure ResumeSound(sound: Sound); cdecl; external;
function  IsSoundPlaying(sound: Sound): Boolean; cdecl; external;
procedure SetSoundVolume(sound: Sound; volume: Single); cdecl; external;
procedure SetSoundPitch(sound: Sound; pitch: Single); cdecl; external;
procedure SetSoundPan(sound: Sound; pan: Single); cdecl; external;
function  WaveCopy(wave: Wave): Wave; cdecl; external;
procedure WaveCrop(wave: PWave; initSample: Integer; finalSample: Integer); cdecl; external;
procedure WaveFormat(wave: PWave; sampleRate: Integer; sampleSize: Integer; channels: Integer); cdecl; external;
function  LoadWaveSamples(wave: Wave): PSingle; cdecl; external;
procedure UnloadWaveSamples(samples: PSingle); cdecl; external;
function  LoadMusicStream(const fileName: PUTF8Char): Music; cdecl; external;
function  LoadMusicStreamFromMemory(const fileType: PUTF8Char; const data: PByte; dataSize: Integer): Music; cdecl; external;
function  IsMusicReady(music: Music): Boolean; cdecl; external;
procedure UnloadMusicStream(music: Music); cdecl; external;
procedure PlayMusicStream(music: Music); cdecl; external;
function  IsMusicStreamPlaying(music: Music): Boolean; cdecl; external;
procedure UpdateMusicStream(music: Music); cdecl; external;
procedure StopMusicStream(music: Music); cdecl; external;
procedure PauseMusicStream(music: Music); cdecl; external;
procedure ResumeMusicStream(music: Music); cdecl; external;
procedure SeekMusicStream(music: Music; position: Single); cdecl; external;
procedure SetMusicVolume(music: Music; volume: Single); cdecl; external;
procedure SetMusicPitch(music: Music; pitch: Single); cdecl; external;
procedure SetMusicPan(sound: Music; pan: Single); cdecl; external;
function  GetMusicTimeLength(music: Music): Single; cdecl; external;
function  GetMusicTimePlayed(music: Music): Single; cdecl; external;
function  LoadAudioStream(sampleRate: Cardinal; sampleSize: Cardinal; channels: Cardinal): AudioStream; cdecl; external;
function  IsAudioStreamReady(stream: AudioStream): Boolean; cdecl; external;
procedure UnloadAudioStream(stream: AudioStream); cdecl; external;
procedure UpdateAudioStream(stream: AudioStream; const data: Pointer; samplesCount: Integer); cdecl; external;
function  IsAudioStreamProcessed(stream: AudioStream): Boolean; cdecl; external;
procedure PlayAudioStream(stream: AudioStream); cdecl; external;
procedure PauseAudioStream(stream: AudioStream); cdecl; external;
procedure ResumeAudioStream(stream: AudioStream); cdecl; external;
function  IsAudioStreamPlaying(stream: AudioStream): Boolean; cdecl; external;
procedure StopAudioStream(stream: AudioStream); cdecl; external;
procedure SetAudioStreamVolume(stream: AudioStream; volume: Single); cdecl; external;
procedure SetAudioStreamPitch(stream: AudioStream; pitch: Single); cdecl; external;
procedure SetAudioStreamPan(strean: AudioStream; pan: Single); cdecl; external;
procedure SetAudioStreamBufferSizeDefault(size: Integer); cdecl; external;
procedure SetAudioStreamCallback(stream: AudioStream; callback: AudioCallback); cdecl; external;
procedure AttachAudioStreamProcessor(stream: AudioStream; processor: AudioCallback); cdecl; external;
procedure DetachAudioStreamProcessor(stream: AudioStream; processor: AudioCallback); cdecl; external;
procedure AttachAudioMixedProcessor(processor: AudioCallback); cdecl; external;
procedure DetachAudioMixedProcessor(processor: AudioCallback); cdecl; external;

implementation

{$L CPas.raudio.o}

end.
