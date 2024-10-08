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

unit CPas.RGFW;

{$I CPas.Defines.inc}

interface

uses
  WinApi.Windows,
  WinApi.MMSystem,
  CPas.CRtl;

const
  RGFW_TRUE = ( not (0));
  RGFW_FALSE = 0;
  RGFW_ALPHA = 128;
  RGFW_TRANSPARENT_WINDOW = (1 shl 9);
  RGFW_NO_BORDER = (1 shl 3);
  RGFW_NO_RESIZE = (1 shl 4);
  RGFW_ALLOW_DND = (1 shl 5);
  RGFW_HIDE_MOUSE = (1 shl 6);
  RGFW_FULLSCREEN = (1 shl 8);
  RGFW_CENTER = (1 shl 10);
  RGFW_OPENGL_SOFTWARE = (1 shl 11);
  RGFW_COCOA_MOVE_TO_RESOURCE_DIR = (1 shl 12);
  RGFW_SCALE_TO_MONITOR = (1 shl 13);
  RGFW_NO_INIT_API = (1 shl 2);
  RGFW_NO_GPU_RENDER = (1 shl 14);
  RGFW_NO_CPU_RENDER = (1 shl 15);
  RGFW_WINDOW_HIDE_ = (1 shl 16);
  RGFW_mouseLeft = 1;
  RGFW_mouseMiddle = 2;
  RGFW_mouseRight = 3;
  RGFW_mouseScrollUp = 4;
  RGFW_mouseScrollDown = 5;
  RGFW_MAX_PATH = 260;
  RGFW_MAX_DROPS = 260;
  RGFW_CAPSLOCK_ = (1 shl 1);
  RGFW_NUMLOCK_ = (1 shl 2);

const
  RGFW_keyPressed = 1;
  RGFW_keyReleased = 2;
  RGFW_mouseButtonPressed = 3;
  RGFW_mouseButtonReleased = 4;
  RGFW_mousePosChanged = 5;
  RGFW_jsButtonPressed = 6;
  RGFW_jsButtonReleased = 7;
  RGFW_jsAxisMove = 8;
  RGFW_windowMoved = 9;
  RGFW_windowResized = 10;
  RGFW_focusIn = 11;
  RGFW_focusOut = 12;
  RGFW_mouseEnter = 13;
  RGFW_mouseLeave = 14;
  RGFW_windowRefresh = 15;
  RGFW_quit = 16;
  RGFW_dnd = 17;
  RGFW_dnd_init = 18;

const
  RGFW_JS_A = 0;
  RGFW_JS_B = 1;
  RGFW_JS_Y = 2;
  RGFW_JS_X = 3;
  RGFW_JS_START = 9;
  RGFW_JS_SELECT = 8;
  RGFW_JS_HOME = 10;
  RGFW_JS_UP = 13;
  RGFW_JS_DOWN = 14;
  RGFW_JS_LEFT = 15;
  RGFW_JS_RIGHT = 16;
  RGFW_JS_L1 = 4;
  RGFW_JS_L2 = 5;
  RGFW_JS_R1 = 6;
  RGFW_JS_R2 = 7;

const
  RGFW_NEXT = -1;
  RGFW_NO_WAIT = 0;

const
  RGFW_GL_CORE = 0;
  RGFW_GL_COMPATIBILITY = 1;

const
  RGFW_KEY_NULL = 0;
  RGFW_Escape = 1;
  RGFW_F1 = 2;
  RGFW_F2 = 3;
  RGFW_F3 = 4;
  RGFW_F4 = 5;
  RGFW_F5 = 6;
  RGFW_F6 = 7;
  RGFW_F7 = 8;
  RGFW_F8 = 9;
  RGFW_F9 = 10;
  RGFW_F10 = 11;
  RGFW_F11 = 12;
  RGFW_F12 = 13;
  RGFW_Backtick = 14;
  RGFW_0 = 15;
  RGFW_1 = 16;
  RGFW_2 = 17;
  RGFW_3 = 18;
  RGFW_4 = 19;
  RGFW_5 = 20;
  RGFW_6 = 21;
  RGFW_7 = 22;
  RGFW_8 = 23;
  RGFW_9 = 24;
  RGFW_Minus = 25;
  RGFW_Equals = 26;
  RGFW_BackSpace = 27;
  RGFW_Tab = 28;
  RGFW_CapsLock = 29;
  RGFW_ShiftL = 30;
  RGFW_ControlL = 31;
  RGFW_AltL = 32;
  RGFW_SuperL = 33;
  RGFW_ShiftR = 34;
  RGFW_ControlR = 35;
  RGFW_AltR = 36;
  RGFW_SuperR = 37;
  RGFW_Space = 38;
  RGFW_a = 39;
  RGFW_b = 40;
  RGFW_c = 41;
  RGFW_d = 42;
  RGFW_e = 43;
  RGFW_f = 44;
  RGFW_g = 45;
  RGFW_h = 46;
  RGFW_i = 47;
  RGFW_j = 48;
  RGFW_k = 49;
  RGFW_l = 50;
  RGFW_m = 51;
  RGFW_n = 52;
  RGFW_o = 53;
  RGFW_p = 54;
  RGFW_q = 55;
  RGFW_r = 56;
  RGFW_s = 57;
  RGFW_t = 58;
  RGFW_u = 59;
  RGFW_v = 60;
  RGFW_w = 61;
  RGFW_x = 62;
  RGFW_y = 63;
  RGFW_z = 64;
  RGFW_Period = 65;
  RGFW_Comma = 66;
  RGFW_Slash = 67;
  RGFW_Bracket = 68;
  RGFW_CloseBracket = 69;
  RGFW_Semicolon = 70;
  RGFW_Return = 71;
  RGFW_Quote = 72;
  RGFW_BackSlash = 73;
  RGFW_Up = 74;
  RGFW_Down = 75;
  RGFW_Left = 76;
  RGFW_Right = 77;
  RGFW_Delete = 78;
  RGFW_Insert = 79;
  RGFW_End = 80;
  RGFW_Home = 81;
  RGFW_PageUp = 82;
  RGFW_PageDown = 83;
  RGFW_Numlock = 84;
  RGFW_KP_Slash = 85;
  RGFW_Multiply = 86;
  RGFW_KP_Minus = 87;
  RGFW_KP_1 = 88;
  RGFW_KP_2 = 89;
  RGFW_KP_3 = 90;
  RGFW_KP_4 = 91;
  RGFW_KP_5 = 92;
  RGFW_KP_6 = 93;
  RGFW_KP_7 = 94;
  RGFW_KP_8 = 95;
  RGFW_KP_9 = 96;
  RGFW_KP_0 = 97;
  RGFW_KP_Period = 98;
  RGFW_KP_Return = 99;
  final_key = 100;

const
  RGFW_MOUSE_NORMAL = 0;
  RGFW_MOUSE_ARROW = 1;
  RGFW_MOUSE_IBEAM = 2;
  RGFW_MOUSE_CROSSHAIR = 3;
  RGFW_MOUSE_POINTING_HAND = 4;
  RGFW_MOUSE_RESIZE_EW = 5;
  RGFW_MOUSE_RESIZE_NS = 6;
  RGFW_MOUSE_RESIZE_NWSE = 7;
  RGFW_MOUSE_RESIZE_NESW = 8;
  RGFW_MOUSE_RESIZE_ALL = 9;
  RGFW_MOUSE_NOT_ALLOWED = 10;

type
  // Forward declarations
  PPUTF8Char = ^PUTF8Char;
  PNativeUInt = ^NativeUInt;
  PRGFW_point = ^RGFW_point;
  PRGFW_rect = ^RGFW_rect;
  PRGFW_area = ^RGFW_area;
  PRGFW_monitor = ^RGFW_monitor;
  PRGFW_Event = ^RGFW_Event;
  PRGFW_window_src = ^RGFW_window_src;
  PRGFW_window = ^RGFW_window;

  u8 = UInt8;
  Pu8 = ^u8;
  i8 = Int8;
  u16 = UInt16;
  i16 = Int16;
  u32 = UInt32;
  i32 = Int32;
  u64 = UInt64;
  i64 = Int64;
  b8 = u8;
  b32 = u32;
  RGFW_event_types = u8;
  RGFW_joystick_codes = u8;

  RGFW_point = record
    x: i32;
    y: i32;
  end;

  RGFW_rect = record
    x: i32;
    y: i32;
    w: i32;
    h: i32;
  end;

  RGFW_area = record
    w: u32;
    h: u32;
  end;

  RGFW_monitor = record
    name: array [0..127] of UTF8Char;
    rect: RGFW_rect;
    scaleX: Single;
    scaleY: Single;
    physW: Single;
    physH: Single;
  end;

  RGFW_Event = record
    keyName: array [0..15] of UTF8Char;
    droppedFiles: PPUTF8Char;
    droppedFilesCount: u32;
    &type: u32;
    point: RGFW_point;
    keyCode: u8;
    &repeat: b8;
    inFocus: b8;
    lockState: u8;
    button: u8;
    scroll: Double;
    joystick: u16;
    axisesCount: u8;
    axis: array [0..1] of RGFW_point;
    frameTime: u64;
    frameTime2: u64;
  end;

  RGFW_window_src = record
    window: HWND;
    hdc: HDC;
    hOffset: u32;
    ctx: HGLRC;
    maxSize: RGFW_area;
    minSize: RGFW_area;
  end;

  RGFW_window = record
    src: RGFW_window_src;
    userPtr: Pointer;
    event: RGFW_Event;
    r: RGFW_rect;
    _lastMousePoint: RGFW_point;
    _winArgs: u32;
  end;

  RGFW_thread = Pointer;
  RGFW_eventWait = i32;

  RGFW_windowmovefunc = procedure(win: PRGFW_window; r: RGFW_rect); cdecl;
  RGFW_windowresizefunc = procedure(win: PRGFW_window; r: RGFW_rect); cdecl;
  RGFW_windowquitfunc = procedure(win: PRGFW_window); cdecl;
  RGFW_focusfunc = procedure(win: PRGFW_window; inFocus: b8); cdecl;
  RGFW_mouseNotifyfunc = procedure(win: PRGFW_window; point: RGFW_point; status: b8); cdecl;
  RGFW_mouseposfunc = procedure(win: PRGFW_window; point: RGFW_point); cdecl;
  RGFW_dndInitfunc = procedure(win: PRGFW_window; point: RGFW_point); cdecl;
  RGFW_windowrefreshfunc = procedure(win: PRGFW_window); cdecl;
  RGFW_keyfunc = procedure(win: PRGFW_window; keycode: u32; keyName: PUTF8Char; lockState: u8; pressed: b8); cdecl;
  RGFW_mousebuttonfunc = procedure(win: PRGFW_window; button: u8; scroll: Double; pressed: b8); cdecl;
  RGFW_jsButtonfunc = procedure(win: PRGFW_window; joystick: u16; button: u8; pressed: b8); cdecl;
  RGFW_jsAxisfunc = procedure(win: PRGFW_window; joystick: u16; axis: PRGFW_point; axisesCount: u8); cdecl;
  RGFW_dndfunc = procedure(win: PRGFW_window; droppedFiles: PPUTF8Char; droppedFilesCount: u32); cdecl;
  RGFW_threadFunc_ptr = function(lpThreadParameter: LPVOID): DWORD; cdecl;
  RGFW_GL_profile = u8;
  RGFW_Key = u8;
  RGFW_mouseIcons = u8;

function  RGFW_getMonitors(): PRGFW_monitor; cdecl; external;
function  RGFW_getPrimaryMonitor(): RGFW_monitor; cdecl; external;
procedure RGFW_setClassName(name: PUTF8Char); cdecl; external;
procedure RGFW_setBufferSize(size: RGFW_area); cdecl; external;
function  RGFW_createWindow(const name: PUTF8Char; rect: RGFW_rect; args: u16): PRGFW_window; cdecl; external;
function  RGFW_getScreenSize(): RGFW_area; cdecl; external;
function  RGFW_window_checkEvent(win: PRGFW_window): PRGFW_Event; cdecl; external;
procedure RGFW_window_eventWait(win: PRGFW_window; waitMS: i32); cdecl; external;
procedure RGFW_window_checkEvents(win: PRGFW_window; waitMS: i32); cdecl; external;
procedure RGFW_stopCheckEvents(); cdecl; external;
procedure RGFW_window_close(win: PRGFW_window); cdecl; external;
procedure RGFW_window_move(win: PRGFW_window; v: RGFW_point); cdecl; external;
procedure RGFW_window_moveToMonitor(win: PRGFW_window; m: RGFW_monitor); cdecl; external;
procedure RGFW_window_resize(win: PRGFW_window; a: RGFW_area); cdecl; external;
procedure RGFW_window_setMinSize(win: PRGFW_window; a: RGFW_area); cdecl; external;
procedure RGFW_window_setMaxSize(win: PRGFW_window; a: RGFW_area); cdecl; external;
procedure RGFW_window_maximize(win: PRGFW_window); cdecl; external;
procedure RGFW_window_minimize(win: PRGFW_window); cdecl; external;
procedure RGFW_window_restore(win: PRGFW_window); cdecl; external;
procedure RGFW_window_setBorder(win: PRGFW_window; border: b8); cdecl; external;
procedure RGFW_window_setDND(win: PRGFW_window; allow: b8); cdecl; external;
procedure RGFW_window_setMousePassthrough(win: PRGFW_window; passthrough: b8); cdecl; external;
procedure RGFW_window_setName(win: PRGFW_window; name: PUTF8Char); cdecl; external;
procedure RGFW_window_setIcon(win: PRGFW_window; icon: Pu8; a: RGFW_area; channels: i32); cdecl; external;
procedure RGFW_window_setMouse(win: PRGFW_window; image: Pu8; a: RGFW_area; channels: i32); cdecl; external;
procedure RGFW_window_setMouseStandard(win: PRGFW_window; mouse: u8); cdecl; external;
procedure RGFW_window_setMouseDefault(win: PRGFW_window); cdecl; external;
procedure RGFW_window_mouseHold(win: PRGFW_window; area: RGFW_area); cdecl; external;
procedure RGFW_window_mouseUnhold(win: PRGFW_window); cdecl; external;
procedure RGFW_window_hide(win: PRGFW_window); cdecl; external;
procedure RGFW_window_show(win: PRGFW_window); cdecl; external;
procedure RGFW_window_setShouldClose(win: PRGFW_window); cdecl; external;
function  RGFW_getGlobalMousePoint(): RGFW_point; cdecl; external;
function  RGFW_window_getMousePoint(win: PRGFW_window): RGFW_point; cdecl; external;
procedure RGFW_window_showMouse(win: PRGFW_window; show: i8); cdecl; external;
procedure RGFW_window_moveMouse(win: PRGFW_window; v: RGFW_point); cdecl; external;
function  RGFW_window_shouldClose(win: PRGFW_window): b8; cdecl; external;
function  RGFW_window_isFullscreen(win: PRGFW_window): b8; cdecl; external;
function  RGFW_window_isHidden(win: PRGFW_window): b8; cdecl; external;
function  RGFW_window_isMinimized(win: PRGFW_window): b8; cdecl; external;
function  RGFW_window_isMaximized(win: PRGFW_window): b8; cdecl; external;
procedure RGFW_window_scaleToMonitor(win: PRGFW_window); cdecl; external;
function  RGFW_window_getMonitor(win: PRGFW_window): RGFW_monitor; cdecl; external;
function  RGFW_shouldShift(keycode: u32; lockState: u8): b8; cdecl; external;
function  RGFW_keyCodeToChar(keycode: u32; shift: b8): UTF8Char; cdecl; external;
function  RGFW_keyCodeToCharAuto(keycode: u32; lockState: u8): UTF8Char; cdecl; external;
function  RGFW_isPressed(win: PRGFW_window; key: u8): b8; cdecl; external;
function  RGFW_wasPressed(win: PRGFW_window; key: u8): b8; cdecl; external;
function  RGFW_isHeld(win: PRGFW_window; key: u8): b8; cdecl; external;
function  RGFW_isReleased(win: PRGFW_window; key: u8): b8; cdecl; external;
function  RGFW_isClicked(win: PRGFW_window; key: u8): b8; cdecl; external;
function  RGFW_isMousePressed(win: PRGFW_window; button: u8): b8; cdecl; external;
function  RGFW_isMouseHeld(win: PRGFW_window; button: u8): b8; cdecl; external;
function  RGFW_isMouseReleased(win: PRGFW_window; button: u8): b8; cdecl; external;
function  RGFW_wasMousePressed(win: PRGFW_window; button: u8): b8; cdecl; external;
function  RGFW_readClipboard(size: PNativeUInt): PUTF8Char; cdecl; external;
procedure RGFW_clipboardFree(str: PUTF8Char); cdecl; external;
procedure RGFW_writeClipboard(const text: PUTF8Char; textLen: u32); cdecl; external;
function  RGFW_setWindowMoveCallback(func: RGFW_windowmovefunc): RGFW_windowmovefunc; cdecl; external;
function  RGFW_setWindowResizeCallback(func: RGFW_windowresizefunc): RGFW_windowresizefunc; cdecl; external;
function  RGFW_setWindowQuitCallback(func: RGFW_windowquitfunc): RGFW_windowquitfunc; cdecl; external;
function  RGFW_setMousePosCallback(func: RGFW_mouseposfunc): RGFW_mouseposfunc; cdecl; external;
function  RGFW_setWindowRefreshCallback(func: RGFW_windowrefreshfunc): RGFW_windowrefreshfunc; cdecl; external;
function  RGFW_setFocusCallback(func: RGFW_focusfunc): RGFW_focusfunc; cdecl; external;
function  RGFW_setMouseNotifyCallBack(func: RGFW_mouseNotifyfunc): RGFW_mouseNotifyfunc; cdecl; external;
function  RGFW_setDndCallback(func: RGFW_dndfunc): RGFW_dndfunc; cdecl; external;
function  RGFW_setDndInitCallback(func: RGFW_dndInitfunc): RGFW_dndInitfunc; cdecl; external;
function  RGFW_setKeyCallback(func: RGFW_keyfunc): RGFW_keyfunc; cdecl; external;
function  RGFW_setMouseButtonCallback(func: RGFW_mousebuttonfunc): RGFW_mousebuttonfunc; cdecl; external;
function  RGFW_setjsButtonCallback(func: RGFW_jsButtonfunc): RGFW_jsButtonfunc; cdecl; external;
function  RGFW_setjsAxisCallback(func: RGFW_jsAxisfunc): RGFW_jsAxisfunc; cdecl; external;
function  RGFW_createThread(ptr: RGFW_threadFunc_ptr; args: Pointer): RGFW_thread; cdecl; external;
procedure RGFW_cancelThread(thread: RGFW_thread); cdecl; external;
procedure RGFW_joinThread(thread: RGFW_thread); cdecl; external;
procedure RGFW_setThreadPriority(thread: RGFW_thread; priority: u8); cdecl; external;
function  RGFW_registerJoystick(win: PRGFW_window; jsNumber: i32): u16; cdecl; external;
function  RGFW_registerJoystickF(win: PRGFW_window; &file: PUTF8Char): u16; cdecl; external;
function  RGFW_isPressedJS(win: PRGFW_window; controller: u16; button: u8): u32; cdecl; external;
procedure RGFW_window_makeCurrent(win: PRGFW_window); cdecl; external;
function  RGFW_window_checkFPS(win: PRGFW_window; fpsCap: u32): u32; cdecl; external;
procedure RGFW_window_swapBuffers(win: PRGFW_window); cdecl; external;
procedure RGFW_window_swapInterval(win: PRGFW_window; swapInterval: i32); cdecl; external;
procedure RGFW_window_setGPURender(win: PRGFW_window; &set: i8); cdecl; external;
procedure RGFW_window_setCPURender(win: PRGFW_window; &set: i8); cdecl; external;
procedure RGFW_setGLStencil(stencil: i32); cdecl; external;
procedure RGFW_setGLSamples(samples: i32); cdecl; external;
procedure RGFW_setGLStereo(stereo: i32); cdecl; external;
procedure RGFW_setGLAuxBuffers(auxBuffers: i32); cdecl; external;
procedure RGFW_setGLVersion(profile: RGFW_GL_profile; major: i32; minor: i32); cdecl; external;
procedure RGFW_setDoubleBuffer(useDoubleBuffer: b8); cdecl; external;
function  RGFW_getProcAddress(const procname: PUTF8Char): Pointer; cdecl; external;
procedure RGFW_window_makeCurrent_OpenGL(win: PRGFW_window); cdecl; external;
function  RGFW_getTime(): u64; cdecl; external;
function  RGFW_getTimeNS(): u64; cdecl; external;
procedure RGFW_sleep(milisecond: u64); cdecl; external;

implementation

{$L CPas.RGFW.o}

end.
