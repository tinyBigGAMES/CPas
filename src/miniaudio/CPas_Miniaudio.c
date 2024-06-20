#define STB_VORBIS_HEADER_ONLY
#include "stb_vorbis.c"    // Enables Vorbis decoding.

#define MINIAUDIO_IMPLEMENTATION
//#define MA_DLL
#include "miniaudio.h"

// The stb_vorbis implementation must come after the implementation of miniaudio.
#undef STB_VORBIS_HEADER_ONLY
#include "stb_vorbis.c"