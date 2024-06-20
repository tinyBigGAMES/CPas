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

unit CPas.CRuntime;

{$I CPas.Defines.inc}

interface

uses
  WinApi.Windows;

const
  ucrtbase = 'ucrtbase.dll';
  ucrt = 'api-ms-win-crt-stdio-l1-1-0.dll';
  kernelbase = 'kernelbase.dll';
  msvcrt = 'msvcrt.dll';
  kernel32 = 'kernel32.dll';
  gdi32 = 'gdi32.dll';
  shell32 = 'shell32.dll';

type
  Size_t = NativeUInt;
  PSize_t = ^Size_t;
  errno_t = Integer;

  TDivResult = record
    quot: Integer;
    rem: Integer;
  end;

  POINTL = record
    x: Longint;
    y: Longint;
  end;

 PDevModeW = ^TDevModeW;
  TDevModeW = record
    dmDeviceName: array[0..CCHDEVICENAME - 1] of WCHAR;
    dmSpecVersion: WORD;
    dmDriverVersion: WORD;
    dmSize: WORD;
    dmDriverExtra: WORD;
    dmFields: DWORD;
    dmPosition: POINTL;
    dmDisplayOrientation: DWORD;
    dmDisplayFixedOutput: DWORD;
    dmColor: SHORT;
    dmDuplex: SHORT;
    dmYResolution: SHORT;
    dmTTOption: SHORT;
    dmCollate: SHORT;
    dmFormName: array[0..CCHFORMNAME - 1] of WCHAR;
    dmLogPixels: WORD;
    dmBitsPerPel: DWORD;
    dmPelsWidth: DWORD;
    dmPelsHeight: DWORD;
    dmDisplayFlags: DWORD;
    dmDisplayFrequency: DWORD;
    dmICMMethod: DWORD;
    dmICMIntent: DWORD;
    dmMediaType: DWORD;
    dmDitherType: DWORD;
    dmReserved1: DWORD;
    dmReserved2: DWORD;
    dmPanningWidth: DWORD;
    dmPanningHeight: DWORD;
  end;

  PMonitorInfo = ^TMonitorInfo;
  TMonitorInfo = record
    cbSize: DWORD;
    rcMonitor: TRECT;
    rcWork: TRECT;
    dwFlags: DWORD;
  end;

  LPRECT = ^TRECT;

  MONITORENUMPROC = function(hMonitor: HMONITOR; hdcMonitor: HDC; lprcMonitor: LPRECT; dwData: LPARAM): BOOL; stdcall;

  PRAWINPUTDEVICE = ^TRAWINPUTDEVICE;
  TRAWINPUTDEVICE = record
    usUsagePage: USHORT;
    usUsage: USHORT;
    dwFlags: DWORD;
    hwndTarget: HWND;
  end;

  PRAWINPUTDEVICELIST = ^TRAWINPUTDEVICELIST;
  TRAWINPUTDEVICELIST = record
    hDevice: THANDLE;
    dwType: DWORD;
  end;

  PWIN32_FILE_ATTRIBUTE_DATA = ^TWIN32_FILE_ATTRIBUTE_DATA;
  TWIN32_FILE_ATTRIBUTE_DATA = record
    dwFileAttributes: DWORD;
    ftCreationTime: FILETIME;
    ftLastAccessTime: FILETIME;
    ftLastWriteTime: FILETIME;
    nFileSizeHigh: DWORD;
    nFileSizeLow: DWORD;
  end;

  HRAWINPUT = THANDLE;

  HDROP = THandle;

  Ptm = ^Ttm;
  Ttm = record
    tm_sec: Integer;    // Seconds [0,60]
    tm_min: Integer;    // Minutes [0,59]
    tm_hour: Integer;   // Hour [0,23]
    tm_mday: Integer;   // Day of month [1,31]
    tm_mon: Integer;    // Month of year [0,11]
    tm_year: Integer;   // Years since 1900
    tm_wday: Integer;   // Day of week [0,6] (Sunday = 0)
    tm_yday: Integer;   // Day of year [0,365]
    tm_isdst: Integer;  // Daylight savings flag
  end;

//=== KERNELBASE ============================================================
procedure ___chkstk_ms; stdcall; external kernelbase name '__chkstk';

//=== UCRT ==================================================================
function _strtod_l(str: PAnsiChar; endptr: PPAnsiChar; locale: Pointer): Double; cdecl; external ucrt;
function _strtoi64_l(str: PAnsiChar; endptr: PPAnsiChar; base: Integer; locale: Pointer): Int64; cdecl; external ucrt;
function _strtoui64_l(str: PAnsiChar; endptr: PPAnsiChar; base: Integer; locale: Pointer): UInt64; cdecl; external ucrt;
function atof(str: PAnsiChar): Double; cdecl; external ucrt;
function atoi(str: PAnsiChar): Integer; cdecl; external ucrt;
function atol(str: PAnsiChar): Longint; cdecl; external ucrt;
function mbrtowc(pwc: PWideChar; s: PAnsiChar; n: Size_t; ps: Pointer): Size_t; cdecl; external ucrt;
function mbsrtowcs(pwc: PWideChar; src: PPAnsiChar; len: Size_t; ps: Pointer): Size_t; cdecl; external ucrt;
function strtof(str: PAnsiChar; endptr: PPAnsiChar): Single; cdecl; external ucrt;
function strtol(str: PAnsiChar; endptr: PPAnsiChar; base: Integer): Longint; cdecl; external ucrt;
function strtoll(str: PAnsiChar; endptr: PPAnsiChar; base: Integer): Int64; cdecl; external ucrt;
function strtoul(str: PAnsiChar; endptr: PPAnsiChar; base: Integer): Cardinal; cdecl; external ucrt;
function strtoull(str: PAnsiChar; endptr: PPAnsiChar; base: Integer): UInt64; cdecl; external ucrt;
function wcrtomb(s: PAnsiChar; wc: WideChar; ps: Pointer): Size_t; cdecl; external ucrt;
function wcrtomb_s(retval: PSize_t; dst: PAnsiChar; dstsz: Size_t; wc: WideChar; ps: Pointer): errno_t; cdecl; external ucrt;
function __p__environ: PPAnsiChar; cdecl; external ucrt;
function __p__wenviron: PPWideChar; cdecl; external ucrt;
function getenv(varname: PAnsiChar): PAnsiChar; cdecl; external ucrt;
procedure _aligned_free(memblock: Pointer); cdecl; external ucrt;
function _aligned_malloc(size: Size_t; alignment: Size_t): Pointer; cdecl; external ucrt;
function _set_new_mode(mode: Integer): Integer; cdecl; external ucrt;
function calloc(num: Size_t; size: Size_t): Pointer; cdecl; external ucrt;
procedure free(memblock: Pointer); cdecl; external ucrt;
function malloc(size: Size_t): Pointer; cdecl; external ucrt;
function realloc(memblock: Pointer; size: Size_t): Pointer; cdecl; external ucrt;
function ___lc_codepage_func: Cardinal; cdecl; external ucrt;
function ___mb_cur_max_func: Integer; cdecl; external ucrt;
function __pctype_func: Pointer; cdecl; external ucrt;
function _configthreadlocale(flags: Integer): Integer; cdecl; external ucrt;
function _create_locale(category: Integer; locale: PAnsiChar): Pointer; cdecl; external ucrt;
procedure _free_locale(locale: Pointer); cdecl; external ucrt;
function localeconv: PAnsiChar; cdecl; external ucrt;
function setlocale(category: Integer; locale: PAnsiChar): PAnsiChar; cdecl; external ucrt;
function __setusermatherr(func: Pointer): Pointer; cdecl; external ucrt;
function ceil(x: Double): Double; cdecl; external ucrt;
function ceilf(x: Single): Single; cdecl; external ucrt;
function cosf(x: Single): Single; cdecl; external ucrt;
function exp(x: Double): Double; cdecl; external ucrt;
function expf(x: Single): Single; cdecl; external ucrt;
function floor(x: Double): Double; cdecl; external ucrt;
function floorf(x: Single): Single; cdecl; external ucrt;
function ldexp(x: Double; exp: Integer): Double; cdecl; external ucrt;
function log1pf(x: Single): Single; cdecl; external ucrt;
function log2(x: Double): Double; cdecl; external ucrt;
function log2f(x: Single): Single; cdecl; external ucrt;
function logf(x: Single): Single; cdecl; external ucrt;
function powf(x: Single; y: Single): Single; cdecl; external ucrt;
function round(x: Double): Double; cdecl; external ucrt;
function roundf(x: Single): Single; cdecl; external ucrt;
function sinf(x: Single): Single; cdecl; external ucrt;
function tanhf(x: Single): Single; cdecl; external ucrt;
function memchr(ptr: Pointer; value: Integer; num: Size_t): Pointer; cdecl; external ucrt;
function memcmp(ptr1: Pointer; ptr2: Pointer; num: Size_t): Integer; cdecl; external ucrt;
function memcpy(dst: Pointer; src: Pointer; num: Size_t): Pointer; cdecl; external ucrt;
function memmove(dst: Pointer; src: Pointer; num: Size_t): Pointer; cdecl; external ucrt;
function strchr(str: PAnsiChar; character: Integer): PAnsiChar; cdecl; external ucrt;
function strrchr(str: PAnsiChar; character: Integer): PAnsiChar; cdecl; external ucrt;
function strstr(str1: PAnsiChar; str2: PAnsiChar): PAnsiChar; cdecl; external ucrt;
function memset(ptr: Pointer; value: Integer; num: Size_t): Pointer; cdecl; external ucrt;
function strcat(dst: PAnsiChar; src: PAnsiChar): PAnsiChar; cdecl; external ucrt;
function strcmp(str1: PAnsiChar; str2: PAnsiChar): Integer; cdecl; external ucrt;
function strcpy(dst: PAnsiChar; src: PAnsiChar): PAnsiChar; cdecl; external ucrt;
function strcspn(str1: PAnsiChar; str2: PAnsiChar): Size_t; cdecl; external ucrt;
function strlen(str: PAnsiChar): Size_t; cdecl; external ucrt;
function strncmp(str1: PAnsiChar; str2: PAnsiChar; num: Size_t): Integer; cdecl; external ucrt;
function strncpy(dst: PAnsiChar; src: PAnsiChar; num: Size_t): PAnsiChar; cdecl; external ucrt;
function strpbrk(str1: PAnsiChar; str2: PAnsiChar): PAnsiChar; cdecl; external ucrt;
function strspn(str1: PAnsiChar; str2: PAnsiChar): Size_t; cdecl; external ucrt;
function strtok(str: PAnsiChar; delimiters: PAnsiChar): PAnsiChar; cdecl; external ucrt;
function wcscmp(str1: PWideChar; str2: PWideChar): Integer; cdecl; external ucrt;
function wcscpy(dst: PWideChar; src: PWideChar): PWideChar; cdecl; external ucrt;
function wcslen(str: PWideChar): Size_t; cdecl; external ucrt;
function __p___argc: PInteger; cdecl; external ucrt;
function __p___argv: PPAnsiChar; cdecl; external ucrt;
function __p___wargv: PPWideChar; cdecl; external ucrt;
function __sys_nerr: PInteger; cdecl; external ucrt;
procedure _assert(expr: PAnsiChar; filename: PAnsiChar; lineno: Integer); cdecl; external ucrt;
function _beginthreadex(security: Pointer; stack_size: Cardinal; start_address: Pointer; arglist: Pointer; initflag: Cardinal; threadaddr: PCardinal): THandle; cdecl; external ucrt;
function _configure_narrow_argv(mode: Integer): Integer; cdecl; external ucrt;
function _configure_wide_argv(mode: Integer): Integer; cdecl; external ucrt;
procedure _crt_at_quick_exit(func: Pointer); cdecl; external ucrt;
procedure _crt_atexit(func: Pointer); cdecl; external ucrt;
procedure _endthreadex(retval: Cardinal); cdecl; external ucrt;
function _errno: PInteger; cdecl; external ucrt;
procedure _execute_onexit_table; cdecl; external ucrt;
procedure _exit(code: Integer); cdecl; external ucrt;
function _initialize_narrow_environment: Integer; cdecl; external ucrt;
function _initialize_onexit_table: Integer; cdecl; external ucrt;
function _initialize_wide_environment: Integer; cdecl; external ucrt;
procedure _initterm(var table: Pointer); cdecl; external ucrt;
function _register_onexit_function(table: Pointer; func: Pointer): Integer; cdecl; external ucrt;
procedure _wassert(expr: PWideChar; filename: PWideChar; lineno: Integer); cdecl; external ucrt;
procedure abort; cdecl; external ucrt;
procedure exit(code: Integer); cdecl; external ucrt;
procedure perror(str: PAnsiChar); cdecl; external ucrt;
function strerror(errnum: Integer): PAnsiChar; cdecl; external ucrt;
function strerror_s(buf: PAnsiChar; bufsz: Size_t; errnum: Integer): errno_t; cdecl; external ucrt;
function __acrt_iob_func: Pointer; cdecl; external ucrt;
function __stdio_common_vfprintf(options: UInt64; stream: Pointer; format: PAnsiChar; locale: Pointer; arglist: Pointer): Integer; cdecl; external ucrt;
function __stdio_common_vfwprintf(options: UInt64; stream: Pointer; format: PWideChar; locale: Pointer; arglist: Pointer): Integer; cdecl; external ucrt;
function __stdio_common_vsprintf(options: UInt64; buffer: PAnsiChar; buffer_count: Size_t; format: PAnsiChar; locale: Pointer; arglist: Pointer): Integer; cdecl; external ucrt;
function __stdio_common_vsscanf(options: UInt64; buffer: PAnsiChar; buffer_count: Size_t; format: PAnsiChar; locale: Pointer; arglist: Pointer): Integer; cdecl; external ucrt;
function _fileno(stream: Pointer): Integer; cdecl; external ucrt;
function _fseeki64(stream: Pointer; offset: Int64; origin: Integer): Integer; cdecl; external ucrt;
function _ftelli64(stream: Pointer): Int64; cdecl; external ucrt;
function _get_osfhandle(fd: Integer): THandle; cdecl; external ucrt;
function _setmode(fd: Integer; mode: Integer): Integer; cdecl; external ucrt;
function _wfopen(filename: PWideChar; mode: PWideChar): Pointer; cdecl; external ucrt;
function fclose(stream: Pointer): Integer; cdecl; external ucrt;
function feof(stream: Pointer): Integer; cdecl; external ucrt;
function ferror(stream: Pointer): Integer; cdecl; external ucrt;
function fflush(stream: Pointer): Integer; cdecl; external ucrt;
function fgetc(stream: Pointer): Integer; cdecl; external ucrt;
function fgets(str: PAnsiChar; num: Integer; stream: Pointer): PAnsiChar; cdecl; external ucrt;
function fopen(filename: PAnsiChar; mode: PAnsiChar): Pointer; cdecl; external ucrt;
function fread(ptr: Pointer; size: Size_t; count: Size_t; stream: Pointer): Size_t; cdecl; external ucrt;
function fseek(stream: Pointer; offset: Longint; origin: Integer): Integer; cdecl; external ucrt;
function ftell(stream: Pointer): Longint; cdecl; external ucrt;
function fwrite(ptr: Pointer; size: Size_t; count: Size_t; stream: Pointer): Size_t; cdecl; external ucrt;
function puts(str: PAnsiChar): Integer; cdecl; external ucrt;
procedure rewind(stream: Pointer); cdecl; external ucrt;
function ungetc(character: Integer; stream: Pointer): Integer; cdecl; external ucrt;
function __daylight: PInteger; cdecl; external ucrt;
function __timezone: PLongint; cdecl; external ucrt;
function __tzname: PPAnsiChar; cdecl; external ucrt;
function _time64(timer: PInt64): Int64; cdecl; external ucrt;
procedure _tzset; cdecl; external ucrt;
function acos(x: Double): Double; cdecl; external ucrt;
function acosf(x: Single): Single; cdecl; external ucrt;
function asinf(x: Single): Single; cdecl; external ucrt;
function atan2f(y: Single; x: Single): Single; cdecl; external ucrt;
function cos(x: Double): Double; cdecl; external ucrt;
function exp2f(x: Single): Single; cdecl; external ucrt;
function fmod(x: Double; y: Double): Double; cdecl; external ucrt;
function fmodf(x: Single; y: Single): Single; cdecl; external ucrt;
function frexp(x: Double; exp: PInteger): Double; cdecl; external ucrt;
function hypot(x: Double; y: Double): Double; cdecl; external ucrt;
function log(x: Double): Double; cdecl; external ucrt;
function pow(x: Double; y: Double): Double; cdecl; external ucrt;
function sin(x: Double): Double; cdecl; external ucrt;
function tan(x: Double): Double; cdecl; external ucrt;
function _access(path: PAnsiChar; mode: Integer): Integer; cdecl; external ucrt;
function _chdir(dir: PAnsiChar): Integer; cdecl; external ucrt;
function _findclose(findHandle: THandle): Integer; cdecl; external ucrt;
function _findfirst64i32(filespec: PAnsiChar; findfiledata: Pointer): THandle; cdecl; external ucrt;
function _findnext64i32(findHandle: THandle; findfiledata: Pointer): Integer; cdecl; external ucrt;
function _fullpath(absPath: PAnsiChar; relPath: PAnsiChar; maxLength: Size_t): PAnsiChar; cdecl; external ucrt;
function _stat64(path: PAnsiChar; buffer: Pointer): Integer; cdecl; external ucrt;
function &div(numer: Integer; denom: Integer): TDivResult; cdecl; external ucrt;
procedure qsort(base: Pointer; num: Size_t; size: Size_t; compar: Pointer); cdecl; external ucrt;
function rand: Integer; cdecl; external ucrt;
function atoll(str: PAnsiChar): Int64; cdecl; external ucrt;
function system(command: PAnsiChar): Integer; cdecl; external ucrt;
function _getcwd(buf: PAnsiChar; size: Size_t): PAnsiChar; cdecl; external ucrt;
function _findfirst64(const pattern: PAnsiChar; var finddata: TWin32FindData): IntPtr; cdecl; external ucrt;
function _findnext64(handle: IntPtr; var finddata: TWin32FindData): Integer; cdecl; external ucrt;
function putchar(c: Integer): Integer; cdecl; external ucrt;
function _localtime64(const time: PInt64): Ptm; cdecl; external ucrt name '_localtime64';
function _stricmp(const str1, str2: PAnsiChar): Integer; cdecl; external ucrt name '_stricmp';
function wcsrtombs(dest: PAnsiChar; src: PPWideChar; len: size_t; ps: Pointer): size_t; cdecl; external ucrt name 'wcsrtombs';



//=== MSVCRT ================================================================
function fprintf(stream: Pointer; fmt: PAnsiChar): Integer; cdecl varargs; external msvcrt;
function snprintf(buf: PAnsiChar; size: size_t; fmt: PAnsiChar): Integer; cdecl varargs; external msvcrt name '_snprintf';
function vprintf(fmt: PAnsiChar; args: va_list): Integer; cdecl; external msvcrt;
function vsnprintf(buf: PAnsiChar; size: size_t; fmt: PAnsiChar; args: va_list): Integer; cdecl; external msvcrt name '_vsnprintf';
function sqrtf(x: Single): Single; cdecl; external ucrt;
function printf(fmt: PAnsiChar): Integer; cdecl varargs; external msvcrt;
function sprintf(buf: PAnsiChar; fmt: PAnsiChar): Integer; cdecl varargs; external msvcrt;
function sscanf(buf: PAnsiChar; fmt: PAnsiChar): Integer; cdecl varargs; external msvcrt;

//=== KERNEL ================================================================
function GetModuleHandleExW(dwFlags: DWORD; lpModuleName: LPCWSTR; var phModule: HMODULE): BOOL; stdcall; external kernel32;

//=== GDI32 =================================================================

function DrawQueryFileW(pwszPath: LPCWSTR; pFileInformation: PWIN32_FILE_ATTRIBUTE_DATA): BOOL; stdcall; external gdi32;
function DrawQueryPoint(hdc: HDC; lppt: PPoint): BOOL; stdcall; external gdi32;
function GetRawInputData(hRawInput: HRAWINPUT; uiCommand: UINT; pData: Pointer; var pcbSize: UINT): UINT; stdcall; external user32;
procedure DrawFinish; stdcall; external gdi32;

//=== SHELL32 ===============================================================

procedure DragAcceptFiles(hwnd: HWND; fAccept: BOOL); stdcall; external shell32;
function DragQueryFileW(hDrop: HDROP; iFile: UINT; lpszFile: LPWSTR; cch: UINT): UINT; stdcall; external shell32;
function DragQueryPoint(hDrop: HDROP; var ppt: TPOINT): BOOL; stdcall; external shell32;
procedure DragFinish(hDrop: HDROP); stdcall; external shell32;

//=== USER32 ================================================================
function EnumDisplaySettingsExW(lpszDeviceName: LPCWSTR; iModeNum: DWORD; lpDevMode: PDevModeW; dwFlags: DWORD): BOOL; stdcall; external user32;
function GetMonitorInfoW(hMonitor: HMONITOR; lpmi: PMonitorInfo): BOOL; stdcall; external user32;
function MonitorFromWindow(hwnd: HWND; dwFlags: DWORD): HMONITOR; stdcall; external user32;
function EnumDisplayMonitors(hdc: HDC; lprcClip: PRect; lpfnEnum: MONITORENUMPROC; dwData: LPARAM): BOOL; stdcall; external user32;
function RegisterRawInputDevices(pRawInputDevices: PRAWINPUTDEVICE; uiNumDevices: UINT; cbSize: UINT): BOOL; stdcall; external user32;
function GetRawInputDeviceList(pRawInputDeviceList: PRAWINPUTDEVICELIST; var puiNumDevices: UINT; cbSize: UINT): UINT; stdcall; external user32;
function GetRawInputDeviceInfoA(hDevice: THANDLE; uiCommand: UINT; pData: Pointer; var pcbSize: UINT): UINT; stdcall; external user32;

implementation

end.
