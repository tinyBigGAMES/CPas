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

unit UTestbed;

interface

uses
  WinApi.Windows,
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,
  WinApi.OpenGL,
  CPas.RGFW,
  CPas.GLFW,
  CPas.miniaudio,
  CPas.pl_mpeg,
  CPas.stb_truetype,
  CPas.stb_image_write,
  CPas.raudio;

procedure RunTests();

implementation

type
  { TKeyStates }
  TKeyStates = class
  private
    FKeyStates: TDictionary<Word, Boolean>;
  public
    constructor Create;
    destructor Destroy; override;
    function KeyHit(AKey: Word): Boolean;
  end;

{ TKeyStates }
constructor TKeyStates.Create;
begin
  inherited Create;
  FKeyStates := TDictionary<Word, Boolean>.Create;
end;

destructor TKeyStates.Destroy;
begin
  FKeyStates.Free;
  inherited Destroy;
end;

function TKeyStates.KeyHit(AKey: Word): Boolean;
var
  LKeyState: Boolean;
  LPrevKeyState: Boolean;
begin
  // Get the current state of the key (True if pressed)
  LKeyState := (GetAsyncKeyState(AKey) and $8000) <> 0;

  // Get the previous state of the key; default to False if not found
  if not FKeyStates.TryGetValue(AKey, LPrevKeyState) then
    LPrevKeyState := False;

  // Key is considered 'hit' if it's currently pressed and was not pressed before
  Result := LKeyState and not LPrevKeyState;

  // Update the stored previous state
  FKeyStates.AddOrSetValue(AKey, LKeyState);
end;

procedure Pause();
begin
  WriteLn;
  Write('Press ENTER to continue...');
  ReadLn;
  WriteLn;
end;

procedure Test_RGFW();
var
  LWindow: PRGFW_Window;
  LRec: RGFW_RECT;
  LMonitor: RGFW_monitor;
begin
  RGFW_setGLVersion(RGFW_GL_COMPATIBILITY, 2, 1);

  LRec.x := 0;
  LRec.y := 0;
  LRec.w := 800;
  LRec.h := 600;
  LWindow := RGFW_createWindow('Test_RGFW', LRec, RGFW_CENTER or RGFW_SCALE_TO_MONITOR);
  RGFW_window_makeCurrent_OpenGL(LWindow);

  LMonitor := RGFW_getPrimaryMonitor();

  while RGFW_window_shouldClose(LWindow) = 0 do
  begin
    RGFW_window_eventWait(LWindow, RGFW_NEXT);
    while RGFW_window_checkEvent(LWindow) <> nil do
    begin
      case LWindow.event.&type of
        RGFW_windowMoved:
        begin
          writeln('window moved');
        end;

        RGFW_windowResized:
        begin
          writeln('window resized');
        end;

        RGFW_quit:
        begin
          writeln('quit');
        end;
      end;
    end;

    if RGFW_wasPressed(LWindow, RGFW_1) = 1 then
      RGFW_window_setShouldClose(LWindow);

    if RGFW_wasMousePressed(LWindow, RGFW_mouseMiddle) = 1 then
      RGFW_window_setShouldClose(LWindow);

    glClearColor(255, 0, 0, 255);
    glClear(GL_COLOR_BUFFER_BIT);
    RGFW_window_swapBuffers(LWindow);
  end;

  RGFW_window_close(LWindow);
end;

procedure Test_GLFW();
var
  LWindow: PGLFWwindow;
begin
  if glfwInit() <> GLFW_TRUE then
    Exit;

  LWindow := glfwCreateWindow(800, 600, 'Test_GLFW', nil, nil);
  if not Assigned(LWindow) then
  begin
    glfwTerminate();
    Exit;
  end;

  glfwMakeContextCurrent(LWindow);

  while glfwWindowShouldClose(LWindow) = GLFW_FALSE do
  begin
    glClearColor(0, 255, 0, 255);

    glClear(GL_COLOR_BUFFER_BIT);

    glfwSwapBuffers(LWindow);

    glfwPollEvents();
  end;

  glfwMakeContextCurrent(LWindow);
  glfwDestroyWindow(LWindow);

  glfwTerminate();
end;

procedure Test_miniaudio();
var
  LResult: ma_result;
  LEngine: ma_engine;
begin
  WriteLn(Format('miniaudio version: %s', [string(ma_version_string())]));
  WriteLn;

  LResult := ma_engine_init(nil, @LEngine);
  if LResult <> MA_SUCCESS then
  begin
    WriteLn('Failed to initialize audio engine.');
    Exit;
  end;

  ma_engine_play_sound(@LEngine, 'res\song01.ogg', nil);

  Write('Press ENTER to quit...');
  ReadLn;

  ma_engine_uninit(@LEngine);
end;


procedure Test_pl_mpeg01();
var
  plm: Pplm_t;
begin
  plm := plm_create_with_filename('res/sample01.mpg');
  if Assigned(plm) then
  begin
    writeln('video width: ', plm_get_width(plm));
    writeln('video height: ', plm_get_height(plm));
    plm_destroy(plm);
  end;
end;

procedure Test_stb_truetype();
const
  LCharMap: array[0..7] of AnsiChar = (' ', '.', ':', 'i', 'o', 'V', 'M', '@');
var
  LBuffer: TMemoryStream;
  LFont: stbtt_fontinfo;
  LBitmap: PByte;
  w,h,i,j,c, s: Integer;
begin
  c := Ord('J');
  s := 20;
  LBuffer := TMemoryStream.Create();
  LBuffer.LoadFromFile('res/font01.ttf');

  stbtt_InitFont(@LFont, LBuffer.Memory, stbtt_GetFontOffsetForIndex(LBuffer.Memory,0));
  LBitmap := stbtt_GetCodepointBitmap(@LFont, 0, stbtt_ScaleForPixelHeight(@LFont, s), c, @w, @h, nil, nil);


  for j := 0 to h-1 do
  begin
    for i := 0 to w-1 do
    begin
      Write(LCharMap[LBitmap[J * w + I] shr 5]);
    end;
    WriteLN;
  end;

  if stbi_write_png('image.png', w, h, 1, LBitmap, w) = 0 then
    writeln('bad news');

  stbtt_FreeBitmap(LBitmap, nil);

  LBuffer.Free();
end;


procedure Test_raudio();
var
  LKeyStates: TKeyStates;
  LMusic: Music;
  LSfx: Sound;
  LDone: Boolean;
begin
  LKeyStates := TKeyStates.Create();

  InitAudioDevice();

  LSfx := LoadSound('res\digthis.ogg');
  LMusic := LoadMusicStream('res\song01.ogg');
  PlayMusicStream(Lmusic);

  writeln;
  write('Press ESC to quit, "1" for sfx...');

  LDone := False;
  while not LDone do
  begin
    if LKeyStates.KeyHit(VK_ESCAPE) then
      LDone := True
    else
    if LKeyStates.KeyHit(Ord('1')) then
      PlaySound(LSfx);

    UpdateMusicStream(LMusic);
    Sleep(10);
  end;

  UnloadMusicStream(LMusic);
  UnloadSound(LSfx);
  CloseAudioDevice();
  LKeyStates.Free();
end;

procedure RunTests();
begin
  //Test_RGFW();
  //Test_GLFW();
  //Test_miniaudio();
  //Test_pl_mpeg01();
  //Test_stb_truetype();
  Test_raudio();
  Pause();
end;

end.
