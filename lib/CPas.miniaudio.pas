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

unit CPas.miniaudio;

{$I CPas.Defines.inc}

interface

uses
  WinApi.Windows,
  CPas.CRtl;

const
  MA_VERSION_MAJOR = 0;
  MA_VERSION_MINOR = 11;
  MA_VERSION_REVISION = 21;
  MA_SIZEOF_PTR = 8;
  MA_TRUE = 1;
  MA_FALSE = 0;
  MA_SIZE_MAX = $FFFFFFFF;
  MA_SIMD_ALIGNMENT = 32;
  MA_MIN_CHANNELS = 1;
  MA_MAX_CHANNELS = 254;
  MA_MAX_FILTER_ORDER = 8;
  MA_MAX_LOG_CALLBACKS = 4;
  MA_CHANNEL_INDEX_NULL = 255;
  MA_DATA_SOURCE_SELF_MANAGED_RANGE_AND_LOOP_POINT = $00000001;
  MA_DATA_FORMAT_FLAG_EXCLUSIVE_MODE = (1 shl 1);
  MA_MAX_DEVICE_NAME_LENGTH = 255;
  MA_RESOURCE_MANAGER_MAX_JOB_THREAD_COUNT = 64;
  MA_MAX_NODE_BUS_COUNT = 254;
  MA_MAX_NODE_LOCAL_BUS_COUNT = 2;
  MA_NODE_BUS_COUNT_UNKNOWN = 255;
  MA_ENGINE_MAX_LISTENERS = 4;
  MA_SOUND_SOURCE_CHANNEL_COUNT = $FFFFFFFF;

type
  ma_log_level = Integer;
  Pma_log_level = ^ma_log_level;

const
  MA_LOG_LEVEL_DEBUG = 4;
  MA_LOG_LEVEL_INFO = 3;
  MA_LOG_LEVEL_WARNING = 2;
  MA_LOG_LEVEL_ERROR = 1;

type
  _ma_channel_position = Integer;
  P_ma_channel_position = ^_ma_channel_position;

const
  MA_CHANNEL_NONE = 0;
  MA_CHANNEL_MONO = 1;
  MA_CHANNEL_FRONT_LEFT = 2;
  MA_CHANNEL_FRONT_RIGHT = 3;
  MA_CHANNEL_FRONT_CENTER = 4;
  MA_CHANNEL_LFE = 5;
  MA_CHANNEL_BACK_LEFT = 6;
  MA_CHANNEL_BACK_RIGHT = 7;
  MA_CHANNEL_FRONT_LEFT_CENTER = 8;
  MA_CHANNEL_FRONT_RIGHT_CENTER = 9;
  MA_CHANNEL_BACK_CENTER = 10;
  MA_CHANNEL_SIDE_LEFT = 11;
  MA_CHANNEL_SIDE_RIGHT = 12;
  MA_CHANNEL_TOP_CENTER = 13;
  MA_CHANNEL_TOP_FRONT_LEFT = 14;
  MA_CHANNEL_TOP_FRONT_CENTER = 15;
  MA_CHANNEL_TOP_FRONT_RIGHT = 16;
  MA_CHANNEL_TOP_BACK_LEFT = 17;
  MA_CHANNEL_TOP_BACK_CENTER = 18;
  MA_CHANNEL_TOP_BACK_RIGHT = 19;
  MA_CHANNEL_AUX_0 = 20;
  MA_CHANNEL_AUX_1 = 21;
  MA_CHANNEL_AUX_2 = 22;
  MA_CHANNEL_AUX_3 = 23;
  MA_CHANNEL_AUX_4 = 24;
  MA_CHANNEL_AUX_5 = 25;
  MA_CHANNEL_AUX_6 = 26;
  MA_CHANNEL_AUX_7 = 27;
  MA_CHANNEL_AUX_8 = 28;
  MA_CHANNEL_AUX_9 = 29;
  MA_CHANNEL_AUX_10 = 30;
  MA_CHANNEL_AUX_11 = 31;
  MA_CHANNEL_AUX_12 = 32;
  MA_CHANNEL_AUX_13 = 33;
  MA_CHANNEL_AUX_14 = 34;
  MA_CHANNEL_AUX_15 = 35;
  MA_CHANNEL_AUX_16 = 36;
  MA_CHANNEL_AUX_17 = 37;
  MA_CHANNEL_AUX_18 = 38;
  MA_CHANNEL_AUX_19 = 39;
  MA_CHANNEL_AUX_20 = 40;
  MA_CHANNEL_AUX_21 = 41;
  MA_CHANNEL_AUX_22 = 42;
  MA_CHANNEL_AUX_23 = 43;
  MA_CHANNEL_AUX_24 = 44;
  MA_CHANNEL_AUX_25 = 45;
  MA_CHANNEL_AUX_26 = 46;
  MA_CHANNEL_AUX_27 = 47;
  MA_CHANNEL_AUX_28 = 48;
  MA_CHANNEL_AUX_29 = 49;
  MA_CHANNEL_AUX_30 = 50;
  MA_CHANNEL_AUX_31 = 51;
  MA_CHANNEL_LEFT = 2;
  MA_CHANNEL_RIGHT = 3;
  MA_CHANNEL_POSITION_COUNT = 52;

type
  ma_result = Integer;
  Pma_result = ^ma_result;

const
  MA_SUCCESS = 0;
  MA_ERROR = -1;
  MA_INVALID_ARGS = -2;
  MA_INVALID_OPERATION = -3;
  MA_OUT_OF_MEMORY = -4;
  MA_OUT_OF_RANGE = -5;
  MA_ACCESS_DENIED = -6;
  MA_DOES_NOT_EXIST = -7;
  MA_ALREADY_EXISTS = -8;
  MA_TOO_MANY_OPEN_FILES = -9;
  MA_INVALID_FILE = -10;
  MA_TOO_BIG = -11;
  MA_PATH_TOO_LONG = -12;
  MA_NAME_TOO_LONG = -13;
  MA_NOT_DIRECTORY = -14;
  MA_IS_DIRECTORY = -15;
  MA_DIRECTORY_NOT_EMPTY = -16;
  MA_AT_END = -17;
  MA_NO_SPACE = -18;
  MA_BUSY = -19;
  MA_IO_ERROR = -20;
  MA_INTERRUPT = -21;
  MA_UNAVAILABLE = -22;
  MA_ALREADY_IN_USE = -23;
  MA_BAD_ADDRESS = -24;
  MA_BAD_SEEK = -25;
  MA_BAD_PIPE = -26;
  MA_DEADLOCK = -27;
  MA_TOO_MANY_LINKS = -28;
  MA_NOT_IMPLEMENTED = -29;
  MA_NO_MESSAGE = -30;
  MA_BAD_MESSAGE = -31;
  MA_NO_DATA_AVAILABLE = -32;
  MA_INVALID_DATA = -33;
  MA_TIMEOUT = -34;
  MA_NO_NETWORK = -35;
  MA_NOT_UNIQUE = -36;
  MA_NOT_SOCKET = -37;
  MA_NO_ADDRESS = -38;
  MA_BAD_PROTOCOL = -39;
  MA_PROTOCOL_UNAVAILABLE = -40;
  MA_PROTOCOL_NOT_SUPPORTED = -41;
  MA_PROTOCOL_FAMILY_NOT_SUPPORTED = -42;
  MA_ADDRESS_FAMILY_NOT_SUPPORTED = -43;
  MA_SOCKET_NOT_SUPPORTED = -44;
  MA_CONNECTION_RESET = -45;
  MA_ALREADY_CONNECTED = -46;
  MA_NOT_CONNECTED = -47;
  MA_CONNECTION_REFUSED = -48;
  MA_NO_HOST = -49;
  MA_IN_PROGRESS = -50;
  MA_CANCELLED = -51;
  MA_MEMORY_ALREADY_MAPPED = -52;
  MA_CRC_MISMATCH = -100;
  MA_FORMAT_NOT_SUPPORTED = -200;
  MA_DEVICE_TYPE_NOT_SUPPORTED = -201;
  MA_SHARE_MODE_NOT_SUPPORTED = -202;
  MA_NO_BACKEND = -203;
  MA_NO_DEVICE = -204;
  MA_API_NOT_FOUND = -205;
  MA_INVALID_DEVICE_CONFIG = -206;
  MA_LOOP = -207;
  MA_BACKEND_NOT_ENABLED = -208;
  MA_DEVICE_NOT_INITIALIZED = -300;
  MA_DEVICE_ALREADY_INITIALIZED = -301;
  MA_DEVICE_NOT_STARTED = -302;
  MA_DEVICE_NOT_STOPPED = -303;
  MA_FAILED_TO_INIT_BACKEND = -400;
  MA_FAILED_TO_OPEN_BACKEND_DEVICE = -401;
  MA_FAILED_TO_START_BACKEND_DEVICE = -402;
  MA_FAILED_TO_STOP_BACKEND_DEVICE = -403;

type
  ma_stream_format = Integer;
  Pma_stream_format = ^ma_stream_format;

const
  ma_stream_format_pcm = 0;

type
  ma_stream_layout = Integer;
  Pma_stream_layout = ^ma_stream_layout;

const
  ma_stream_layout_interleaved = 0;
  ma_stream_layout_deinterleaved = 1;

type
  ma_dither_mode = Integer;
  Pma_dither_mode = ^ma_dither_mode;

const
  ma_dither_mode_none = 0;
  ma_dither_mode_rectangle = 1;
  ma_dither_mode_triangle = 2;

type
  ma_format = Integer;
  Pma_format = ^ma_format;

const
  ma_format_unknown = 0;
  ma_format_u8 = 1;
  ma_format_s16 = 2;
  ma_format_s24 = 3;
  ma_format_s32 = 4;
  ma_format_f32 = 5;
  ma_format_count = 6;

type
  ma_standard_sample_rate = Integer;
  Pma_standard_sample_rate = ^ma_standard_sample_rate;

const
  ma_standard_sample_rate_48000 = 48000;
  ma_standard_sample_rate_44100 = 44100;
  ma_standard_sample_rate_32000 = 32000;
  ma_standard_sample_rate_24000 = 24000;
  ma_standard_sample_rate_22050 = 22050;
  ma_standard_sample_rate_88200 = 88200;
  ma_standard_sample_rate_96000 = 96000;
  ma_standard_sample_rate_176400 = 176400;
  ma_standard_sample_rate_192000 = 192000;
  ma_standard_sample_rate_16000 = 16000;
  ma_standard_sample_rate_11025 = 11025;
  ma_standard_sample_rate_8000 = 8000;
  ma_standard_sample_rate_352800 = 352800;
  ma_standard_sample_rate_384000 = 384000;
  ma_standard_sample_rate_min = 8000;
  ma_standard_sample_rate_max = 384000;
  ma_standard_sample_rate_count = 14;

type
  ma_channel_mix_mode = Integer;
  Pma_channel_mix_mode = ^ma_channel_mix_mode;

const
  ma_channel_mix_mode_rectangular = 0;
  ma_channel_mix_mode_simple = 1;
  ma_channel_mix_mode_custom_weights = 2;
  ma_channel_mix_mode_default = 0;

type
  ma_standard_channel_map = Integer;
  Pma_standard_channel_map = ^ma_standard_channel_map;

const
  ma_standard_channel_map_microsoft = 0;
  ma_standard_channel_map_alsa = 1;
  ma_standard_channel_map_rfc3551 = 2;
  ma_standard_channel_map_flac = 3;
  ma_standard_channel_map_vorbis = 4;
  ma_standard_channel_map_sound4 = 5;
  ma_standard_channel_map_sndio = 6;
  ma_standard_channel_map_webaudio = 3;
  ma_standard_channel_map_default = 0;

type
  ma_performance_profile = Integer;
  Pma_performance_profile = ^ma_performance_profile;

const
  ma_performance_profile_low_latency = 0;
  ma_performance_profile_conservative = 1;

type
  ma_thread_priority = Integer;
  Pma_thread_priority = ^ma_thread_priority;

const
  ma_thread_priority_idle = -5;
  ma_thread_priority_lowest = -4;
  ma_thread_priority_low = -3;
  ma_thread_priority_normal = -2;
  ma_thread_priority_high = -1;
  ma_thread_priority_highest = 0;
  ma_thread_priority_realtime = 1;
  ma_thread_priority_default = 0;

type
  ma_pan_mode = Integer;
  Pma_pan_mode = ^ma_pan_mode;

const
  ma_pan_mode_balance = 0;
  ma_pan_mode_pan = 1;

type
  ma_attenuation_model = Integer;
  Pma_attenuation_model = ^ma_attenuation_model;

const
  ma_attenuation_model_none = 0;
  ma_attenuation_model_inverse = 1;
  ma_attenuation_model_linear = 2;
  ma_attenuation_model_exponential = 3;

type
  ma_positioning = Integer;
  Pma_positioning = ^ma_positioning;

const
  ma_positioning_absolute = 0;
  ma_positioning_relative = 1;

type
  ma_handedness = Integer;
  Pma_handedness = ^ma_handedness;

const
  ma_handedness_right = 0;
  ma_handedness_left = 1;

type
  ma_resample_algorithm = Integer;
  Pma_resample_algorithm = ^ma_resample_algorithm;

const
  ma_resample_algorithm_linear = 0;
  ma_resample_algorithm_custom = 1;

type
  ma_channel_conversion_path = Integer;
  Pma_channel_conversion_path = ^ma_channel_conversion_path;

const
  ma_channel_conversion_path_unknown = 0;
  ma_channel_conversion_path_passthrough = 1;
  ma_channel_conversion_path_mono_out = 2;
  ma_channel_conversion_path_mono_in = 3;
  ma_channel_conversion_path_shuffle = 4;
  ma_channel_conversion_path_weights = 5;

type
  ma_mono_expansion_mode = Integer;
  Pma_mono_expansion_mode = ^ma_mono_expansion_mode;

const
  ma_mono_expansion_mode_duplicate = 0;
  ma_mono_expansion_mode_average = 1;
  ma_mono_expansion_mode_stereo_only = 2;
  ma_mono_expansion_mode_default = 0;

type
  ma_data_converter_execution_path = Integer;
  Pma_data_converter_execution_path = ^ma_data_converter_execution_path;

const
  ma_data_converter_execution_path_passthrough = 0;
  ma_data_converter_execution_path_format_only = 1;
  ma_data_converter_execution_path_channels_only = 2;
  ma_data_converter_execution_path_resample_only = 3;
  ma_data_converter_execution_path_resample_first = 4;
  ma_data_converter_execution_path_channels_first = 5;

type
  ma_job_type = Integer;
  Pma_job_type = ^ma_job_type;

const
  MA_JOB_TYPE_QUIT = 0;
  MA_JOB_TYPE_CUSTOM = 1;
  MA_JOB_TYPE_RESOURCE_MANAGER_LOAD_DATA_BUFFER_NODE = 2;
  MA_JOB_TYPE_RESOURCE_MANAGER_FREE_DATA_BUFFER_NODE = 3;
  MA_JOB_TYPE_RESOURCE_MANAGER_PAGE_DATA_BUFFER_NODE = 4;
  MA_JOB_TYPE_RESOURCE_MANAGER_LOAD_DATA_BUFFER = 5;
  MA_JOB_TYPE_RESOURCE_MANAGER_FREE_DATA_BUFFER = 6;
  MA_JOB_TYPE_RESOURCE_MANAGER_LOAD_DATA_STREAM = 7;
  MA_JOB_TYPE_RESOURCE_MANAGER_FREE_DATA_STREAM = 8;
  MA_JOB_TYPE_RESOURCE_MANAGER_PAGE_DATA_STREAM = 9;
  MA_JOB_TYPE_RESOURCE_MANAGER_SEEK_DATA_STREAM = 10;
  MA_JOB_TYPE_DEVICE_AAUDIO_REROUTE = 11;
  MA_JOB_TYPE_COUNT = 12;

type
  ma_job_queue_flags = Integer;
  Pma_job_queue_flags = ^ma_job_queue_flags;

const
  MA_JOB_QUEUE_FLAG_NON_BLOCKING = 1;

const
  MA_JOB_TYPE_RESOURCE_MANAGER_QUEUE_FLAG_NON_BLOCKING = MA_JOB_QUEUE_FLAG_NON_BLOCKING;

type
  ma_device_state = Integer;
  Pma_device_state = ^ma_device_state;

const
  ma_device_state_uninitialized = 0;
  ma_device_state_stopped = 1;
  ma_device_state_started = 2;
  ma_device_state_starting = 3;
  ma_device_state_stopping = 4;

type
  ma_backend = Integer;
  Pma_backend = ^ma_backend;

const
  ma_backend_wasapi = 0;
  ma_backend_dsound = 1;
  ma_backend_winmm = 2;
  ma_backend_coreaudio = 3;
  ma_backend_sndio = 4;
  ma_backend_audio4 = 5;
  ma_backend_oss = 6;
  ma_backend_pulseaudio = 7;
  ma_backend_alsa = 8;
  ma_backend_jack = 9;
  ma_backend_aaudio = 10;
  ma_backend_opensl = 11;
  ma_backend_webaudio = 12;
  ma_backend_custom = 13;
  ma_backend_null = 14;

type
  ma_device_notification_type = Integer;
  Pma_device_notification_type = ^ma_device_notification_type;

const
  ma_device_notification_type_started = 0;
  ma_device_notification_type_stopped = 1;
  ma_device_notification_type_rerouted = 2;
  ma_device_notification_type_interruption_began = 3;
  ma_device_notification_type_interruption_ended = 4;
  ma_device_notification_type_unlocked = 5;

type
  ma_device_type = Integer;
  Pma_device_type = ^ma_device_type;

const
  ma_device_type_playback = 1;
  ma_device_type_capture = 2;
  ma_device_type_duplex = 3;
  ma_device_type_loopback = 4;

type
  ma_share_mode = Integer;
  Pma_share_mode = ^ma_share_mode;

const
  ma_share_mode_shared = 0;
  ma_share_mode_exclusive = 1;

type
  ma_ios_session_category = Integer;
  Pma_ios_session_category = ^ma_ios_session_category;

const
  ma_ios_session_category_default = 0;
  ma_ios_session_category_none = 1;
  ma_ios_session_category_ambient = 2;
  ma_ios_session_category_solo_ambient = 3;
  ma_ios_session_category_playback = 4;
  ma_ios_session_category_record = 5;
  ma_ios_session_category_play_and_record = 6;
  ma_ios_session_category_multi_route = 7;

type
  ma_ios_session_category_option = Integer;
  Pma_ios_session_category_option = ^ma_ios_session_category_option;

const
  ma_ios_session_category_option_mix_with_others = 1;
  ma_ios_session_category_option_duck_others = 2;
  ma_ios_session_category_option_allow_bluetooth = 4;
  ma_ios_session_category_option_default_to_speaker = 8;
  ma_ios_session_category_option_interrupt_spoken_audio_and_mix_with_others = 17;
  ma_ios_session_category_option_allow_bluetooth_a2dp = 32;
  ma_ios_session_category_option_allow_air_play = 64;

type
  ma_opensl_stream_type = Integer;
  Pma_opensl_stream_type = ^ma_opensl_stream_type;

const
  ma_opensl_stream_type_default = 0;
  ma_opensl_stream_type_voice = 1;
  ma_opensl_stream_type_system = 2;
  ma_opensl_stream_type_ring = 3;
  ma_opensl_stream_type_media = 4;
  ma_opensl_stream_type_alarm = 5;
  ma_opensl_stream_type_notification = 6;

type
  ma_opensl_recording_preset = Integer;
  Pma_opensl_recording_preset = ^ma_opensl_recording_preset;

const
  ma_opensl_recording_preset_default = 0;
  ma_opensl_recording_preset_generic = 1;
  ma_opensl_recording_preset_camcorder = 2;
  ma_opensl_recording_preset_voice_recognition = 3;
  ma_opensl_recording_preset_voice_communication = 4;
  ma_opensl_recording_preset_voice_unprocessed = 5;

type
  ma_wasapi_usage = Integer;
  Pma_wasapi_usage = ^ma_wasapi_usage;

const
  ma_wasapi_usage_default = 0;
  ma_wasapi_usage_games = 1;
  ma_wasapi_usage_pro_audio = 2;

type
  ma_aaudio_usage = Integer;
  Pma_aaudio_usage = ^ma_aaudio_usage;

const
  ma_aaudio_usage_default = 0;
  ma_aaudio_usage_media = 1;
  ma_aaudio_usage_voice_communication = 2;
  ma_aaudio_usage_voice_communication_signalling = 3;
  ma_aaudio_usage_alarm = 4;
  ma_aaudio_usage_notification = 5;
  ma_aaudio_usage_notification_ringtone = 6;
  ma_aaudio_usage_notification_event = 7;
  ma_aaudio_usage_assistance_accessibility = 8;
  ma_aaudio_usage_assistance_navigation_guidance = 9;
  ma_aaudio_usage_assistance_sonification = 10;
  ma_aaudio_usage_game = 11;
  ma_aaudio_usage_assitant = 12;
  ma_aaudio_usage_emergency = 13;
  ma_aaudio_usage_safety = 14;
  ma_aaudio_usage_vehicle_status = 15;
  ma_aaudio_usage_announcement = 16;

type
  ma_aaudio_content_type = Integer;
  Pma_aaudio_content_type = ^ma_aaudio_content_type;

const
  ma_aaudio_content_type_default = 0;
  ma_aaudio_content_type_speech = 1;
  ma_aaudio_content_type_music = 2;
  ma_aaudio_content_type_movie = 3;
  ma_aaudio_content_type_sonification = 4;

type
  ma_aaudio_input_preset = Integer;
  Pma_aaudio_input_preset = ^ma_aaudio_input_preset;

const
  ma_aaudio_input_preset_default = 0;
  ma_aaudio_input_preset_generic = 1;
  ma_aaudio_input_preset_camcorder = 2;
  ma_aaudio_input_preset_voice_recognition = 3;
  ma_aaudio_input_preset_voice_communication = 4;
  ma_aaudio_input_preset_unprocessed = 5;
  ma_aaudio_input_preset_voice_performance = 6;

type
  ma_aaudio_allowed_capture_policy = Integer;
  Pma_aaudio_allowed_capture_policy = ^ma_aaudio_allowed_capture_policy;

const
  ma_aaudio_allow_capture_default = 0;
  ma_aaudio_allow_capture_by_all = 1;
  ma_aaudio_allow_capture_by_system = 2;
  ma_aaudio_allow_capture_by_none = 3;

type
  ma_open_mode_flags = Integer;
  Pma_open_mode_flags = ^ma_open_mode_flags;

const
  MA_OPEN_MODE_READ = 1;
  MA_OPEN_MODE_WRITE = 2;

type
  ma_seek_origin = Integer;
  Pma_seek_origin = ^ma_seek_origin;

const
  ma_seek_origin_start = 0;
  ma_seek_origin_current = 1;
  ma_seek_origin_end = 2;

type
  ma_encoding_format = Integer;
  Pma_encoding_format = ^ma_encoding_format;

const
  ma_encoding_format_unknown = 0;
  ma_encoding_format_wav = 1;
  ma_encoding_format_flac = 2;
  ma_encoding_format_mp3 = 3;
  ma_encoding_format_vorbis = 4;

type
  ma_waveform_type = Integer;
  Pma_waveform_type = ^ma_waveform_type;

const
  ma_waveform_type_sine = 0;
  ma_waveform_type_square = 1;
  ma_waveform_type_triangle = 2;
  ma_waveform_type_sawtooth = 3;

type
  ma_noise_type = Integer;
  Pma_noise_type = ^ma_noise_type;

const
  ma_noise_type_white = 0;
  ma_noise_type_pink = 1;
  ma_noise_type_brownian = 2;

type
  ma_resource_manager_data_source_flags = Integer;
  Pma_resource_manager_data_source_flags = ^ma_resource_manager_data_source_flags;

const
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_STREAM = 1;
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_DECODE = 2;
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_ASYNC = 4;
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_WAIT_INIT = 8;
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_UNKNOWN_LENGTH = 16;

type
  ma_resource_manager_flags = Integer;
  Pma_resource_manager_flags = ^ma_resource_manager_flags;

const
  MA_RESOURCE_MANAGER_FLAG_NON_BLOCKING = 1;
  MA_RESOURCE_MANAGER_FLAG_NO_THREADING = 2;

type
  ma_resource_manager_data_supply_type = Integer;
  Pma_resource_manager_data_supply_type = ^ma_resource_manager_data_supply_type;

const
  ma_resource_manager_data_supply_type_unknown = 0;
  ma_resource_manager_data_supply_type_encoded = 1;
  ma_resource_manager_data_supply_type_decoded = 2;
  ma_resource_manager_data_supply_type_decoded_paged = 3;

type
  ma_node_flags = Integer;
  Pma_node_flags = ^ma_node_flags;

const
  MA_NODE_FLAG_PASSTHROUGH = 1;
  MA_NODE_FLAG_CONTINUOUS_PROCESSING = 2;
  MA_NODE_FLAG_ALLOW_NULL_INPUT = 4;
  MA_NODE_FLAG_DIFFERENT_PROCESSING_RATES = 8;
  MA_NODE_FLAG_SILENT_OUTPUT = 16;

type
  ma_node_state = Integer;
  Pma_node_state = ^ma_node_state;

const
  ma_node_state_started = 0;
  ma_node_state_stopped = 1;

type
  ma_sound_flags = Integer;
  Pma_sound_flags = ^ma_sound_flags;

const
  MA_SOUND_FLAG_STREAM = 1;
  MA_SOUND_FLAG_DECODE = 2;
  MA_SOUND_FLAG_ASYNC = 4;
  MA_SOUND_FLAG_WAIT_INIT = 8;
  MA_SOUND_FLAG_UNKNOWN_LENGTH = 16;
  MA_SOUND_FLAG_NO_DEFAULT_ATTACHMENT = 4096;
  MA_SOUND_FLAG_NO_PITCH = 8192;
  MA_SOUND_FLAG_NO_SPATIALIZATION = 16384;

type
  ma_engine_node_type = Integer;
  Pma_engine_node_type = ^ma_engine_node_type;

const
  ma_engine_node_type_sound = 0;
  ma_engine_node_type_group = 1;

type
  // Forward declarations
  PPSingle = ^PSingle;
  PPDouble = ^PDouble;
  PNativeUInt = ^NativeUInt;
  PWideChar = ^WideChar;
  Pma_allocation_callbacks = ^ma_allocation_callbacks;
  Pma_lcg = ^ma_lcg;
  Pma_atomic_uint32 = ^ma_atomic_uint32;
  Pma_atomic_int32 = ^ma_atomic_int32;
  Pma_atomic_uint64 = ^ma_atomic_uint64;
  Pma_atomic_float = ^ma_atomic_float;
  Pma_atomic_bool32 = ^ma_atomic_bool32;
  Pma_log_callback = ^ma_log_callback;
  Pma_log = ^ma_log;
  Pma_biquad_config = ^ma_biquad_config;
  Pma_biquad = ^ma_biquad;
  Pma_lpf1_config = ^ma_lpf1_config;
  Pma_lpf1 = ^ma_lpf1;
  Pma_lpf2 = ^ma_lpf2;
  Pma_lpf_config = ^ma_lpf_config;
  Pma_lpf = ^ma_lpf;
  Pma_hpf1_config = ^ma_hpf1_config;
  Pma_hpf1 = ^ma_hpf1;
  Pma_hpf2 = ^ma_hpf2;
  Pma_hpf_config = ^ma_hpf_config;
  Pma_hpf = ^ma_hpf;
  Pma_bpf2_config = ^ma_bpf2_config;
  Pma_bpf2 = ^ma_bpf2;
  Pma_bpf_config = ^ma_bpf_config;
  Pma_bpf = ^ma_bpf;
  Pma_notch2_config = ^ma_notch2_config;
  Pma_notch2 = ^ma_notch2;
  Pma_peak2_config = ^ma_peak2_config;
  Pma_peak2 = ^ma_peak2;
  Pma_loshelf2_config = ^ma_loshelf2_config;
  Pma_loshelf2 = ^ma_loshelf2;
  Pma_hishelf2_config = ^ma_hishelf2_config;
  Pma_hishelf2 = ^ma_hishelf2;
  Pma_delay_config = ^ma_delay_config;
  Pma_delay = ^ma_delay;
  Pma_gainer_config = ^ma_gainer_config;
  Pma_gainer = ^ma_gainer;
  Pma_panner_config = ^ma_panner_config;
  Pma_panner = ^ma_panner;
  Pma_fader_config = ^ma_fader_config;
  Pma_fader = ^ma_fader;
  Pma_vec3f = ^ma_vec3f;
  Pma_atomic_vec3f = ^ma_atomic_vec3f;
  Pma_spatializer_listener_config = ^ma_spatializer_listener_config;
  Pma_spatializer_listener = ^ma_spatializer_listener;
  Pma_spatializer_config = ^ma_spatializer_config;
  Pma_spatializer = ^ma_spatializer;
  Pma_linear_resampler_config = ^ma_linear_resampler_config;
  Pma_linear_resampler = ^ma_linear_resampler;
  Pma_resampling_backend_vtable = ^ma_resampling_backend_vtable;
  Pma_resampler_config = ^ma_resampler_config;
  Pma_resampler = ^ma_resampler;
  Pma_channel_converter_config = ^ma_channel_converter_config;
  Pma_channel_converter = ^ma_channel_converter;
  Pma_data_converter_config = ^ma_data_converter_config;
  Pma_data_converter = ^ma_data_converter;
  Pma_data_source_vtable = ^ma_data_source_vtable;
  Pma_data_source_config = ^ma_data_source_config;
  Pma_data_source_base = ^ma_data_source_base;
  Pma_audio_buffer_ref = ^ma_audio_buffer_ref;
  Pma_audio_buffer_config = ^ma_audio_buffer_config;
  Pma_audio_buffer = ^ma_audio_buffer;
  PPma_audio_buffer = ^Pma_audio_buffer;
  Pma_paged_audio_buffer_page = ^ma_paged_audio_buffer_page;
  PPma_paged_audio_buffer_page = ^Pma_paged_audio_buffer_page;
  Pma_paged_audio_buffer_data = ^ma_paged_audio_buffer_data;
  Pma_paged_audio_buffer_config = ^ma_paged_audio_buffer_config;
  Pma_paged_audio_buffer = ^ma_paged_audio_buffer;
  Pma_rb = ^ma_rb;
  Pma_pcm_rb = ^ma_pcm_rb;
  Pma_duplex_rb = ^ma_duplex_rb;
  Pma_fence = ^ma_fence;
  Pma_async_notification_callbacks = ^ma_async_notification_callbacks;
  Pma_async_notification_poll = ^ma_async_notification_poll;
  Pma_async_notification_event = ^ma_async_notification_event;
  Pma_slot_allocator_config = ^ma_slot_allocator_config;
  Pma_slot_allocator_group = ^ma_slot_allocator_group;
  Pma_slot_allocator = ^ma_slot_allocator;
  Pma_job = ^ma_job;
  Pma_job_queue_config = ^ma_job_queue_config;
  Pma_job_queue = ^ma_job_queue;
  Pma_atomic_device_state = ^ma_atomic_device_state;
  Pma_IMMNotificationClient = ^ma_IMMNotificationClient;
  Pma_device_job_thread_config = ^ma_device_job_thread_config;
  Pma_device_job_thread = ^ma_device_job_thread;
  Pma_device_notification = ^ma_device_notification;
  Pma_device_info = ^ma_device_info;
  PPma_device_info = ^Pma_device_info;
  Pma_device_config = ^ma_device_config;
  Pma_device_descriptor = ^ma_device_descriptor;
  Pma_backend_callbacks = ^ma_backend_callbacks;
  Pma_context_config = ^ma_context_config;
  Pma_context_command__wasapi = ^ma_context_command__wasapi;
  Pma_context = ^ma_context;
  Pma_device = ^ma_device;
  Pma_file_info = ^ma_file_info;
  Pma_vfs_callbacks = ^ma_vfs_callbacks;
  Pma_default_vfs = ^ma_default_vfs;
  Pma_decoding_backend_config = ^ma_decoding_backend_config;
  Pma_decoding_backend_vtable = ^ma_decoding_backend_vtable;
  PPma_decoding_backend_vtable = ^Pma_decoding_backend_vtable;
  Pma_decoder_config = ^ma_decoder_config;
  Pma_decoder = ^ma_decoder;
  Pma_encoder_config = ^ma_encoder_config;
  Pma_encoder = ^ma_encoder;
  Pma_waveform_config = ^ma_waveform_config;
  Pma_waveform = ^ma_waveform;
  Pma_pulsewave_config = ^ma_pulsewave_config;
  Pma_pulsewave = ^ma_pulsewave;
  Pma_noise_config = ^ma_noise_config;
  Pma_noise = ^ma_noise;
  Pma_resource_manager_pipeline_stage_notification = ^ma_resource_manager_pipeline_stage_notification;
  Pma_resource_manager_pipeline_notifications = ^ma_resource_manager_pipeline_notifications;
  Pma_resource_manager_data_source_config = ^ma_resource_manager_data_source_config;
  Pma_resource_manager_data_supply = ^ma_resource_manager_data_supply;
  Pma_resource_manager_data_buffer_node = ^ma_resource_manager_data_buffer_node;
  Pma_resource_manager_data_buffer = ^ma_resource_manager_data_buffer;
  Pma_resource_manager_data_stream = ^ma_resource_manager_data_stream;
  Pma_resource_manager_data_source = ^ma_resource_manager_data_source;
  Pma_resource_manager_config = ^ma_resource_manager_config;
  Pma_resource_manager = ^ma_resource_manager;
  Pma_node_vtable = ^ma_node_vtable;
  Pma_node_config = ^ma_node_config;
  Pma_node_output_bus = ^ma_node_output_bus;
  Pma_node_input_bus = ^ma_node_input_bus;
  Pma_node_base = ^ma_node_base;
  Pma_node_graph_config = ^ma_node_graph_config;
  Pma_node_graph = ^ma_node_graph;
  Pma_data_source_node_config = ^ma_data_source_node_config;
  Pma_data_source_node = ^ma_data_source_node;
  Pma_splitter_node_config = ^ma_splitter_node_config;
  Pma_splitter_node = ^ma_splitter_node;
  Pma_biquad_node_config = ^ma_biquad_node_config;
  Pma_biquad_node = ^ma_biquad_node;
  Pma_lpf_node_config = ^ma_lpf_node_config;
  Pma_lpf_node = ^ma_lpf_node;
  Pma_hpf_node_config = ^ma_hpf_node_config;
  Pma_hpf_node = ^ma_hpf_node;
  Pma_bpf_node_config = ^ma_bpf_node_config;
  Pma_bpf_node = ^ma_bpf_node;
  Pma_notch_node_config = ^ma_notch_node_config;
  Pma_notch_node = ^ma_notch_node;
  Pma_peak_node_config = ^ma_peak_node_config;
  Pma_peak_node = ^ma_peak_node;
  Pma_loshelf_node_config = ^ma_loshelf_node_config;
  Pma_loshelf_node = ^ma_loshelf_node;
  Pma_hishelf_node_config = ^ma_hishelf_node_config;
  Pma_hishelf_node = ^ma_hishelf_node;
  Pma_delay_node_config = ^ma_delay_node_config;
  Pma_delay_node = ^ma_delay_node;
  Pma_engine_node_config = ^ma_engine_node_config;
  Pma_engine_node = ^ma_engine_node;
  Pma_sound_config = ^ma_sound_config;
  Pma_sound = ^ma_sound;
  Pma_sound_inlined = ^ma_sound_inlined;
  Pma_engine_config = ^ma_engine_config;
  Pma_engine = ^ma_engine;

  ma_int8 = UTF8Char;
  ma_uint8 = Byte;
  Pma_uint8 = ^ma_uint8;
  ma_int16 = Smallint;
  Pma_int16 = ^ma_int16;
  ma_uint16 = Word;
  ma_int32 = Integer;
  Pma_int32 = ^ma_int32;
  PPma_int32 = ^Pma_int32;
  ma_uint32 = Cardinal;
  Pma_uint32 = ^ma_uint32;
  ma_int64 = Int64;
  Pma_int64 = ^ma_int64;
  ma_uint64 = UInt64;
  Pma_uint64 = ^ma_uint64;
  ma_uintptr = ma_uint64;
  ma_bool8 = ma_uint8;
  ma_bool32 = ma_uint32;
  ma_float = Single;
  ma_double = Double;
  ma_handle = Pointer;
  ma_ptr = Pointer;
  Pma_ptr = ^ma_ptr;
  ma_proc = Pointer;
  ma_wchar_win32 = WideChar;
  ma_channel = ma_uint8;
  Pma_channel = ^ma_channel;

  ma_allocation_callbacks = record
    pUserData: Pointer;
    onMalloc: function(sz: NativeUInt; pUserData: Pointer): Pointer; cdecl;
    onRealloc: function(p: Pointer; sz: NativeUInt; pUserData: Pointer): Pointer; cdecl;
    onFree: procedure(p: Pointer; pUserData: Pointer); cdecl;
  end;

  ma_lcg = record
    state: ma_int32;
  end;

  ma_atomic_uint32 = record
    value: ma_uint32;
  end;

  ma_atomic_int32 = record
    value: ma_int32;
  end;

  ma_atomic_uint64 = record
    value: ma_uint64;
  end;

  ma_atomic_float = record
    value: ma_float;
  end;

  ma_atomic_bool32 = record
    value: ma_bool32;
  end;

  ma_spinlock = ma_uint32;
  Pma_spinlock = ^ma_spinlock;
  ma_thread = ma_handle;
  ma_mutex = ma_handle;
  Pma_mutex = ^ma_mutex;
  ma_event = ma_handle;
  Pma_event = ^ma_event;
  ma_semaphore = ma_handle;

  ma_log_callback_proc = procedure(pUserData: Pointer; level: ma_uint32; const pMessage: PUTF8Char); cdecl;

  ma_log_callback = record
    onLog: ma_log_callback_proc;
    pUserData: Pointer;
  end;

  ma_log = record
    callbacks: array [0..3] of ma_log_callback;
    callbackCount: ma_uint32;
    allocationCallbacks: ma_allocation_callbacks;
    lock: ma_mutex;
  end;

  Pma_biquad_coefficient = ^ma_biquad_coefficient;
  ma_biquad_coefficient = record
    case Integer of
      0: (f32: Single);
      1: (s32: ma_int32);
  end;

  ma_biquad_config = record
    format: ma_format;
    channels: ma_uint32;
    b0: Double;
    b1: Double;
    b2: Double;
    a0: Double;
    a1: Double;
    a2: Double;
  end;

  ma_biquad = record
    format: ma_format;
    channels: ma_uint32;
    b0: ma_biquad_coefficient;
    b1: ma_biquad_coefficient;
    b2: ma_biquad_coefficient;
    a1: ma_biquad_coefficient;
    a2: ma_biquad_coefficient;
    pR1: Pma_biquad_coefficient;
    pR2: Pma_biquad_coefficient;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_lpf1_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    q: Double;
  end;

  ma_lpf2_config = ma_lpf1_config;
  Pma_lpf2_config = ^ma_lpf2_config;

  ma_lpf1 = record
    format: ma_format;
    channels: ma_uint32;
    a: ma_biquad_coefficient;
    pR1: Pma_biquad_coefficient;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_lpf2 = record
    bq: ma_biquad;
  end;

  ma_lpf_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    order: ma_uint32;
  end;

  ma_lpf = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    lpf1Count: ma_uint32;
    lpf2Count: ma_uint32;
    pLPF1: Pma_lpf1;
    pLPF2: Pma_lpf2;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_hpf1_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    q: Double;
  end;

  ma_hpf2_config = ma_hpf1_config;
  Pma_hpf2_config = ^ma_hpf2_config;

  ma_hpf1 = record
    format: ma_format;
    channels: ma_uint32;
    a: ma_biquad_coefficient;
    pR1: Pma_biquad_coefficient;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_hpf2 = record
    bq: ma_biquad;
  end;

  ma_hpf_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    order: ma_uint32;
  end;

  ma_hpf = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    hpf1Count: ma_uint32;
    hpf2Count: ma_uint32;
    pHPF1: Pma_hpf1;
    pHPF2: Pma_hpf2;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_bpf2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    q: Double;
  end;

  ma_bpf2 = record
    bq: ma_biquad;
  end;

  ma_bpf_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    order: ma_uint32;
  end;

  ma_bpf = record
    format: ma_format;
    channels: ma_uint32;
    bpf2Count: ma_uint32;
    pBPF2: Pma_bpf2;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_notch2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    q: Double;
    frequency: Double;
  end;

  ma_notch_config = ma_notch2_config;
  Pma_notch_config = ^ma_notch_config;

  ma_notch2 = record
    bq: ma_biquad;
  end;

  ma_peak2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    gainDB: Double;
    q: Double;
    frequency: Double;
  end;

  ma_peak_config = ma_peak2_config;
  Pma_peak_config = ^ma_peak_config;

  ma_peak2 = record
    bq: ma_biquad;
  end;

  ma_loshelf2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    gainDB: Double;
    shelfSlope: Double;
    frequency: Double;
  end;

  ma_loshelf_config = ma_loshelf2_config;
  Pma_loshelf_config = ^ma_loshelf_config;

  ma_loshelf2 = record
    bq: ma_biquad;
  end;

  ma_hishelf2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    gainDB: Double;
    shelfSlope: Double;
    frequency: Double;
  end;

  ma_hishelf_config = ma_hishelf2_config;
  Pma_hishelf_config = ^ma_hishelf_config;

  ma_hishelf2 = record
    bq: ma_biquad;
  end;

  ma_delay_config = record
    channels: ma_uint32;
    sampleRate: ma_uint32;
    delayInFrames: ma_uint32;
    delayStart: ma_bool32;
    wet: Single;
    dry: Single;
    decay: Single;
  end;

  ma_delay = record
    config: ma_delay_config;
    cursor: ma_uint32;
    bufferSizeInFrames: ma_uint32;
    pBuffer: PSingle;
  end;

  ma_gainer_config = record
    channels: ma_uint32;
    smoothTimeInFrames: ma_uint32;
  end;

  ma_gainer = record
    config: ma_gainer_config;
    t: ma_uint32;
    masterVolume: Single;
    pOldGains: PSingle;
    pNewGains: PSingle;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_panner_config = record
    format: ma_format;
    channels: ma_uint32;
    mode: ma_pan_mode;
    pan: Single;
  end;

  ma_panner = record
    format: ma_format;
    channels: ma_uint32;
    mode: ma_pan_mode;
    pan: Single;
  end;

  ma_fader_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
  end;

  ma_fader = record
    config: ma_fader_config;
    volumeBeg: Single;
    volumeEnd: Single;
    lengthInFrames: ma_uint64;
    cursorInFrames: ma_int64;
  end;

  ma_vec3f = record
    x: Single;
    y: Single;
    z: Single;
  end;

  ma_atomic_vec3f = record
    v: ma_vec3f;
    lock: ma_spinlock;
  end;

  ma_spatializer_listener_config = record
    channelsOut: ma_uint32;
    pChannelMapOut: Pma_channel;
    handedness: ma_handedness;
    coneInnerAngleInRadians: Single;
    coneOuterAngleInRadians: Single;
    coneOuterGain: Single;
    speedOfSound: Single;
    worldUp: ma_vec3f;
  end;

  ma_spatializer_listener = record
    config: ma_spatializer_listener_config;
    position: ma_atomic_vec3f;
    direction: ma_atomic_vec3f;
    velocity: ma_atomic_vec3f;
    isEnabled: ma_bool32;
    _ownsHeap: ma_bool32;
    _pHeap: Pointer;
  end;

  ma_spatializer_config = record
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    pChannelMapIn: Pma_channel;
    attenuationModel: ma_attenuation_model;
    positioning: ma_positioning;
    handedness: ma_handedness;
    minGain: Single;
    maxGain: Single;
    minDistance: Single;
    maxDistance: Single;
    rolloff: Single;
    coneInnerAngleInRadians: Single;
    coneOuterAngleInRadians: Single;
    coneOuterGain: Single;
    dopplerFactor: Single;
    directionalAttenuationFactor: Single;
    minSpatializationChannelGain: Single;
    gainSmoothTimeInFrames: ma_uint32;
  end;

  ma_spatializer = record
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    pChannelMapIn: Pma_channel;
    attenuationModel: ma_attenuation_model;
    positioning: ma_positioning;
    handedness: ma_handedness;
    minGain: Single;
    maxGain: Single;
    minDistance: Single;
    maxDistance: Single;
    rolloff: Single;
    coneInnerAngleInRadians: Single;
    coneOuterAngleInRadians: Single;
    coneOuterGain: Single;
    dopplerFactor: Single;
    directionalAttenuationFactor: Single;
    gainSmoothTimeInFrames: ma_uint32;
    position: ma_atomic_vec3f;
    direction: ma_atomic_vec3f;
    velocity: ma_atomic_vec3f;
    dopplerPitch: Single;
    minSpatializationChannelGain: Single;
    gainer: ma_gainer;
    pNewChannelGainsOut: PSingle;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_linear_resampler_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    lpfOrder: ma_uint32;
    lpfNyquistFactor: Double;
  end;

  P_anonymous_type_1 = ^_anonymous_type_1;
  _anonymous_type_1 = record
    case Integer of
      0: (f32: PSingle);
      1: (s16: Pma_int16);
  end;

  P_anonymous_type_2 = ^_anonymous_type_2;
  _anonymous_type_2 = record
    case Integer of
      0: (f32: PSingle);
      1: (s16: Pma_int16);
  end;

  ma_linear_resampler = record
    config: ma_linear_resampler_config;
    inAdvanceInt: ma_uint32;
    inAdvanceFrac: ma_uint32;
    inTimeInt: ma_uint32;
    inTimeFrac: ma_uint32;
    x0: _anonymous_type_1;
    x1: _anonymous_type_2;
    lpf: ma_lpf;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  Pma_resampling_backend = Pointer;
  PPma_resampling_backend = ^Pma_resampling_backend;

  ma_resampling_backend_vtable = record
    onGetHeapSize: function(pUserData: Pointer; const pConfig: Pma_resampler_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
    onInit: function(pUserData: Pointer; const pConfig: Pma_resampler_config; pHeap: Pointer; ppBackend: PPma_resampling_backend): ma_result; cdecl;
    onUninit: procedure(pUserData: Pointer; pBackend: Pma_resampling_backend; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
    onProcess: function(pUserData: Pointer; pBackend: Pma_resampling_backend; const pFramesIn: Pointer; pFrameCountIn: Pma_uint64; pFramesOut: Pointer; pFrameCountOut: Pma_uint64): ma_result; cdecl;
    onSetRate: function(pUserData: Pointer; pBackend: Pma_resampling_backend; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_result; cdecl;
    onGetInputLatency: function(pUserData: Pointer; const pBackend: Pma_resampling_backend): ma_uint64; cdecl;
    onGetOutputLatency: function(pUserData: Pointer; const pBackend: Pma_resampling_backend): ma_uint64; cdecl;
    onGetRequiredInputFrameCount: function(pUserData: Pointer; const pBackend: Pma_resampling_backend; outputFrameCount: ma_uint64; pInputFrameCount: Pma_uint64): ma_result; cdecl;
    onGetExpectedOutputFrameCount: function(pUserData: Pointer; const pBackend: Pma_resampling_backend; inputFrameCount: ma_uint64; pOutputFrameCount: Pma_uint64): ma_result; cdecl;
    onReset: function(pUserData: Pointer; pBackend: Pma_resampling_backend): ma_result; cdecl;
  end;

  P_anonymous_type_3 = ^_anonymous_type_3;
  _anonymous_type_3 = record
    lpfOrder: ma_uint32;
  end;

  ma_resampler_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    algorithm: ma_resample_algorithm;
    pBackendVTable: Pma_resampling_backend_vtable;
    pBackendUserData: Pointer;
    linear: _anonymous_type_3;
  end;

  P_anonymous_type_4 = ^_anonymous_type_4;
  _anonymous_type_4 = record
    case Integer of
      0: (linear: ma_linear_resampler);
  end;

  ma_resampler = record
    pBackend: Pma_resampling_backend;
    pBackendVTable: Pma_resampling_backend_vtable;
    pBackendUserData: Pointer;
    format: ma_format;
    channels: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    state: _anonymous_type_4;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_channel_converter_config = record
    format: ma_format;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    pChannelMapIn: Pma_channel;
    pChannelMapOut: Pma_channel;
    mixingMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    ppWeights: PPSingle;
  end;

  P_anonymous_type_5 = ^_anonymous_type_5;
  _anonymous_type_5 = record
    case Integer of
      0: (f32: PPSingle);
      1: (s16: PPma_int32);
  end;

  ma_channel_converter = record
    format: ma_format;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    mixingMode: ma_channel_mix_mode;
    conversionPath: ma_channel_conversion_path;
    pChannelMapIn: Pma_channel;
    pChannelMapOut: Pma_channel;
    pShuffleTable: Pma_uint8;
    weights: _anonymous_type_5;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_data_converter_config = record
    formatIn: ma_format;
    formatOut: ma_format;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    pChannelMapIn: Pma_channel;
    pChannelMapOut: Pma_channel;
    ditherMode: ma_dither_mode;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    ppChannelWeights: PPSingle;
    allowDynamicSampleRate: ma_bool32;
    resampling: ma_resampler_config;
  end;

  ma_data_converter = record
    formatIn: ma_format;
    formatOut: ma_format;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    ditherMode: ma_dither_mode;
    executionPath: ma_data_converter_execution_path;
    channelConverter: ma_channel_converter;
    resampler: ma_resampler;
    hasPreFormatConversion: ma_bool8;
    hasPostFormatConversion: ma_bool8;
    hasChannelConverter: ma_bool8;
    hasResampler: ma_bool8;
    isPassthrough: ma_bool8;
    _ownsHeap: ma_bool8;
    _pHeap: Pointer;
  end;

  Pma_data_source = Pointer;
  PPma_data_source = ^Pma_data_source;

  ma_data_source_vtable = record
    onRead: function(pDataSource: Pma_data_source; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
    onSeek: function(pDataSource: Pma_data_source; frameIndex: ma_uint64): ma_result; cdecl;
    onGetDataFormat: function(pDataSource: Pma_data_source; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
    onGetCursor: function(pDataSource: Pma_data_source; pCursor: Pma_uint64): ma_result; cdecl;
    onGetLength: function(pDataSource: Pma_data_source; pLength: Pma_uint64): ma_result; cdecl;
    onSetLooping: function(pDataSource: Pma_data_source; isLooping: ma_bool32): ma_result; cdecl;
    flags: ma_uint32;
  end;

  ma_data_source_get_next_proc = function(pDataSource: Pma_data_source): Pma_data_source; cdecl;

  ma_data_source_config = record
    vtable: Pma_data_source_vtable;
  end;

  ma_data_source_base = record
    vtable: Pma_data_source_vtable;
    rangeBegInFrames: ma_uint64;
    rangeEndInFrames: ma_uint64;
    loopBegInFrames: ma_uint64;
    loopEndInFrames: ma_uint64;
    pCurrent: Pma_data_source;
    pNext: Pma_data_source;
    onGetNext: ma_data_source_get_next_proc;
    isLooping: ma_bool32;
  end;

  ma_audio_buffer_ref = record
    ds: ma_data_source_base;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cursor: ma_uint64;
    sizeInFrames: ma_uint64;
    pData: Pointer;
  end;

  ma_audio_buffer_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    sizeInFrames: ma_uint64;
    pData: Pointer;
    allocationCallbacks: ma_allocation_callbacks;
  end;

  ma_audio_buffer = record
    ref: ma_audio_buffer_ref;
    allocationCallbacks: ma_allocation_callbacks;
    ownsData: ma_bool32;
    _pExtraData: array [0..0] of ma_uint8;
  end;

  ma_paged_audio_buffer_page = record
    pNext: Pma_paged_audio_buffer_page;
    sizeInFrames: ma_uint64;
    pAudioData: array [0..0] of ma_uint8;
  end;

  ma_paged_audio_buffer_data = record
    format: ma_format;
    channels: ma_uint32;
    head: ma_paged_audio_buffer_page;
    pTail: Pma_paged_audio_buffer_page;
  end;

  ma_paged_audio_buffer_config = record
    pData: Pma_paged_audio_buffer_data;
  end;

  ma_paged_audio_buffer = record
    ds: ma_data_source_base;
    pData: Pma_paged_audio_buffer_data;
    pCurrent: Pma_paged_audio_buffer_page;
    relativeCursor: ma_uint64;
    absoluteCursor: ma_uint64;
  end;

  ma_rb = record
    pBuffer: Pointer;
    subbufferSizeInBytes: ma_uint32;
    subbufferCount: ma_uint32;
    subbufferStrideInBytes: ma_uint32;
    encodedReadOffset: ma_uint32;
    encodedWriteOffset: ma_uint32;
    ownsBuffer: ma_bool8;
    clearOnWriteAcquire: ma_bool8;
    allocationCallbacks: ma_allocation_callbacks;
  end;

  ma_pcm_rb = record
    ds: ma_data_source_base;
    rb: ma_rb;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
  end;

  ma_duplex_rb = record
    rb: ma_pcm_rb;
  end;

  ma_fence = record
    e: ma_event;
    counter: ma_uint32;
  end;

  Pma_async_notification = Pointer;
  PPma_async_notification = ^Pma_async_notification;

  ma_async_notification_callbacks = record
    onSignal: procedure(pNotification: Pma_async_notification); cdecl;
  end;

  ma_async_notification_poll = record
    cb: ma_async_notification_callbacks;
    signalled: ma_bool32;
  end;

  ma_async_notification_event = record
    cb: ma_async_notification_callbacks;
    e: ma_event;
  end;

  ma_slot_allocator_config = record
    capacity: ma_uint32;
  end;

  ma_slot_allocator_group = record
    bitfield: ma_uint32;
  end;

  ma_slot_allocator = record
    pGroups: Pma_slot_allocator_group;
    pSlots: Pma_uint32;
    count: ma_uint32;
    capacity: ma_uint32;
    _ownsHeap: ma_bool32;
    _pHeap: Pointer;
  end;

  ma_job_proc = function(pJob: Pma_job): ma_result; cdecl;

  P_anonymous_type_6 = ^_anonymous_type_6;
  _anonymous_type_6 = record
    code: ma_uint16;
    slot: ma_uint16;
    refcount: ma_uint32;
  end;

  P_anonymous_type_7 = ^_anonymous_type_7;
  _anonymous_type_7 = record
    case Integer of
      0: (breakup: _anonymous_type_6);
      1: (allocation: ma_uint64);
  end;

  P_anonymous_type_8 = ^_anonymous_type_8;
  _anonymous_type_8 = record
    proc: ma_job_proc;
    data0: ma_uintptr;
    data1: ma_uintptr;
  end;

  P_anonymous_type_9 = ^_anonymous_type_9;
  _anonymous_type_9 = record
    pResourceManager: Pointer;
    pDataBufferNode: Pointer;
    pFilePath: PUTF8Char;
    pFilePathW: PWideChar;
    flags: ma_uint32;
    pInitNotification: Pma_async_notification;
    pDoneNotification: Pma_async_notification;
    pInitFence: Pma_fence;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_10 = ^_anonymous_type_10;
  _anonymous_type_10 = record
    pResourceManager: Pointer;
    pDataBufferNode: Pointer;
    pDoneNotification: Pma_async_notification;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_11 = ^_anonymous_type_11;
  _anonymous_type_11 = record
    pResourceManager: Pointer;
    pDataBufferNode: Pointer;
    pDecoder: Pointer;
    pDoneNotification: Pma_async_notification;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_12 = ^_anonymous_type_12;
  _anonymous_type_12 = record
    pDataBuffer: Pointer;
    pInitNotification: Pma_async_notification;
    pDoneNotification: Pma_async_notification;
    pInitFence: Pma_fence;
    pDoneFence: Pma_fence;
    rangeBegInPCMFrames: ma_uint64;
    rangeEndInPCMFrames: ma_uint64;
    loopPointBegInPCMFrames: ma_uint64;
    loopPointEndInPCMFrames: ma_uint64;
    isLooping: ma_uint32;
  end;

  P_anonymous_type_13 = ^_anonymous_type_13;
  _anonymous_type_13 = record
    pDataBuffer: Pointer;
    pDoneNotification: Pma_async_notification;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_14 = ^_anonymous_type_14;
  _anonymous_type_14 = record
    pDataStream: Pointer;
    pFilePath: PUTF8Char;
    pFilePathW: PWideChar;
    initialSeekPoint: ma_uint64;
    pInitNotification: Pma_async_notification;
    pInitFence: Pma_fence;
  end;

  P_anonymous_type_15 = ^_anonymous_type_15;
  _anonymous_type_15 = record
    pDataStream: Pointer;
    pDoneNotification: Pma_async_notification;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_16 = ^_anonymous_type_16;
  _anonymous_type_16 = record
    pDataStream: Pointer;
    pageIndex: ma_uint32;
  end;

  P_anonymous_type_17 = ^_anonymous_type_17;
  _anonymous_type_17 = record
    pDataStream: Pointer;
    frameIndex: ma_uint64;
  end;

  P_anonymous_type_18 = ^_anonymous_type_18;
  _anonymous_type_18 = record
    case Integer of
      0: (loadDataBufferNode: _anonymous_type_9);
      1: (freeDataBufferNode: _anonymous_type_10);
      2: (pageDataBufferNode: _anonymous_type_11);
      3: (loadDataBuffer: _anonymous_type_12);
      4: (freeDataBuffer: _anonymous_type_13);
      5: (loadDataStream: _anonymous_type_14);
      6: (freeDataStream: _anonymous_type_15);
      7: (pageDataStream: _anonymous_type_16);
      8: (seekDataStream: _anonymous_type_17);
  end;

  P_anonymous_type_19 = ^_anonymous_type_19;
  _anonymous_type_19 = record
    pDevice: Pointer;
    deviceType: ma_uint32;
  end;

  P_anonymous_type_20 = ^_anonymous_type_20;
  _anonymous_type_20 = record
    case Integer of
      0: (reroute: _anonymous_type_19);
  end;

  P_anonymous_type_21 = ^_anonymous_type_21;
  _anonymous_type_21 = record
    case Integer of
      0: (aaudio: _anonymous_type_20);
  end;

  P_anonymous_type_22 = ^_anonymous_type_22;
  _anonymous_type_22 = record
    case Integer of
      0: (custom: _anonymous_type_8);
      1: (resourceManager: _anonymous_type_18);
      2: (device: _anonymous_type_21);
  end;

  ma_job = record
    toc: _anonymous_type_7;
    next: ma_uint64;
    order: ma_uint32;
    data: _anonymous_type_22;
  end;

  ma_job_queue_config = record
    flags: ma_uint32;
    capacity: ma_uint32;
  end;

  ma_job_queue = record
    flags: ma_uint32;
    capacity: ma_uint32;
    head: ma_uint64;
    tail: ma_uint64;
    sem: ma_semaphore;
    allocator: ma_slot_allocator;
    pJobs: Pma_job;
    lock: ma_spinlock;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_atomic_device_state = record
    value: ma_device_state;
  end;

  ma_IMMNotificationClient = record
    lpVtbl: Pointer;
    counter: ma_uint32;
    pDevice: Pma_device;
  end;

  ma_device_job_thread_config = record
    noThread: ma_bool32;
    jobQueueCapacity: ma_uint32;
    jobQueueFlags: ma_uint32;
  end;

  ma_device_job_thread = record
    thread: ma_thread;
    jobQueue: ma_job_queue;
    _hasThread: ma_bool32;
  end;

  P_anonymous_type_23 = ^_anonymous_type_23;
  _anonymous_type_23 = record
    _unused: Integer;
  end;

  P_anonymous_type_24 = ^_anonymous_type_24;
  _anonymous_type_24 = record
    _unused: Integer;
  end;

  P_anonymous_type_25 = ^_anonymous_type_25;
  _anonymous_type_25 = record
    _unused: Integer;
  end;

  P_anonymous_type_26 = ^_anonymous_type_26;
  _anonymous_type_26 = record
    _unused: Integer;
  end;

  P_anonymous_type_27 = ^_anonymous_type_27;
  _anonymous_type_27 = record
    case Integer of
      0: (started: _anonymous_type_23);
      1: (stopped: _anonymous_type_24);
      2: (rerouted: _anonymous_type_25);
      3: (interruption: _anonymous_type_26);
  end;

  ma_device_notification = record
    pDevice: Pma_device;
    &type: ma_device_notification_type;
    data: _anonymous_type_27;
  end;

  ma_device_notification_proc = procedure(const pNotification: Pma_device_notification); cdecl;
  ma_device_data_proc = procedure(pDevice: Pma_device; pOutput: Pointer; const pInput: Pointer; frameCount: ma_uint32); cdecl;
  ma_stop_proc = procedure(pDevice: Pma_device); cdecl;

  ma_timer = record
    case Integer of
      0: (counter: ma_int64);
      1: (counterD: Double);
  end;

  P_anonymous_type_28 = ^_anonymous_type_28;
  _anonymous_type_28 = record
    case Integer of
      0: (i: Integer);
      1: (s: array [0..255] of UTF8Char);
      2: (p: Pointer);
  end;

  Pma_device_id = ^ma_device_id;
  ma_device_id = record
    case Integer of
      0: (wasapi: array [0..63] of ma_wchar_win32);
      1: (dsound: array [0..15] of ma_uint8);
      2: (winmm: ma_uint32);
      3: (alsa: array [0..255] of UTF8Char);
      4: (pulse: array [0..255] of UTF8Char);
      5: (jack: Integer);
      6: (coreaudio: array [0..255] of UTF8Char);
      7: (sndio: array [0..255] of UTF8Char);
      8: (audio4: array [0..255] of UTF8Char);
      9: (oss: array [0..63] of UTF8Char);
      10: (aaudio: ma_int32);
      11: (opensl: ma_uint32);
      12: (webaudio: array [0..31] of UTF8Char);
      13: (custom: _anonymous_type_28);
      14: (nullbackend: Integer);
  end;

  P_anonymous_type_29 = ^_anonymous_type_29;
  _anonymous_type_29 = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    flags: ma_uint32;
  end;

  ma_device_info = record
    id: ma_device_id;
    name: array [0..255] of UTF8Char;
    isDefault: ma_bool32;
    nativeDataFormatCount: ma_uint32;
    nativeDataFormats: array [0..63] of _anonymous_type_29;
  end;

  P_anonymous_type_30 = ^_anonymous_type_30;
  _anonymous_type_30 = record
    pDeviceID: Pma_device_id;
    format: ma_format;
    channels: ma_uint32;
    pChannelMap: Pma_channel;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    shareMode: ma_share_mode;
  end;

  P_anonymous_type_31 = ^_anonymous_type_31;
  _anonymous_type_31 = record
    pDeviceID: Pma_device_id;
    format: ma_format;
    channels: ma_uint32;
    pChannelMap: Pma_channel;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    shareMode: ma_share_mode;
  end;

  P_anonymous_type_32 = ^_anonymous_type_32;
  _anonymous_type_32 = record
    usage: ma_wasapi_usage;
    noAutoConvertSRC: ma_bool8;
    noDefaultQualitySRC: ma_bool8;
    noAutoStreamRouting: ma_bool8;
    noHardwareOffloading: ma_bool8;
    loopbackProcessID: ma_uint32;
    loopbackProcessExclude: ma_bool8;
  end;

  P_anonymous_type_33 = ^_anonymous_type_33;
  _anonymous_type_33 = record
    noMMap: ma_bool32;
    noAutoFormat: ma_bool32;
    noAutoChannels: ma_bool32;
    noAutoResample: ma_bool32;
  end;

  P_anonymous_type_34 = ^_anonymous_type_34;
  _anonymous_type_34 = record
    pStreamNamePlayback: PUTF8Char;
    pStreamNameCapture: PUTF8Char;
  end;

  P_anonymous_type_35 = ^_anonymous_type_35;
  _anonymous_type_35 = record
    allowNominalSampleRateChange: ma_bool32;
  end;

  P_anonymous_type_36 = ^_anonymous_type_36;
  _anonymous_type_36 = record
    streamType: ma_opensl_stream_type;
    recordingPreset: ma_opensl_recording_preset;
    enableCompatibilityWorkarounds: ma_bool32;
  end;

  P_anonymous_type_37 = ^_anonymous_type_37;
  _anonymous_type_37 = record
    usage: ma_aaudio_usage;
    contentType: ma_aaudio_content_type;
    inputPreset: ma_aaudio_input_preset;
    allowedCapturePolicy: ma_aaudio_allowed_capture_policy;
    noAutoStartAfterReroute: ma_bool32;
    enableCompatibilityWorkarounds: ma_bool32;
  end;

  ma_device_config = record
    deviceType: ma_device_type;
    sampleRate: ma_uint32;
    periodSizeInFrames: ma_uint32;
    periodSizeInMilliseconds: ma_uint32;
    periods: ma_uint32;
    performanceProfile: ma_performance_profile;
    noPreSilencedOutputBuffer: ma_bool8;
    noClip: ma_bool8;
    noDisableDenormals: ma_bool8;
    noFixedSizedCallback: ma_bool8;
    dataCallback: ma_device_data_proc;
    notificationCallback: ma_device_notification_proc;
    stopCallback: ma_stop_proc;
    pUserData: Pointer;
    resampling: ma_resampler_config;
    playback: _anonymous_type_30;
    capture: _anonymous_type_31;
    wasapi: _anonymous_type_32;
    alsa: _anonymous_type_33;
    pulse: _anonymous_type_34;
    coreaudio: _anonymous_type_35;
    opensl: _anonymous_type_36;
    aaudio: _anonymous_type_37;
  end;

  ma_enum_devices_callback_proc = function(pContext: Pma_context; deviceType: ma_device_type; const pInfo: Pma_device_info; pUserData: Pointer): ma_bool32; cdecl;

  ma_device_descriptor = record
    pDeviceID: Pma_device_id;
    shareMode: ma_share_mode;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    channelMap: array [0..253] of ma_channel;
    periodSizeInFrames: ma_uint32;
    periodSizeInMilliseconds: ma_uint32;
    periodCount: ma_uint32;
  end;

  ma_backend_callbacks = record
    onContextInit: function(pContext: Pma_context; const pConfig: Pma_context_config; pCallbacks: Pma_backend_callbacks): ma_result; cdecl;
    onContextUninit: function(pContext: Pma_context): ma_result; cdecl;
    onContextEnumerateDevices: function(pContext: Pma_context; callback: ma_enum_devices_callback_proc; pUserData: Pointer): ma_result; cdecl;
    onContextGetDeviceInfo: function(pContext: Pma_context; deviceType: ma_device_type; const pDeviceID: Pma_device_id; pDeviceInfo: Pma_device_info): ma_result; cdecl;
    onDeviceInit: function(pDevice: Pma_device; const pConfig: Pma_device_config; pDescriptorPlayback: Pma_device_descriptor; pDescriptorCapture: Pma_device_descriptor): ma_result; cdecl;
    onDeviceUninit: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceStart: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceStop: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceRead: function(pDevice: Pma_device; pFrames: Pointer; frameCount: ma_uint32; pFramesRead: Pma_uint32): ma_result; cdecl;
    onDeviceWrite: function(pDevice: Pma_device; const pFrames: Pointer; frameCount: ma_uint32; pFramesWritten: Pma_uint32): ma_result; cdecl;
    onDeviceDataLoop: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceDataLoopWakeup: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceGetInfo: function(pDevice: Pma_device; &type: ma_device_type; pDeviceInfo: Pma_device_info): ma_result; cdecl;
  end;

  P_anonymous_type_38 = ^_anonymous_type_38;
  _anonymous_type_38 = record
    useVerboseDeviceEnumeration: ma_bool32;
  end;

  P_anonymous_type_39 = ^_anonymous_type_39;
  _anonymous_type_39 = record
    pApplicationName: PUTF8Char;
    pServerName: PUTF8Char;
    tryAutoSpawn: ma_bool32;
  end;

  P_anonymous_type_40 = ^_anonymous_type_40;
  _anonymous_type_40 = record
    sessionCategory: ma_ios_session_category;
    sessionCategoryOptions: ma_uint32;
    noAudioSessionActivate: ma_bool32;
    noAudioSessionDeactivate: ma_bool32;
  end;

  P_anonymous_type_41 = ^_anonymous_type_41;
  _anonymous_type_41 = record
    pClientName: PUTF8Char;
    tryStartServer: ma_bool32;
  end;

  ma_context_config = record
    pLog: Pma_log;
    threadPriority: ma_thread_priority;
    threadStackSize: NativeUInt;
    pUserData: Pointer;
    allocationCallbacks: ma_allocation_callbacks;
    alsa: _anonymous_type_38;
    pulse: _anonymous_type_39;
    coreaudio: _anonymous_type_40;
    jack: _anonymous_type_41;
    custom: ma_backend_callbacks;
  end;

  P_anonymous_type_42 = ^_anonymous_type_42;
  _anonymous_type_42 = record
    _unused: Integer;
  end;

  P_anonymous_type_43 = ^_anonymous_type_43;
  _anonymous_type_43 = record
    deviceType: ma_device_type;
    pAudioClient: Pointer;
    ppAudioClientService: PPointer;
    pResult: Pma_result;
  end;

  P_anonymous_type_44 = ^_anonymous_type_44;
  _anonymous_type_44 = record
    pDevice: Pma_device;
    deviceType: ma_device_type;
  end;

  P_anonymous_type_45 = ^_anonymous_type_45;
  _anonymous_type_45 = record
    case Integer of
      0: (quit: _anonymous_type_42);
      1: (createAudioClient: _anonymous_type_43);
      2: (releaseAudioClient: _anonymous_type_44);
  end;

  ma_context_command__wasapi = record
    code: Integer;
    pEvent: Pma_event;
    data: _anonymous_type_45;
  end;

  P_anonymous_type_46 = ^_anonymous_type_46;
  _anonymous_type_46 = record
    commandThread: ma_thread;
    commandLock: ma_mutex;
    commandSem: ma_semaphore;
    commandIndex: ma_uint32;
    commandCount: ma_uint32;
    commands: array [0..3] of ma_context_command__wasapi;
    hAvrt: ma_handle;
    AvSetMmThreadCharacteristicsA: ma_proc;
    AvRevertMmThreadcharacteristics: ma_proc;
    hMMDevapi: ma_handle;
    ActivateAudioInterfaceAsync: ma_proc;
  end;

  P_anonymous_type_47 = ^_anonymous_type_47;
  _anonymous_type_47 = record
    hDSoundDLL: ma_handle;
    DirectSoundCreate: ma_proc;
    DirectSoundEnumerateA: ma_proc;
    DirectSoundCaptureCreate: ma_proc;
    DirectSoundCaptureEnumerateA: ma_proc;
  end;

  P_anonymous_type_48 = ^_anonymous_type_48;
  _anonymous_type_48 = record
    hWinMM: ma_handle;
    waveOutGetNumDevs: ma_proc;
    waveOutGetDevCapsA: ma_proc;
    waveOutOpen: ma_proc;
    waveOutClose: ma_proc;
    waveOutPrepareHeader: ma_proc;
    waveOutUnprepareHeader: ma_proc;
    waveOutWrite: ma_proc;
    waveOutReset: ma_proc;
    waveInGetNumDevs: ma_proc;
    waveInGetDevCapsA: ma_proc;
    waveInOpen: ma_proc;
    waveInClose: ma_proc;
    waveInPrepareHeader: ma_proc;
    waveInUnprepareHeader: ma_proc;
    waveInAddBuffer: ma_proc;
    waveInStart: ma_proc;
    waveInReset: ma_proc;
  end;

  P_anonymous_type_49 = ^_anonymous_type_49;
  _anonymous_type_49 = record
    jackSO: ma_handle;
    jack_client_open: ma_proc;
    jack_client_close: ma_proc;
    jack_client_name_size: ma_proc;
    jack_set_process_callback: ma_proc;
    jack_set_buffer_size_callback: ma_proc;
    jack_on_shutdown: ma_proc;
    jack_get_sample_rate: ma_proc;
    jack_get_buffer_size: ma_proc;
    jack_get_ports: ma_proc;
    jack_activate: ma_proc;
    jack_deactivate: ma_proc;
    jack_connect: ma_proc;
    jack_port_register: ma_proc;
    jack_port_name: ma_proc;
    jack_port_get_buffer: ma_proc;
    jack_free: ma_proc;
    pClientName: PUTF8Char;
    tryStartServer: ma_bool32;
  end;

  P_anonymous_type_50 = ^_anonymous_type_50;
  _anonymous_type_50 = record
    _unused: Integer;
  end;

  P_anonymous_type_51 = ^_anonymous_type_51;
  _anonymous_type_51 = record
    case Integer of
      0: (wasapi: _anonymous_type_46);
      1: (dsound: _anonymous_type_47);
      2: (winmm: _anonymous_type_48);
      3: (jack: _anonymous_type_49);
      4: (null_backend: _anonymous_type_50);
  end;

  P_anonymous_type_52 = ^_anonymous_type_52;
  _anonymous_type_52 = record
    hOle32DLL: ma_handle;
    CoInitialize: ma_proc;
    CoInitializeEx: ma_proc;
    CoUninitialize: ma_proc;
    CoCreateInstance: ma_proc;
    CoTaskMemFree: ma_proc;
    PropVariantClear: ma_proc;
    StringFromGUID2: ma_proc;
    hUser32DLL: ma_handle;
    GetForegroundWindow: ma_proc;
    GetDesktopWindow: ma_proc;
    hAdvapi32DLL: ma_handle;
    RegOpenKeyExA: ma_proc;
    RegCloseKey: ma_proc;
    RegQueryValueExA: ma_proc;
    CoInitializeResult: Longint;
  end;

  P_anonymous_type_53 = ^_anonymous_type_53;
  _anonymous_type_53 = record
    case Integer of
      0: (win32: _anonymous_type_52);
      1: (_unused: Integer);
  end;

  ma_context = record
    callbacks: ma_backend_callbacks;
    backend: ma_backend;
    pLog: Pma_log;
    log: ma_log;
    threadPriority: ma_thread_priority;
    threadStackSize: NativeUInt;
    pUserData: Pointer;
    allocationCallbacks: ma_allocation_callbacks;
    deviceEnumLock: ma_mutex;
    deviceInfoLock: ma_mutex;
    deviceInfoCapacity: ma_uint32;
    playbackDeviceInfoCount: ma_uint32;
    captureDeviceInfoCount: ma_uint32;
    pDeviceInfos: Pma_device_info;
    f15: _anonymous_type_51;
    f16: _anonymous_type_53;
  end;

  P_anonymous_type_54 = ^_anonymous_type_54;
  _anonymous_type_54 = record
    lpfOrder: ma_uint32;
  end;

  P_anonymous_type_55 = ^_anonymous_type_55;
  _anonymous_type_55 = record
    algorithm: ma_resample_algorithm;
    pBackendVTable: Pma_resampling_backend_vtable;
    pBackendUserData: Pointer;
    linear: _anonymous_type_54;
  end;

  P_anonymous_type_56 = ^_anonymous_type_56;
  _anonymous_type_56 = record
    pID: Pma_device_id;
    id: ma_device_id;
    name: array [0..255] of UTF8Char;
    shareMode: ma_share_mode;
    format: ma_format;
    channels: ma_uint32;
    channelMap: array [0..253] of ma_channel;
    internalFormat: ma_format;
    internalChannels: ma_uint32;
    internalSampleRate: ma_uint32;
    internalChannelMap: array [0..253] of ma_channel;
    internalPeriodSizeInFrames: ma_uint32;
    internalPeriods: ma_uint32;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    converter: ma_data_converter;
    pIntermediaryBuffer: Pointer;
    intermediaryBufferCap: ma_uint32;
    intermediaryBufferLen: ma_uint32;
    pInputCache: Pointer;
    inputCacheCap: ma_uint64;
    inputCacheConsumed: ma_uint64;
    inputCacheRemaining: ma_uint64;
  end;

  P_anonymous_type_57 = ^_anonymous_type_57;
  _anonymous_type_57 = record
    pID: Pma_device_id;
    id: ma_device_id;
    name: array [0..255] of UTF8Char;
    shareMode: ma_share_mode;
    format: ma_format;
    channels: ma_uint32;
    channelMap: array [0..253] of ma_channel;
    internalFormat: ma_format;
    internalChannels: ma_uint32;
    internalSampleRate: ma_uint32;
    internalChannelMap: array [0..253] of ma_channel;
    internalPeriodSizeInFrames: ma_uint32;
    internalPeriods: ma_uint32;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    converter: ma_data_converter;
    pIntermediaryBuffer: Pointer;
    intermediaryBufferCap: ma_uint32;
    intermediaryBufferLen: ma_uint32;
  end;

  P_anonymous_type_58 = ^_anonymous_type_58;
  _anonymous_type_58 = record
    pAudioClientPlayback: ma_ptr;
    pAudioClientCapture: ma_ptr;
    pRenderClient: ma_ptr;
    pCaptureClient: ma_ptr;
    pDeviceEnumerator: ma_ptr;
    notificationClient: ma_IMMNotificationClient;
    hEventPlayback: ma_handle;
    hEventCapture: ma_handle;
    actualBufferSizeInFramesPlayback: ma_uint32;
    actualBufferSizeInFramesCapture: ma_uint32;
    originalPeriodSizeInFrames: ma_uint32;
    originalPeriodSizeInMilliseconds: ma_uint32;
    originalPeriods: ma_uint32;
    originalPerformanceProfile: ma_performance_profile;
    periodSizeInFramesPlayback: ma_uint32;
    periodSizeInFramesCapture: ma_uint32;
    pMappedBufferCapture: Pointer;
    mappedBufferCaptureCap: ma_uint32;
    mappedBufferCaptureLen: ma_uint32;
    pMappedBufferPlayback: Pointer;
    mappedBufferPlaybackCap: ma_uint32;
    mappedBufferPlaybackLen: ma_uint32;
    isStartedCapture: ma_atomic_bool32;
    isStartedPlayback: ma_atomic_bool32;
    loopbackProcessID: ma_uint32;
    loopbackProcessExclude: ma_bool8;
    noAutoConvertSRC: ma_bool8;
    noDefaultQualitySRC: ma_bool8;
    noHardwareOffloading: ma_bool8;
    allowCaptureAutoStreamRouting: ma_bool8;
    allowPlaybackAutoStreamRouting: ma_bool8;
    isDetachedPlayback: ma_bool8;
    isDetachedCapture: ma_bool8;
    usage: ma_wasapi_usage;
    hAvrtHandle: Pointer;
    rerouteLock: ma_mutex;
  end;

  P_anonymous_type_59 = ^_anonymous_type_59;
  _anonymous_type_59 = record
    pPlayback: ma_ptr;
    pPlaybackPrimaryBuffer: ma_ptr;
    pPlaybackBuffer: ma_ptr;
    pCapture: ma_ptr;
    pCaptureBuffer: ma_ptr;
  end;

  P_anonymous_type_60 = ^_anonymous_type_60;
  _anonymous_type_60 = record
    hDevicePlayback: ma_handle;
    hDeviceCapture: ma_handle;
    hEventPlayback: ma_handle;
    hEventCapture: ma_handle;
    fragmentSizeInFrames: ma_uint32;
    iNextHeaderPlayback: ma_uint32;
    iNextHeaderCapture: ma_uint32;
    headerFramesConsumedPlayback: ma_uint32;
    headerFramesConsumedCapture: ma_uint32;
    pWAVEHDRPlayback: Pma_uint8;
    pWAVEHDRCapture: Pma_uint8;
    pIntermediaryBufferPlayback: Pma_uint8;
    pIntermediaryBufferCapture: Pma_uint8;
    _pHeapData: Pma_uint8;
  end;

  P_anonymous_type_61 = ^_anonymous_type_61;
  _anonymous_type_61 = record
    pClient: ma_ptr;
    ppPortsPlayback: Pma_ptr;
    ppPortsCapture: Pma_ptr;
    pIntermediaryBufferPlayback: PSingle;
    pIntermediaryBufferCapture: PSingle;
  end;

  P_anonymous_type_62 = ^_anonymous_type_62;
  _anonymous_type_62 = record
    deviceThread: ma_thread;
    operationEvent: ma_event;
    operationCompletionEvent: ma_event;
    operationSemaphore: ma_semaphore;
    operation: ma_uint32;
    operationResult: ma_result;
    timer: ma_timer;
    priorRunTime: Double;
    currentPeriodFramesRemainingPlayback: ma_uint32;
    currentPeriodFramesRemainingCapture: ma_uint32;
    lastProcessedFramePlayback: ma_uint64;
    lastProcessedFrameCapture: ma_uint64;
    isStarted: ma_atomic_bool32;
  end;

  P_anonymous_type_63 = ^_anonymous_type_63;
  _anonymous_type_63 = record
    case Integer of
      0: (wasapi: _anonymous_type_58);
      1: (dsound: _anonymous_type_59);
      2: (winmm: _anonymous_type_60);
      3: (jack: _anonymous_type_61);
      4: (null_device: _anonymous_type_62);
  end;

  ma_device = record
    pContext: Pma_context;
    &type: ma_device_type;
    sampleRate: ma_uint32;
    state: ma_atomic_device_state;
    onData: ma_device_data_proc;
    onNotification: ma_device_notification_proc;
    onStop: ma_stop_proc;
    pUserData: Pointer;
    startStopLock: ma_mutex;
    wakeupEvent: ma_event;
    startEvent: ma_event;
    stopEvent: ma_event;
    thread: ma_thread;
    workResult: ma_result;
    isOwnerOfContext: ma_bool8;
    noPreSilencedOutputBuffer: ma_bool8;
    noClip: ma_bool8;
    noDisableDenormals: ma_bool8;
    noFixedSizedCallback: ma_bool8;
    masterVolumeFactor: ma_atomic_float;
    duplexRB: ma_duplex_rb;
    resampling: _anonymous_type_55;
    playback: _anonymous_type_56;
    capture: _anonymous_type_57;
    f25: _anonymous_type_63;
  end;

  Pma_vfs = Pointer;
  PPma_vfs = ^Pma_vfs;
  ma_vfs_file = ma_handle;
  Pma_vfs_file = ^ma_vfs_file;

  ma_file_info = record
    sizeInBytes: ma_uint64;
  end;

  ma_vfs_callbacks = record
    onOpen: function(pVFS: Pma_vfs; const pFilePath: PUTF8Char; openMode: ma_uint32; pFile: Pma_vfs_file): ma_result; cdecl;
    onOpenW: function(pVFS: Pma_vfs; const pFilePath: PWideChar; openMode: ma_uint32; pFile: Pma_vfs_file): ma_result; cdecl;
    onClose: function(pVFS: Pma_vfs; &file: ma_vfs_file): ma_result; cdecl;
    onRead: function(pVFS: Pma_vfs; &file: ma_vfs_file; pDst: Pointer; sizeInBytes: NativeUInt; pBytesRead: PNativeUInt): ma_result; cdecl;
    onWrite: function(pVFS: Pma_vfs; &file: ma_vfs_file; const pSrc: Pointer; sizeInBytes: NativeUInt; pBytesWritten: PNativeUInt): ma_result; cdecl;
    onSeek: function(pVFS: Pma_vfs; &file: ma_vfs_file; offset: ma_int64; origin: ma_seek_origin): ma_result; cdecl;
    onTell: function(pVFS: Pma_vfs; &file: ma_vfs_file; pCursor: Pma_int64): ma_result; cdecl;
    onInfo: function(pVFS: Pma_vfs; &file: ma_vfs_file; pInfo: Pma_file_info): ma_result; cdecl;
  end;

  ma_default_vfs = record
    cb: ma_vfs_callbacks;
    allocationCallbacks: ma_allocation_callbacks;
  end;

  ma_read_proc = function(pUserData: Pointer; pBufferOut: Pointer; bytesToRead: NativeUInt; pBytesRead: PNativeUInt): ma_result; cdecl;
  ma_seek_proc = function(pUserData: Pointer; offset: ma_int64; origin: ma_seek_origin): ma_result; cdecl;
  ma_tell_proc = function(pUserData: Pointer; pCursor: Pma_int64): ma_result; cdecl;

  ma_decoding_backend_config = record
    preferredFormat: ma_format;
    seekPointCount: ma_uint32;
  end;

  ma_decoding_backend_vtable = record
    onInit: function(pUserData: Pointer; onRead: ma_read_proc; onSeek: ma_seek_proc; onTell: ma_tell_proc; pReadSeekTellUserData: Pointer; const pConfig: Pma_decoding_backend_config; const pAllocationCallbacks: Pma_allocation_callbacks; ppBackend: PPma_data_source): ma_result; cdecl;
    onInitFile: function(pUserData: Pointer; const pFilePath: PUTF8Char; const pConfig: Pma_decoding_backend_config; const pAllocationCallbacks: Pma_allocation_callbacks; ppBackend: PPma_data_source): ma_result; cdecl;
    onInitFileW: function(pUserData: Pointer; const pFilePath: PWideChar; const pConfig: Pma_decoding_backend_config; const pAllocationCallbacks: Pma_allocation_callbacks; ppBackend: PPma_data_source): ma_result; cdecl;
    onInitMemory: function(pUserData: Pointer; const pData: Pointer; dataSize: NativeUInt; const pConfig: Pma_decoding_backend_config; const pAllocationCallbacks: Pma_allocation_callbacks; ppBackend: PPma_data_source): ma_result; cdecl;
    onUninit: procedure(pUserData: Pointer; pBackend: Pma_data_source; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  end;

  ma_decoder_read_proc = function(pDecoder: Pma_decoder; pBufferOut: Pointer; bytesToRead: NativeUInt; pBytesRead: PNativeUInt): ma_result; cdecl;
  ma_decoder_seek_proc = function(pDecoder: Pma_decoder; byteOffset: ma_int64; origin: ma_seek_origin): ma_result; cdecl;
  ma_decoder_tell_proc = function(pDecoder: Pma_decoder; pCursor: Pma_int64): ma_result; cdecl;

  ma_decoder_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    pChannelMap: Pma_channel;
    channelMixMode: ma_channel_mix_mode;
    ditherMode: ma_dither_mode;
    resampling: ma_resampler_config;
    allocationCallbacks: ma_allocation_callbacks;
    encodingFormat: ma_encoding_format;
    seekPointCount: ma_uint32;
    ppCustomBackendVTables: PPma_decoding_backend_vtable;
    customBackendCount: ma_uint32;
    pCustomBackendUserData: Pointer;
  end;

  P_anonymous_type_64 = ^_anonymous_type_64;
  _anonymous_type_64 = record
    pVFS: Pma_vfs;
    &file: ma_vfs_file;
  end;

  P_anonymous_type_65 = ^_anonymous_type_65;
  _anonymous_type_65 = record
    pData: Pma_uint8;
    dataSize: NativeUInt;
    currentReadPos: NativeUInt;
  end;

  P_anonymous_type_66 = ^_anonymous_type_66;
  _anonymous_type_66 = record
    case Integer of
      0: (vfs: _anonymous_type_64);
      1: (memory: _anonymous_type_65);
  end;

  ma_decoder = record
    ds: ma_data_source_base;
    pBackend: Pma_data_source;
    pBackendVTable: Pma_decoding_backend_vtable;
    pBackendUserData: Pointer;
    onRead: ma_decoder_read_proc;
    onSeek: ma_decoder_seek_proc;
    onTell: ma_decoder_tell_proc;
    pUserData: Pointer;
    readPointerInPCMFrames: ma_uint64;
    outputFormat: ma_format;
    outputChannels: ma_uint32;
    outputSampleRate: ma_uint32;
    converter: ma_data_converter;
    pInputCache: Pointer;
    inputCacheCap: ma_uint64;
    inputCacheConsumed: ma_uint64;
    inputCacheRemaining: ma_uint64;
    allocationCallbacks: ma_allocation_callbacks;
    data: _anonymous_type_66;
  end;

  ma_encoder_write_proc = function(pEncoder: Pma_encoder; const pBufferIn: Pointer; bytesToWrite: NativeUInt; pBytesWritten: PNativeUInt): ma_result; cdecl;
  ma_encoder_seek_proc = function(pEncoder: Pma_encoder; offset: ma_int64; origin: ma_seek_origin): ma_result; cdecl;
  ma_encoder_init_proc = function(pEncoder: Pma_encoder): ma_result; cdecl;
  ma_encoder_uninit_proc = procedure(pEncoder: Pma_encoder); cdecl;
  ma_encoder_write_pcm_frames_proc = function(pEncoder: Pma_encoder; const pFramesIn: Pointer; frameCount: ma_uint64; pFramesWritten: Pma_uint64): ma_result; cdecl;

  ma_encoder_config = record
    encodingFormat: ma_encoding_format;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    allocationCallbacks: ma_allocation_callbacks;
  end;

  P_anonymous_type_67 = ^_anonymous_type_67;
  _anonymous_type_67 = record
    pVFS: Pma_vfs;
    &file: ma_vfs_file;
  end;

  P_anonymous_type_68 = ^_anonymous_type_68;
  _anonymous_type_68 = record
    case Integer of
      0: (vfs: _anonymous_type_67);
  end;

  ma_encoder = record
    config: ma_encoder_config;
    onWrite: ma_encoder_write_proc;
    onSeek: ma_encoder_seek_proc;
    onInit: ma_encoder_init_proc;
    onUninit: ma_encoder_uninit_proc;
    onWritePCMFrames: ma_encoder_write_pcm_frames_proc;
    pUserData: Pointer;
    pInternalEncoder: Pointer;
    data: _anonymous_type_68;
  end;

  ma_waveform_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    &type: ma_waveform_type;
    amplitude: Double;
    frequency: Double;
  end;

  ma_waveform = record
    ds: ma_data_source_base;
    config: ma_waveform_config;
    advance: Double;
    time: Double;
  end;

  ma_pulsewave_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    dutyCycle: Double;
    amplitude: Double;
    frequency: Double;
  end;

  ma_pulsewave = record
    waveform: ma_waveform;
    config: ma_pulsewave_config;
  end;

  ma_noise_config = record
    format: ma_format;
    channels: ma_uint32;
    &type: ma_noise_type;
    seed: ma_int32;
    amplitude: Double;
    duplicateChannels: ma_bool32;
  end;

  P_anonymous_type_69 = ^_anonymous_type_69;
  _anonymous_type_69 = record
    bin: PPDouble;
    accumulation: PDouble;
    counter: Pma_uint32;
  end;

  P_anonymous_type_70 = ^_anonymous_type_70;
  _anonymous_type_70 = record
    accumulation: PDouble;
  end;

  P_anonymous_type_71 = ^_anonymous_type_71;
  _anonymous_type_71 = record
    case Integer of
      0: (pink: _anonymous_type_69);
      1: (brownian: _anonymous_type_70);
  end;

  ma_noise = record
    ds: ma_data_source_base;
    config: ma_noise_config;
    lcg: ma_lcg;
    state: _anonymous_type_71;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_resource_manager_pipeline_stage_notification = record
    pNotification: Pma_async_notification;
    pFence: Pma_fence;
  end;

  ma_resource_manager_pipeline_notifications = record
    init: ma_resource_manager_pipeline_stage_notification;
    done: ma_resource_manager_pipeline_stage_notification;
  end;

  ma_resource_manager_data_source_config = record
    pFilePath: PUTF8Char;
    pFilePathW: PWideChar;
    pNotifications: Pma_resource_manager_pipeline_notifications;
    initialSeekPointInPCMFrames: ma_uint64;
    rangeBegInPCMFrames: ma_uint64;
    rangeEndInPCMFrames: ma_uint64;
    loopPointBegInPCMFrames: ma_uint64;
    loopPointEndInPCMFrames: ma_uint64;
    isLooping: ma_bool32;
    flags: ma_uint32;
  end;

  P_anonymous_type_72 = ^_anonymous_type_72;
  _anonymous_type_72 = record
    pData: Pointer;
    sizeInBytes: NativeUInt;
  end;

  P_anonymous_type_73 = ^_anonymous_type_73;
  _anonymous_type_73 = record
    pData: Pointer;
    totalFrameCount: ma_uint64;
    decodedFrameCount: ma_uint64;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
  end;

  P_anonymous_type_74 = ^_anonymous_type_74;
  _anonymous_type_74 = record
    data: ma_paged_audio_buffer_data;
    decodedFrameCount: ma_uint64;
    sampleRate: ma_uint32;
  end;

  P_anonymous_type_75 = ^_anonymous_type_75;
  _anonymous_type_75 = record
    case Integer of
      0: (encoded: _anonymous_type_72);
      1: (decoded: _anonymous_type_73);
      2: (decodedPaged: _anonymous_type_74);
  end;

  ma_resource_manager_data_supply = record
    &type: ma_resource_manager_data_supply_type;
    backend: _anonymous_type_75;
  end;

  ma_resource_manager_data_buffer_node = record
    hashedName32: ma_uint32;
    refCount: ma_uint32;
    result: ma_result;
    executionCounter: ma_uint32;
    executionPointer: ma_uint32;
    isDataOwnedByResourceManager: ma_bool32;
    data: ma_resource_manager_data_supply;
    pParent: Pma_resource_manager_data_buffer_node;
    pChildLo: Pma_resource_manager_data_buffer_node;
    pChildHi: Pma_resource_manager_data_buffer_node;
  end;

  P_anonymous_type_76 = ^_anonymous_type_76;
  _anonymous_type_76 = record
    case Integer of
      0: (decoder: ma_decoder);
      1: (buffer: ma_audio_buffer);
      2: (pagedBuffer: ma_paged_audio_buffer);
  end;

  ma_resource_manager_data_buffer = record
    ds: ma_data_source_base;
    pResourceManager: Pma_resource_manager;
    pNode: Pma_resource_manager_data_buffer_node;
    flags: ma_uint32;
    executionCounter: ma_uint32;
    executionPointer: ma_uint32;
    seekTargetInPCMFrames: ma_uint64;
    seekToCursorOnNextRead: ma_bool32;
    result: ma_result;
    isLooping: ma_bool32;
    isConnectorInitialized: ma_atomic_bool32;
    connector: _anonymous_type_76;
  end;

  ma_resource_manager_data_stream = record
    ds: ma_data_source_base;
    pResourceManager: Pma_resource_manager;
    flags: ma_uint32;
    decoder: ma_decoder;
    isDecoderInitialized: ma_bool32;
    totalLengthInPCMFrames: ma_uint64;
    relativeCursor: ma_uint32;
    absoluteCursor: ma_uint64;
    currentPageIndex: ma_uint32;
    executionCounter: ma_uint32;
    executionPointer: ma_uint32;
    isLooping: ma_bool32;
    pPageData: Pointer;
    pageFrameCount: array [0..1] of ma_uint32;
    result: ma_result;
    isDecoderAtEnd: ma_bool32;
    isPageValid: array [0..1] of ma_bool32;
    seekCounter: ma_bool32;
  end;

  P_anonymous_type_77 = ^_anonymous_type_77;
  _anonymous_type_77 = record
    case Integer of
      0: (buffer: ma_resource_manager_data_buffer);
      1: (stream: ma_resource_manager_data_stream);
  end;

  ma_resource_manager_data_source = record
    backend: _anonymous_type_77;
    flags: ma_uint32;
    executionCounter: ma_uint32;
    executionPointer: ma_uint32;
  end;

  ma_resource_manager_config = record
    allocationCallbacks: ma_allocation_callbacks;
    pLog: Pma_log;
    decodedFormat: ma_format;
    decodedChannels: ma_uint32;
    decodedSampleRate: ma_uint32;
    jobThreadCount: ma_uint32;
    jobThreadStackSize: NativeUInt;
    jobQueueCapacity: ma_uint32;
    flags: ma_uint32;
    pVFS: Pma_vfs;
    ppCustomDecodingBackendVTables: PPma_decoding_backend_vtable;
    customDecodingBackendCount: ma_uint32;
    pCustomDecodingBackendUserData: Pointer;
  end;

  ma_resource_manager = record
    config: ma_resource_manager_config;
    pRootDataBufferNode: Pma_resource_manager_data_buffer_node;
    dataBufferBSTLock: ma_mutex;
    jobThreads: array [0..63] of ma_thread;
    jobQueue: ma_job_queue;
    defaultVFS: ma_default_vfs;
    log: ma_log;
  end;

  Pma_node = Pointer;
  PPma_node = ^Pma_node;

  ma_node_vtable = record
    onProcess: procedure(pNode: Pma_node; ppFramesIn: PPSingle; pFrameCountIn: Pma_uint32; ppFramesOut: PPSingle; pFrameCountOut: Pma_uint32); cdecl;
    onGetRequiredInputFrameCount: function(pNode: Pma_node; outputFrameCount: ma_uint32; pInputFrameCount: Pma_uint32): ma_result; cdecl;
    inputBusCount: ma_uint8;
    outputBusCount: ma_uint8;
    flags: ma_uint32;
  end;

  ma_node_config = record
    vtable: Pma_node_vtable;
    initialState: ma_node_state;
    inputBusCount: ma_uint32;
    outputBusCount: ma_uint32;
    pInputChannels: Pma_uint32;
    pOutputChannels: Pma_uint32;
  end;

  ma_node_output_bus = record
    pNode: Pma_node;
    outputBusIndex: ma_uint8;
    channels: ma_uint8;
    inputNodeInputBusIndex: ma_uint8;
    flags: ma_uint32;
    refCount: ma_uint32;
    isAttached: ma_bool32;
    lock: ma_spinlock;
    volume: Single;
    pNext: Pma_node_output_bus;
    pPrev: Pma_node_output_bus;
    pInputNode: Pma_node;
  end;

  ma_node_input_bus = record
    head: ma_node_output_bus;
    nextCounter: ma_uint32;
    lock: ma_spinlock;
    channels: ma_uint8;
  end;

  ma_node_base = record
    pNodeGraph: Pma_node_graph;
    vtable: Pma_node_vtable;
    pCachedData: PSingle;
    cachedDataCapInFramesPerBus: ma_uint16;
    cachedFrameCountOut: ma_uint16;
    cachedFrameCountIn: ma_uint16;
    consumedFrameCountIn: ma_uint16;
    state: ma_node_state;
    stateTimes: array [0..1] of ma_uint64;
    localTime: ma_uint64;
    inputBusCount: ma_uint32;
    outputBusCount: ma_uint32;
    pInputBuses: Pma_node_input_bus;
    pOutputBuses: Pma_node_output_bus;
    _inputBuses: array [0..1] of ma_node_input_bus;
    _outputBuses: array [0..1] of ma_node_output_bus;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_node_graph_config = record
    channels: ma_uint32;
    nodeCacheCapInFrames: ma_uint16;
  end;

  ma_node_graph = record
    base: ma_node_base;
    endpoint: ma_node_base;
    nodeCacheCapInFrames: ma_uint16;
    isReading: ma_bool32;
  end;

  ma_data_source_node_config = record
    nodeConfig: ma_node_config;
    pDataSource: Pma_data_source;
  end;

  ma_data_source_node = record
    base: ma_node_base;
    pDataSource: Pma_data_source;
  end;

  ma_splitter_node_config = record
    nodeConfig: ma_node_config;
    channels: ma_uint32;
    outputBusCount: ma_uint32;
  end;

  ma_splitter_node = record
    base: ma_node_base;
  end;

  ma_biquad_node_config = record
    nodeConfig: ma_node_config;
    biquad: ma_biquad_config;
  end;

  ma_biquad_node = record
    baseNode: ma_node_base;
    biquad: ma_biquad;
  end;

  ma_lpf_node_config = record
    nodeConfig: ma_node_config;
    lpf: ma_lpf_config;
  end;

  ma_lpf_node = record
    baseNode: ma_node_base;
    lpf: ma_lpf;
  end;

  ma_hpf_node_config = record
    nodeConfig: ma_node_config;
    hpf: ma_hpf_config;
  end;

  ma_hpf_node = record
    baseNode: ma_node_base;
    hpf: ma_hpf;
  end;

  ma_bpf_node_config = record
    nodeConfig: ma_node_config;
    bpf: ma_bpf_config;
  end;

  ma_bpf_node = record
    baseNode: ma_node_base;
    bpf: ma_bpf;
  end;

  ma_notch_node_config = record
    nodeConfig: ma_node_config;
    notch: ma_notch_config;
  end;

  ma_notch_node = record
    baseNode: ma_node_base;
    notch: ma_notch2;
  end;

  ma_peak_node_config = record
    nodeConfig: ma_node_config;
    peak: ma_peak_config;
  end;

  ma_peak_node = record
    baseNode: ma_node_base;
    peak: ma_peak2;
  end;

  ma_loshelf_node_config = record
    nodeConfig: ma_node_config;
    loshelf: ma_loshelf_config;
  end;

  ma_loshelf_node = record
    baseNode: ma_node_base;
    loshelf: ma_loshelf2;
  end;

  ma_hishelf_node_config = record
    nodeConfig: ma_node_config;
    hishelf: ma_hishelf_config;
  end;

  ma_hishelf_node = record
    baseNode: ma_node_base;
    hishelf: ma_hishelf2;
  end;

  ma_delay_node_config = record
    nodeConfig: ma_node_config;
    delay: ma_delay_config;
  end;

  ma_delay_node = record
    baseNode: ma_node_base;
    delay: ma_delay;
  end;

  ma_engine_node_config = record
    pEngine: Pma_engine;
    &type: ma_engine_node_type;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    sampleRate: ma_uint32;
    volumeSmoothTimeInPCMFrames: ma_uint32;
    monoExpansionMode: ma_mono_expansion_mode;
    isPitchDisabled: ma_bool8;
    isSpatializationDisabled: ma_bool8;
    pinnedListenerIndex: ma_uint8;
  end;

  P_anonymous_type_78 = ^_anonymous_type_78;
  _anonymous_type_78 = record
    volumeBeg: ma_atomic_float;
    volumeEnd: ma_atomic_float;
    fadeLengthInFrames: ma_atomic_uint64;
    absoluteGlobalTimeInFrames: ma_atomic_uint64;
  end;

  ma_engine_node = record
    baseNode: ma_node_base;
    pEngine: Pma_engine;
    sampleRate: ma_uint32;
    volumeSmoothTimeInPCMFrames: ma_uint32;
    monoExpansionMode: ma_mono_expansion_mode;
    fader: ma_fader;
    resampler: ma_linear_resampler;
    spatializer: ma_spatializer;
    panner: ma_panner;
    volumeGainer: ma_gainer;
    volume: ma_atomic_float;
    pitch: Single;
    oldPitch: Single;
    oldDopplerPitch: Single;
    isPitchDisabled: ma_bool32;
    isSpatializationDisabled: ma_bool32;
    pinnedListenerIndex: ma_uint32;
    fadeSettings: _anonymous_type_78;
    _ownsHeap: ma_bool8;
    _pHeap: Pointer;
  end;

  ma_sound_end_proc = procedure(pUserData: Pointer; pSound: Pma_sound); cdecl;

  ma_sound_config = record
    pFilePath: PUTF8Char;
    pFilePathW: PWideChar;
    pDataSource: Pma_data_source;
    pInitialAttachment: Pma_node;
    initialAttachmentInputBusIndex: ma_uint32;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    monoExpansionMode: ma_mono_expansion_mode;
    flags: ma_uint32;
    volumeSmoothTimeInPCMFrames: ma_uint32;
    initialSeekPointInPCMFrames: ma_uint64;
    rangeBegInPCMFrames: ma_uint64;
    rangeEndInPCMFrames: ma_uint64;
    loopPointBegInPCMFrames: ma_uint64;
    loopPointEndInPCMFrames: ma_uint64;
    isLooping: ma_bool32;
    endCallback: ma_sound_end_proc;
    pEndCallbackUserData: Pointer;
    initNotifications: ma_resource_manager_pipeline_notifications;
    pDoneFence: Pma_fence;
  end;

  ma_sound = record
    engineNode: ma_engine_node;
    pDataSource: Pma_data_source;
    seekTarget: ma_uint64;
    atEnd: ma_bool32;
    endCallback: ma_sound_end_proc;
    pEndCallbackUserData: Pointer;
    ownsDataSource: ma_bool8;
    pResourceManagerDataSource: Pma_resource_manager_data_source;
  end;

  ma_sound_inlined = record
    sound: ma_sound;
    pNext: Pma_sound_inlined;
    pPrev: Pma_sound_inlined;
  end;

  ma_sound_group_config = ma_sound_config;
  Pma_sound_group_config = ^ma_sound_group_config;
  ma_sound_group = ma_sound;
  Pma_sound_group = ^ma_sound_group;

  ma_engine_process_proc = procedure(pUserData: Pointer; pFramesOut: PSingle; frameCount: ma_uint64); cdecl;

  ma_engine_config = record
    pResourceManager: Pma_resource_manager;
    pContext: Pma_context;
    pDevice: Pma_device;
    pPlaybackDeviceID: Pma_device_id;
    dataCallback: ma_device_data_proc;
    notificationCallback: ma_device_notification_proc;
    pLog: Pma_log;
    listenerCount: ma_uint32;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    periodSizeInFrames: ma_uint32;
    periodSizeInMilliseconds: ma_uint32;
    gainSmoothTimeInFrames: ma_uint32;
    gainSmoothTimeInMilliseconds: ma_uint32;
    defaultVolumeSmoothTimeInPCMFrames: ma_uint32;
    allocationCallbacks: ma_allocation_callbacks;
    noAutoStart: ma_bool32;
    noDevice: ma_bool32;
    monoExpansionMode: ma_mono_expansion_mode;
    pResourceManagerVFS: Pma_vfs;
    onProcess: ma_engine_process_proc;
    pProcessUserData: Pointer;
  end;

  ma_engine = record
    nodeGraph: ma_node_graph;
    pResourceManager: Pma_resource_manager;
    pDevice: Pma_device;
    pLog: Pma_log;
    sampleRate: ma_uint32;
    listenerCount: ma_uint32;
    listeners: array [0..3] of ma_spatializer_listener;
    allocationCallbacks: ma_allocation_callbacks;
    ownsResourceManager: ma_bool8;
    ownsDevice: ma_bool8;
    inlinedSoundLock: ma_spinlock;
    pInlinedSoundHead: Pma_sound_inlined;
    inlinedSoundCount: ma_uint32;
    gainSmoothTimeInFrames: ma_uint32;
    defaultVolumeSmoothTimeInPCMFrames: ma_uint32;
    monoExpansionMode: ma_mono_expansion_mode;
    onProcess: ma_engine_process_proc;
    pProcessUserData: Pointer;
  end;

procedure ma_version(pMajor: Pma_uint32; pMinor: Pma_uint32; pRevision: Pma_uint32); cdecl; external;
function  ma_version_string(): PUTF8Char; cdecl; external;
function  ma_log_callback_init(onLog: ma_log_callback_proc; pUserData: Pointer): ma_log_callback; cdecl; external;
function  ma_log_init(const pAllocationCallbacks: Pma_allocation_callbacks; pLog: Pma_log): ma_result; cdecl; external;
procedure ma_log_uninit(pLog: Pma_log); cdecl; external;
function  ma_log_register_callback(pLog: Pma_log; callback: ma_log_callback): ma_result; cdecl; external;
function  ma_log_unregister_callback(pLog: Pma_log; callback: ma_log_callback): ma_result; cdecl; external;
function  ma_log_post(pLog: Pma_log; level: ma_uint32; const pMessage: PUTF8Char): ma_result; cdecl; external;
function  ma_log_postv(pLog: Pma_log; level: ma_uint32; const pFormat: PUTF8Char; args: Pointer): ma_result; cdecl; external;
function  ma_log_postf(pLog: Pma_log; level: ma_uint32; const pFormat: PUTF8Char): ma_result varargs; cdecl; external;
function  ma_biquad_config_init(format: ma_format; channels: ma_uint32; b0: Double; b1: Double; b2: Double; a0: Double; a1: Double; a2: Double): ma_biquad_config; cdecl; external;
function  ma_biquad_get_heap_size(const pConfig: Pma_biquad_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_biquad_init_preallocated(const pConfig: Pma_biquad_config; pHeap: Pointer; pBQ: Pma_biquad): ma_result; cdecl; external;
function  ma_biquad_init(const pConfig: Pma_biquad_config; const pAllocationCallbacks: Pma_allocation_callbacks; pBQ: Pma_biquad): ma_result; cdecl; external;
procedure ma_biquad_uninit(pBQ: Pma_biquad; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_biquad_reinit(const pConfig: Pma_biquad_config; pBQ: Pma_biquad): ma_result; cdecl; external;
function  ma_biquad_clear_cache(pBQ: Pma_biquad): ma_result; cdecl; external;
function  ma_biquad_process_pcm_frames(pBQ: Pma_biquad; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_biquad_get_latency(const pBQ: Pma_biquad): ma_uint32; cdecl; external;
function  ma_lpf1_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double): ma_lpf1_config; cdecl; external;
function  ma_lpf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; q: Double): ma_lpf2_config; cdecl; external;
function  ma_lpf1_get_heap_size(const pConfig: Pma_lpf1_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_lpf1_init_preallocated(const pConfig: Pma_lpf1_config; pHeap: Pointer; pLPF: Pma_lpf1): ma_result; cdecl; external;
function  ma_lpf1_init(const pConfig: Pma_lpf1_config; const pAllocationCallbacks: Pma_allocation_callbacks; pLPF: Pma_lpf1): ma_result; cdecl; external;
procedure ma_lpf1_uninit(pLPF: Pma_lpf1; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_lpf1_reinit(const pConfig: Pma_lpf1_config; pLPF: Pma_lpf1): ma_result; cdecl; external;
function  ma_lpf1_clear_cache(pLPF: Pma_lpf1): ma_result; cdecl; external;
function  ma_lpf1_process_pcm_frames(pLPF: Pma_lpf1; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_lpf1_get_latency(const pLPF: Pma_lpf1): ma_uint32; cdecl; external;
function  ma_lpf2_get_heap_size(const pConfig: Pma_lpf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_lpf2_init_preallocated(const pConfig: Pma_lpf2_config; pHeap: Pointer; pHPF: Pma_lpf2): ma_result; cdecl; external;
function  ma_lpf2_init(const pConfig: Pma_lpf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pLPF: Pma_lpf2): ma_result; cdecl; external;
procedure ma_lpf2_uninit(pLPF: Pma_lpf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_lpf2_reinit(const pConfig: Pma_lpf2_config; pLPF: Pma_lpf2): ma_result; cdecl; external;
function  ma_lpf2_clear_cache(pLPF: Pma_lpf2): ma_result; cdecl; external;
function  ma_lpf2_process_pcm_frames(pLPF: Pma_lpf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_lpf2_get_latency(const pLPF: Pma_lpf2): ma_uint32; cdecl; external;
function  ma_lpf_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_lpf_config; cdecl; external;
function  ma_lpf_get_heap_size(const pConfig: Pma_lpf_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_lpf_init_preallocated(const pConfig: Pma_lpf_config; pHeap: Pointer; pLPF: Pma_lpf): ma_result; cdecl; external;
function  ma_lpf_init(const pConfig: Pma_lpf_config; const pAllocationCallbacks: Pma_allocation_callbacks; pLPF: Pma_lpf): ma_result; cdecl; external;
procedure ma_lpf_uninit(pLPF: Pma_lpf; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_lpf_reinit(const pConfig: Pma_lpf_config; pLPF: Pma_lpf): ma_result; cdecl; external;
function  ma_lpf_clear_cache(pLPF: Pma_lpf): ma_result; cdecl; external;
function  ma_lpf_process_pcm_frames(pLPF: Pma_lpf; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_lpf_get_latency(const pLPF: Pma_lpf): ma_uint32; cdecl; external;
function  ma_hpf1_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double): ma_hpf1_config; cdecl; external;
function  ma_hpf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; q: Double): ma_hpf2_config; cdecl; external;
function  ma_hpf1_get_heap_size(const pConfig: Pma_hpf1_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_hpf1_init_preallocated(const pConfig: Pma_hpf1_config; pHeap: Pointer; pLPF: Pma_hpf1): ma_result; cdecl; external;
function  ma_hpf1_init(const pConfig: Pma_hpf1_config; const pAllocationCallbacks: Pma_allocation_callbacks; pHPF: Pma_hpf1): ma_result; cdecl; external;
procedure ma_hpf1_uninit(pHPF: Pma_hpf1; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_hpf1_reinit(const pConfig: Pma_hpf1_config; pHPF: Pma_hpf1): ma_result; cdecl; external;
function  ma_hpf1_process_pcm_frames(pHPF: Pma_hpf1; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_hpf1_get_latency(const pHPF: Pma_hpf1): ma_uint32; cdecl; external;
function  ma_hpf2_get_heap_size(const pConfig: Pma_hpf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_hpf2_init_preallocated(const pConfig: Pma_hpf2_config; pHeap: Pointer; pHPF: Pma_hpf2): ma_result; cdecl; external;
function  ma_hpf2_init(const pConfig: Pma_hpf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pHPF: Pma_hpf2): ma_result; cdecl; external;
procedure ma_hpf2_uninit(pHPF: Pma_hpf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_hpf2_reinit(const pConfig: Pma_hpf2_config; pHPF: Pma_hpf2): ma_result; cdecl; external;
function  ma_hpf2_process_pcm_frames(pHPF: Pma_hpf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_hpf2_get_latency(const pHPF: Pma_hpf2): ma_uint32; cdecl; external;
function  ma_hpf_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_hpf_config; cdecl; external;
function  ma_hpf_get_heap_size(const pConfig: Pma_hpf_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_hpf_init_preallocated(const pConfig: Pma_hpf_config; pHeap: Pointer; pLPF: Pma_hpf): ma_result; cdecl; external;
function  ma_hpf_init(const pConfig: Pma_hpf_config; const pAllocationCallbacks: Pma_allocation_callbacks; pHPF: Pma_hpf): ma_result; cdecl; external;
procedure ma_hpf_uninit(pHPF: Pma_hpf; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_hpf_reinit(const pConfig: Pma_hpf_config; pHPF: Pma_hpf): ma_result; cdecl; external;
function  ma_hpf_process_pcm_frames(pHPF: Pma_hpf; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_hpf_get_latency(const pHPF: Pma_hpf): ma_uint32; cdecl; external;
function  ma_bpf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; q: Double): ma_bpf2_config; cdecl; external;
function  ma_bpf2_get_heap_size(const pConfig: Pma_bpf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_bpf2_init_preallocated(const pConfig: Pma_bpf2_config; pHeap: Pointer; pBPF: Pma_bpf2): ma_result; cdecl; external;
function  ma_bpf2_init(const pConfig: Pma_bpf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pBPF: Pma_bpf2): ma_result; cdecl; external;
procedure ma_bpf2_uninit(pBPF: Pma_bpf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_bpf2_reinit(const pConfig: Pma_bpf2_config; pBPF: Pma_bpf2): ma_result; cdecl; external;
function  ma_bpf2_process_pcm_frames(pBPF: Pma_bpf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_bpf2_get_latency(const pBPF: Pma_bpf2): ma_uint32; cdecl; external;
function  ma_bpf_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_bpf_config; cdecl; external;
function  ma_bpf_get_heap_size(const pConfig: Pma_bpf_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_bpf_init_preallocated(const pConfig: Pma_bpf_config; pHeap: Pointer; pBPF: Pma_bpf): ma_result; cdecl; external;
function  ma_bpf_init(const pConfig: Pma_bpf_config; const pAllocationCallbacks: Pma_allocation_callbacks; pBPF: Pma_bpf): ma_result; cdecl; external;
procedure ma_bpf_uninit(pBPF: Pma_bpf; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_bpf_reinit(const pConfig: Pma_bpf_config; pBPF: Pma_bpf): ma_result; cdecl; external;
function  ma_bpf_process_pcm_frames(pBPF: Pma_bpf; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_bpf_get_latency(const pBPF: Pma_bpf): ma_uint32; cdecl; external;
function  ma_notch2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; q: Double; frequency: Double): ma_notch2_config; cdecl; external;
function  ma_notch2_get_heap_size(const pConfig: Pma_notch2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_notch2_init_preallocated(const pConfig: Pma_notch2_config; pHeap: Pointer; pFilter: Pma_notch2): ma_result; cdecl; external;
function  ma_notch2_init(const pConfig: Pma_notch2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pFilter: Pma_notch2): ma_result; cdecl; external;
procedure ma_notch2_uninit(pFilter: Pma_notch2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_notch2_reinit(const pConfig: Pma_notch2_config; pFilter: Pma_notch2): ma_result; cdecl; external;
function  ma_notch2_process_pcm_frames(pFilter: Pma_notch2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_notch2_get_latency(const pFilter: Pma_notch2): ma_uint32; cdecl; external;
function  ma_peak2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; q: Double; frequency: Double): ma_peak2_config; cdecl; external;
function  ma_peak2_get_heap_size(const pConfig: Pma_peak2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_peak2_init_preallocated(const pConfig: Pma_peak2_config; pHeap: Pointer; pFilter: Pma_peak2): ma_result; cdecl; external;
function  ma_peak2_init(const pConfig: Pma_peak2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pFilter: Pma_peak2): ma_result; cdecl; external;
procedure ma_peak2_uninit(pFilter: Pma_peak2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_peak2_reinit(const pConfig: Pma_peak2_config; pFilter: Pma_peak2): ma_result; cdecl; external;
function  ma_peak2_process_pcm_frames(pFilter: Pma_peak2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_peak2_get_latency(const pFilter: Pma_peak2): ma_uint32; cdecl; external;
function  ma_loshelf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; shelfSlope: Double; frequency: Double): ma_loshelf2_config; cdecl; external;
function  ma_loshelf2_get_heap_size(const pConfig: Pma_loshelf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_loshelf2_init_preallocated(const pConfig: Pma_loshelf2_config; pHeap: Pointer; pFilter: Pma_loshelf2): ma_result; cdecl; external;
function  ma_loshelf2_init(const pConfig: Pma_loshelf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pFilter: Pma_loshelf2): ma_result; cdecl; external;
procedure ma_loshelf2_uninit(pFilter: Pma_loshelf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_loshelf2_reinit(const pConfig: Pma_loshelf2_config; pFilter: Pma_loshelf2): ma_result; cdecl; external;
function  ma_loshelf2_process_pcm_frames(pFilter: Pma_loshelf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_loshelf2_get_latency(const pFilter: Pma_loshelf2): ma_uint32; cdecl; external;
function  ma_hishelf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; shelfSlope: Double; frequency: Double): ma_hishelf2_config; cdecl; external;
function  ma_hishelf2_get_heap_size(const pConfig: Pma_hishelf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_hishelf2_init_preallocated(const pConfig: Pma_hishelf2_config; pHeap: Pointer; pFilter: Pma_hishelf2): ma_result; cdecl; external;
function  ma_hishelf2_init(const pConfig: Pma_hishelf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pFilter: Pma_hishelf2): ma_result; cdecl; external;
procedure ma_hishelf2_uninit(pFilter: Pma_hishelf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_hishelf2_reinit(const pConfig: Pma_hishelf2_config; pFilter: Pma_hishelf2): ma_result; cdecl; external;
function  ma_hishelf2_process_pcm_frames(pFilter: Pma_hishelf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_hishelf2_get_latency(const pFilter: Pma_hishelf2): ma_uint32; cdecl; external;
function  ma_delay_config_init(channels: ma_uint32; sampleRate: ma_uint32; delayInFrames: ma_uint32; decay: Single): ma_delay_config; cdecl; external;
function  ma_delay_init(const pConfig: Pma_delay_config; const pAllocationCallbacks: Pma_allocation_callbacks; pDelay: Pma_delay): ma_result; cdecl; external;
procedure ma_delay_uninit(pDelay: Pma_delay; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_delay_process_pcm_frames(pDelay: Pma_delay; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint32): ma_result; cdecl; external;
procedure ma_delay_set_wet(pDelay: Pma_delay; value: Single); cdecl; external;
function  ma_delay_get_wet(const pDelay: Pma_delay): Single; cdecl; external;
procedure ma_delay_set_dry(pDelay: Pma_delay; value: Single); cdecl; external;
function  ma_delay_get_dry(const pDelay: Pma_delay): Single; cdecl; external;
procedure ma_delay_set_decay(pDelay: Pma_delay; value: Single); cdecl; external;
function  ma_delay_get_decay(const pDelay: Pma_delay): Single; cdecl; external;
function  ma_gainer_config_init(channels: ma_uint32; smoothTimeInFrames: ma_uint32): ma_gainer_config; cdecl; external;
function  ma_gainer_get_heap_size(const pConfig: Pma_gainer_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_gainer_init_preallocated(const pConfig: Pma_gainer_config; pHeap: Pointer; pGainer: Pma_gainer): ma_result; cdecl; external;
function  ma_gainer_init(const pConfig: Pma_gainer_config; const pAllocationCallbacks: Pma_allocation_callbacks; pGainer: Pma_gainer): ma_result; cdecl; external;
procedure ma_gainer_uninit(pGainer: Pma_gainer; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_gainer_process_pcm_frames(pGainer: Pma_gainer; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_gainer_set_gain(pGainer: Pma_gainer; newGain: Single): ma_result; cdecl; external;
function  ma_gainer_set_gains(pGainer: Pma_gainer; pNewGains: PSingle): ma_result; cdecl; external;
function  ma_gainer_set_master_volume(pGainer: Pma_gainer; volume: Single): ma_result; cdecl; external;
function  ma_gainer_get_master_volume(const pGainer: Pma_gainer; pVolume: PSingle): ma_result; cdecl; external;
function  ma_panner_config_init(format: ma_format; channels: ma_uint32): ma_panner_config; cdecl; external;
function  ma_panner_init(const pConfig: Pma_panner_config; pPanner: Pma_panner): ma_result; cdecl; external;
function  ma_panner_process_pcm_frames(pPanner: Pma_panner; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
procedure ma_panner_set_mode(pPanner: Pma_panner; mode: ma_pan_mode); cdecl; external;
function  ma_panner_get_mode(const pPanner: Pma_panner): ma_pan_mode; cdecl; external;
procedure ma_panner_set_pan(pPanner: Pma_panner; pan: Single); cdecl; external;
function  ma_panner_get_pan(const pPanner: Pma_panner): Single; cdecl; external;
function  ma_fader_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32): ma_fader_config; cdecl; external;
function  ma_fader_init(const pConfig: Pma_fader_config; pFader: Pma_fader): ma_result; cdecl; external;
function  ma_fader_process_pcm_frames(pFader: Pma_fader; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
procedure ma_fader_get_data_format(const pFader: Pma_fader; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32); cdecl; external;
procedure ma_fader_set_fade(pFader: Pma_fader; volumeBeg: Single; volumeEnd: Single; lengthInFrames: ma_uint64); cdecl; external;
procedure ma_fader_set_fade_ex(pFader: Pma_fader; volumeBeg: Single; volumeEnd: Single; lengthInFrames: ma_uint64; startOffsetInFrames: ma_int64); cdecl; external;
function  ma_fader_get_current_volume(const pFader: Pma_fader): Single; cdecl; external;
function  ma_spatializer_listener_config_init(channelsOut: ma_uint32): ma_spatializer_listener_config; cdecl; external;
function  ma_spatializer_listener_get_heap_size(const pConfig: Pma_spatializer_listener_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_spatializer_listener_init_preallocated(const pConfig: Pma_spatializer_listener_config; pHeap: Pointer; pListener: Pma_spatializer_listener): ma_result; cdecl; external;
function  ma_spatializer_listener_init(const pConfig: Pma_spatializer_listener_config; const pAllocationCallbacks: Pma_allocation_callbacks; pListener: Pma_spatializer_listener): ma_result; cdecl; external;
procedure ma_spatializer_listener_uninit(pListener: Pma_spatializer_listener; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_spatializer_listener_get_channel_map(pListener: Pma_spatializer_listener): Pma_channel; cdecl; external;
procedure ma_spatializer_listener_set_cone(pListener: Pma_spatializer_listener; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl; external;
procedure ma_spatializer_listener_get_cone(const pListener: Pma_spatializer_listener; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl; external;
procedure ma_spatializer_listener_set_position(pListener: Pma_spatializer_listener; x: Single; y: Single; z: Single); cdecl; external;
function  ma_spatializer_listener_get_position(const pListener: Pma_spatializer_listener): ma_vec3f; cdecl; external;
procedure ma_spatializer_listener_set_direction(pListener: Pma_spatializer_listener; x: Single; y: Single; z: Single); cdecl; external;
function  ma_spatializer_listener_get_direction(const pListener: Pma_spatializer_listener): ma_vec3f; cdecl; external;
procedure ma_spatializer_listener_set_velocity(pListener: Pma_spatializer_listener; x: Single; y: Single; z: Single); cdecl; external;
function  ma_spatializer_listener_get_velocity(const pListener: Pma_spatializer_listener): ma_vec3f; cdecl; external;
procedure ma_spatializer_listener_set_speed_of_sound(pListener: Pma_spatializer_listener; speedOfSound: Single); cdecl; external;
function  ma_spatializer_listener_get_speed_of_sound(const pListener: Pma_spatializer_listener): Single; cdecl; external;
procedure ma_spatializer_listener_set_world_up(pListener: Pma_spatializer_listener; x: Single; y: Single; z: Single); cdecl; external;
function  ma_spatializer_listener_get_world_up(const pListener: Pma_spatializer_listener): ma_vec3f; cdecl; external;
procedure ma_spatializer_listener_set_enabled(pListener: Pma_spatializer_listener; isEnabled: ma_bool32); cdecl; external;
function  ma_spatializer_listener_is_enabled(const pListener: Pma_spatializer_listener): ma_bool32; cdecl; external;
function  ma_spatializer_config_init(channelsIn: ma_uint32; channelsOut: ma_uint32): ma_spatializer_config; cdecl; external;
function  ma_spatializer_get_heap_size(const pConfig: Pma_spatializer_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_spatializer_init_preallocated(const pConfig: Pma_spatializer_config; pHeap: Pointer; pSpatializer: Pma_spatializer): ma_result; cdecl; external;
function  ma_spatializer_init(const pConfig: Pma_spatializer_config; const pAllocationCallbacks: Pma_allocation_callbacks; pSpatializer: Pma_spatializer): ma_result; cdecl; external;
procedure ma_spatializer_uninit(pSpatializer: Pma_spatializer; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_spatializer_process_pcm_frames(pSpatializer: Pma_spatializer; pListener: Pma_spatializer_listener; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_spatializer_set_master_volume(pSpatializer: Pma_spatializer; volume: Single): ma_result; cdecl; external;
function  ma_spatializer_get_master_volume(const pSpatializer: Pma_spatializer; pVolume: PSingle): ma_result; cdecl; external;
function  ma_spatializer_get_input_channels(const pSpatializer: Pma_spatializer): ma_uint32; cdecl; external;
function  ma_spatializer_get_output_channels(const pSpatializer: Pma_spatializer): ma_uint32; cdecl; external;
procedure ma_spatializer_set_attenuation_model(pSpatializer: Pma_spatializer; attenuationModel: ma_attenuation_model); cdecl; external;
function  ma_spatializer_get_attenuation_model(const pSpatializer: Pma_spatializer): ma_attenuation_model; cdecl; external;
procedure ma_spatializer_set_positioning(pSpatializer: Pma_spatializer; positioning: ma_positioning); cdecl; external;
function  ma_spatializer_get_positioning(const pSpatializer: Pma_spatializer): ma_positioning; cdecl; external;
procedure ma_spatializer_set_rolloff(pSpatializer: Pma_spatializer; rolloff: Single); cdecl; external;
function  ma_spatializer_get_rolloff(const pSpatializer: Pma_spatializer): Single; cdecl; external;
procedure ma_spatializer_set_min_gain(pSpatializer: Pma_spatializer; minGain: Single); cdecl; external;
function  ma_spatializer_get_min_gain(const pSpatializer: Pma_spatializer): Single; cdecl; external;
procedure ma_spatializer_set_max_gain(pSpatializer: Pma_spatializer; maxGain: Single); cdecl; external;
function  ma_spatializer_get_max_gain(const pSpatializer: Pma_spatializer): Single; cdecl; external;
procedure ma_spatializer_set_min_distance(pSpatializer: Pma_spatializer; minDistance: Single); cdecl; external;
function  ma_spatializer_get_min_distance(const pSpatializer: Pma_spatializer): Single; cdecl; external;
procedure ma_spatializer_set_max_distance(pSpatializer: Pma_spatializer; maxDistance: Single); cdecl; external;
function  ma_spatializer_get_max_distance(const pSpatializer: Pma_spatializer): Single; cdecl; external;
procedure ma_spatializer_set_cone(pSpatializer: Pma_spatializer; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl; external;
procedure ma_spatializer_get_cone(const pSpatializer: Pma_spatializer; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl; external;
procedure ma_spatializer_set_doppler_factor(pSpatializer: Pma_spatializer; dopplerFactor: Single); cdecl; external;
function  ma_spatializer_get_doppler_factor(const pSpatializer: Pma_spatializer): Single; cdecl; external;
procedure ma_spatializer_set_directional_attenuation_factor(pSpatializer: Pma_spatializer; directionalAttenuationFactor: Single); cdecl; external;
function  ma_spatializer_get_directional_attenuation_factor(const pSpatializer: Pma_spatializer): Single; cdecl; external;
procedure ma_spatializer_set_position(pSpatializer: Pma_spatializer; x: Single; y: Single; z: Single); cdecl; external;
function  ma_spatializer_get_position(const pSpatializer: Pma_spatializer): ma_vec3f; cdecl; external;
procedure ma_spatializer_set_direction(pSpatializer: Pma_spatializer; x: Single; y: Single; z: Single); cdecl; external;
function  ma_spatializer_get_direction(const pSpatializer: Pma_spatializer): ma_vec3f; cdecl; external;
procedure ma_spatializer_set_velocity(pSpatializer: Pma_spatializer; x: Single; y: Single; z: Single); cdecl; external;
function  ma_spatializer_get_velocity(const pSpatializer: Pma_spatializer): ma_vec3f; cdecl; external;
procedure ma_spatializer_get_relative_position_and_direction(const pSpatializer: Pma_spatializer; const pListener: Pma_spatializer_listener; pRelativePos: Pma_vec3f; pRelativeDir: Pma_vec3f); cdecl; external;
function  ma_linear_resampler_config_init(format: ma_format; channels: ma_uint32; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_linear_resampler_config; cdecl; external;
function  ma_linear_resampler_get_heap_size(const pConfig: Pma_linear_resampler_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_linear_resampler_init_preallocated(const pConfig: Pma_linear_resampler_config; pHeap: Pointer; pResampler: Pma_linear_resampler): ma_result; cdecl; external;
function  ma_linear_resampler_init(const pConfig: Pma_linear_resampler_config; const pAllocationCallbacks: Pma_allocation_callbacks; pResampler: Pma_linear_resampler): ma_result; cdecl; external;
procedure ma_linear_resampler_uninit(pResampler: Pma_linear_resampler; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_linear_resampler_process_pcm_frames(pResampler: Pma_linear_resampler; const pFramesIn: Pointer; pFrameCountIn: Pma_uint64; pFramesOut: Pointer; pFrameCountOut: Pma_uint64): ma_result; cdecl; external;
function  ma_linear_resampler_set_rate(pResampler: Pma_linear_resampler; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_result; cdecl; external;
function  ma_linear_resampler_set_rate_ratio(pResampler: Pma_linear_resampler; ratioInOut: Single): ma_result; cdecl; external;
function  ma_linear_resampler_get_input_latency(const pResampler: Pma_linear_resampler): ma_uint64; cdecl; external;
function  ma_linear_resampler_get_output_latency(const pResampler: Pma_linear_resampler): ma_uint64; cdecl; external;
function  ma_linear_resampler_get_required_input_frame_count(const pResampler: Pma_linear_resampler; outputFrameCount: ma_uint64; pInputFrameCount: Pma_uint64): ma_result; cdecl; external;
function  ma_linear_resampler_get_expected_output_frame_count(const pResampler: Pma_linear_resampler; inputFrameCount: ma_uint64; pOutputFrameCount: Pma_uint64): ma_result; cdecl; external;
function  ma_linear_resampler_reset(pResampler: Pma_linear_resampler): ma_result; cdecl; external;
function  ma_resampler_config_init(format: ma_format; channels: ma_uint32; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32; algorithm: ma_resample_algorithm): ma_resampler_config; cdecl; external;
function  ma_resampler_get_heap_size(const pConfig: Pma_resampler_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_resampler_init_preallocated(const pConfig: Pma_resampler_config; pHeap: Pointer; pResampler: Pma_resampler): ma_result; cdecl; external;
function  ma_resampler_init(const pConfig: Pma_resampler_config; const pAllocationCallbacks: Pma_allocation_callbacks; pResampler: Pma_resampler): ma_result; cdecl; external;
procedure ma_resampler_uninit(pResampler: Pma_resampler; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_resampler_process_pcm_frames(pResampler: Pma_resampler; const pFramesIn: Pointer; pFrameCountIn: Pma_uint64; pFramesOut: Pointer; pFrameCountOut: Pma_uint64): ma_result; cdecl; external;
function  ma_resampler_set_rate(pResampler: Pma_resampler; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_result; cdecl; external;
function  ma_resampler_set_rate_ratio(pResampler: Pma_resampler; ratio: Single): ma_result; cdecl; external;
function  ma_resampler_get_input_latency(const pResampler: Pma_resampler): ma_uint64; cdecl; external;
function  ma_resampler_get_output_latency(const pResampler: Pma_resampler): ma_uint64; cdecl; external;
function  ma_resampler_get_required_input_frame_count(const pResampler: Pma_resampler; outputFrameCount: ma_uint64; pInputFrameCount: Pma_uint64): ma_result; cdecl; external;
function  ma_resampler_get_expected_output_frame_count(const pResampler: Pma_resampler; inputFrameCount: ma_uint64; pOutputFrameCount: Pma_uint64): ma_result; cdecl; external;
function  ma_resampler_reset(pResampler: Pma_resampler): ma_result; cdecl; external;
function  ma_channel_converter_config_init(format: ma_format; channelsIn: ma_uint32; const pChannelMapIn: Pma_channel; channelsOut: ma_uint32; const pChannelMapOut: Pma_channel; mixingMode: ma_channel_mix_mode): ma_channel_converter_config; cdecl; external;
function  ma_channel_converter_get_heap_size(const pConfig: Pma_channel_converter_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_channel_converter_init_preallocated(const pConfig: Pma_channel_converter_config; pHeap: Pointer; pConverter: Pma_channel_converter): ma_result; cdecl; external;
function  ma_channel_converter_init(const pConfig: Pma_channel_converter_config; const pAllocationCallbacks: Pma_allocation_callbacks; pConverter: Pma_channel_converter): ma_result; cdecl; external;
procedure ma_channel_converter_uninit(pConverter: Pma_channel_converter; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_channel_converter_process_pcm_frames(pConverter: Pma_channel_converter; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_channel_converter_get_input_channel_map(const pConverter: Pma_channel_converter; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_channel_converter_get_output_channel_map(const pConverter: Pma_channel_converter; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_data_converter_config_init_default(): ma_data_converter_config; cdecl; external;
function  ma_data_converter_config_init(formatIn: ma_format; formatOut: ma_format; channelsIn: ma_uint32; channelsOut: ma_uint32; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_data_converter_config; cdecl; external;
function  ma_data_converter_get_heap_size(const pConfig: Pma_data_converter_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_data_converter_init_preallocated(const pConfig: Pma_data_converter_config; pHeap: Pointer; pConverter: Pma_data_converter): ma_result; cdecl; external;
function  ma_data_converter_init(const pConfig: Pma_data_converter_config; const pAllocationCallbacks: Pma_allocation_callbacks; pConverter: Pma_data_converter): ma_result; cdecl; external;
procedure ma_data_converter_uninit(pConverter: Pma_data_converter; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_data_converter_process_pcm_frames(pConverter: Pma_data_converter; const pFramesIn: Pointer; pFrameCountIn: Pma_uint64; pFramesOut: Pointer; pFrameCountOut: Pma_uint64): ma_result; cdecl; external;
function  ma_data_converter_set_rate(pConverter: Pma_data_converter; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_result; cdecl; external;
function  ma_data_converter_set_rate_ratio(pConverter: Pma_data_converter; ratioInOut: Single): ma_result; cdecl; external;
function  ma_data_converter_get_input_latency(const pConverter: Pma_data_converter): ma_uint64; cdecl; external;
function  ma_data_converter_get_output_latency(const pConverter: Pma_data_converter): ma_uint64; cdecl; external;
function  ma_data_converter_get_required_input_frame_count(const pConverter: Pma_data_converter; outputFrameCount: ma_uint64; pInputFrameCount: Pma_uint64): ma_result; cdecl; external;
function  ma_data_converter_get_expected_output_frame_count(const pConverter: Pma_data_converter; inputFrameCount: ma_uint64; pOutputFrameCount: Pma_uint64): ma_result; cdecl; external;
function  ma_data_converter_get_input_channel_map(const pConverter: Pma_data_converter; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_data_converter_get_output_channel_map(const pConverter: Pma_data_converter; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_data_converter_reset(pConverter: Pma_data_converter): ma_result; cdecl; external;
procedure ma_pcm_u8_to_s16(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_u8_to_s24(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_u8_to_s32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_u8_to_f32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s16_to_u8(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s16_to_s24(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s16_to_s32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s16_to_f32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s24_to_u8(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s24_to_s16(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s24_to_s32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s24_to_f32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s32_to_u8(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s32_to_s16(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s32_to_s24(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_s32_to_f32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_f32_to_u8(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_f32_to_s16(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_f32_to_s24(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_f32_to_s32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_pcm_convert(pOut: Pointer; formatOut: ma_format; const pIn: Pointer; formatIn: ma_format; sampleCount: ma_uint64; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_convert_pcm_frames_format(pOut: Pointer; formatOut: ma_format; const pIn: Pointer; formatIn: ma_format; frameCount: ma_uint64; channels: ma_uint32; ditherMode: ma_dither_mode); cdecl; external;
procedure ma_deinterleave_pcm_frames(format: ma_format; channels: ma_uint32; frameCount: ma_uint64; const pInterleavedPCMFrames: Pointer; ppDeinterleavedPCMFrames: PPointer); cdecl; external;
procedure ma_interleave_pcm_frames(format: ma_format; channels: ma_uint32; frameCount: ma_uint64; ppDeinterleavedPCMFrames: PPointer; pInterleavedPCMFrames: Pointer); cdecl; external;
function  ma_channel_map_get_channel(const pChannelMap: Pma_channel; channelCount: ma_uint32; channelIndex: ma_uint32): ma_channel; cdecl; external;
procedure ma_channel_map_init_blank(pChannelMap: Pma_channel; channels: ma_uint32); cdecl; external;
procedure ma_channel_map_init_standard(standardChannelMap: ma_standard_channel_map; pChannelMap: Pma_channel; channelMapCap: NativeUInt; channels: ma_uint32); cdecl; external;
procedure ma_channel_map_copy(pOut: Pma_channel; const pIn: Pma_channel; channels: ma_uint32); cdecl; external;
procedure ma_channel_map_copy_or_default(pOut: Pma_channel; channelMapCapOut: NativeUInt; const pIn: Pma_channel; channels: ma_uint32); cdecl; external;
function  ma_channel_map_is_valid(const pChannelMap: Pma_channel; channels: ma_uint32): ma_bool32; cdecl; external;
function  ma_channel_map_is_equal(const pChannelMapA: Pma_channel; const pChannelMapB: Pma_channel; channels: ma_uint32): ma_bool32; cdecl; external;
function  ma_channel_map_is_blank(const pChannelMap: Pma_channel; channels: ma_uint32): ma_bool32; cdecl; external;
function  ma_channel_map_contains_channel_position(channels: ma_uint32; const pChannelMap: Pma_channel; channelPosition: ma_channel): ma_bool32; cdecl; external;
function  ma_channel_map_find_channel_position(channels: ma_uint32; const pChannelMap: Pma_channel; channelPosition: ma_channel; pChannelIndex: Pma_uint32): ma_bool32; cdecl; external;
function  ma_channel_map_to_string(const pChannelMap: Pma_channel; channels: ma_uint32; pBufferOut: PUTF8Char; bufferCap: NativeUInt): NativeUInt; cdecl; external;
function  ma_channel_position_to_string(channel: ma_channel): PUTF8Char; cdecl; external;
function  ma_convert_frames(pOut: Pointer; frameCountOut: ma_uint64; formatOut: ma_format; channelsOut: ma_uint32; sampleRateOut: ma_uint32; const pIn: Pointer; frameCountIn: ma_uint64; formatIn: ma_format; channelsIn: ma_uint32; sampleRateIn: ma_uint32): ma_uint64; cdecl; external;
function  ma_convert_frames_ex(pOut: Pointer; frameCountOut: ma_uint64; const pIn: Pointer; frameCountIn: ma_uint64; const pConfig: Pma_data_converter_config): ma_uint64; cdecl; external;
function  ma_data_source_config_init(): ma_data_source_config; cdecl; external;
function  ma_data_source_init(const pConfig: Pma_data_source_config; pDataSource: Pma_data_source): ma_result; cdecl; external;
procedure ma_data_source_uninit(pDataSource: Pma_data_source); cdecl; external;
function  ma_data_source_read_pcm_frames(pDataSource: Pma_data_source; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_data_source_seek_pcm_frames(pDataSource: Pma_data_source; frameCount: ma_uint64; pFramesSeeked: Pma_uint64): ma_result; cdecl; external;
function  ma_data_source_seek_to_pcm_frame(pDataSource: Pma_data_source; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_data_source_get_data_format(pDataSource: Pma_data_source; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_data_source_get_cursor_in_pcm_frames(pDataSource: Pma_data_source; pCursor: Pma_uint64): ma_result; cdecl; external;
function  ma_data_source_get_length_in_pcm_frames(pDataSource: Pma_data_source; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_data_source_get_cursor_in_seconds(pDataSource: Pma_data_source; pCursor: PSingle): ma_result; cdecl; external;
function  ma_data_source_get_length_in_seconds(pDataSource: Pma_data_source; pLength: PSingle): ma_result; cdecl; external;
function  ma_data_source_set_looping(pDataSource: Pma_data_source; isLooping: ma_bool32): ma_result; cdecl; external;
function  ma_data_source_is_looping(const pDataSource: Pma_data_source): ma_bool32; cdecl; external;
function  ma_data_source_set_range_in_pcm_frames(pDataSource: Pma_data_source; rangeBegInFrames: ma_uint64; rangeEndInFrames: ma_uint64): ma_result; cdecl; external;
procedure ma_data_source_get_range_in_pcm_frames(const pDataSource: Pma_data_source; pRangeBegInFrames: Pma_uint64; pRangeEndInFrames: Pma_uint64); cdecl; external;
function  ma_data_source_set_loop_point_in_pcm_frames(pDataSource: Pma_data_source; loopBegInFrames: ma_uint64; loopEndInFrames: ma_uint64): ma_result; cdecl; external;
procedure ma_data_source_get_loop_point_in_pcm_frames(const pDataSource: Pma_data_source; pLoopBegInFrames: Pma_uint64; pLoopEndInFrames: Pma_uint64); cdecl; external;
function  ma_data_source_set_current(pDataSource: Pma_data_source; pCurrentDataSource: Pma_data_source): ma_result; cdecl; external;
function  ma_data_source_get_current(const pDataSource: Pma_data_source): Pma_data_source; cdecl; external;
function  ma_data_source_set_next(pDataSource: Pma_data_source; pNextDataSource: Pma_data_source): ma_result; cdecl; external;
function  ma_data_source_get_next(const pDataSource: Pma_data_source): Pma_data_source; cdecl; external;
function  ma_data_source_set_next_callback(pDataSource: Pma_data_source; onGetNext: ma_data_source_get_next_proc): ma_result; cdecl; external;
function  ma_data_source_get_next_callback(const pDataSource: Pma_data_source): ma_data_source_get_next_proc; cdecl; external;
function  ma_audio_buffer_ref_init(format: ma_format; channels: ma_uint32; const pData: Pointer; sizeInFrames: ma_uint64; pAudioBufferRef: Pma_audio_buffer_ref): ma_result; cdecl; external;
procedure ma_audio_buffer_ref_uninit(pAudioBufferRef: Pma_audio_buffer_ref); cdecl; external;
function  ma_audio_buffer_ref_set_data(pAudioBufferRef: Pma_audio_buffer_ref; const pData: Pointer; sizeInFrames: ma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_ref_read_pcm_frames(pAudioBufferRef: Pma_audio_buffer_ref; pFramesOut: Pointer; frameCount: ma_uint64; loop: ma_bool32): ma_uint64; cdecl; external;
function  ma_audio_buffer_ref_seek_to_pcm_frame(pAudioBufferRef: Pma_audio_buffer_ref; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_ref_map(pAudioBufferRef: Pma_audio_buffer_ref; ppFramesOut: PPointer; pFrameCount: Pma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_ref_unmap(pAudioBufferRef: Pma_audio_buffer_ref; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_ref_at_end(const pAudioBufferRef: Pma_audio_buffer_ref): ma_bool32; cdecl; external;
function  ma_audio_buffer_ref_get_cursor_in_pcm_frames(const pAudioBufferRef: Pma_audio_buffer_ref; pCursor: Pma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_ref_get_length_in_pcm_frames(const pAudioBufferRef: Pma_audio_buffer_ref; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_ref_get_available_frames(const pAudioBufferRef: Pma_audio_buffer_ref; pAvailableFrames: Pma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_config_init(format: ma_format; channels: ma_uint32; sizeInFrames: ma_uint64; const pData: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks): ma_audio_buffer_config; cdecl; external;
function  ma_audio_buffer_init(const pConfig: Pma_audio_buffer_config; pAudioBuffer: Pma_audio_buffer): ma_result; cdecl; external;
function  ma_audio_buffer_init_copy(const pConfig: Pma_audio_buffer_config; pAudioBuffer: Pma_audio_buffer): ma_result; cdecl; external;
function  ma_audio_buffer_alloc_and_init(const pConfig: Pma_audio_buffer_config; ppAudioBuffer: PPma_audio_buffer): ma_result; cdecl; external;
procedure ma_audio_buffer_uninit(pAudioBuffer: Pma_audio_buffer); cdecl; external;
procedure ma_audio_buffer_uninit_and_free(pAudioBuffer: Pma_audio_buffer); cdecl; external;
function  ma_audio_buffer_read_pcm_frames(pAudioBuffer: Pma_audio_buffer; pFramesOut: Pointer; frameCount: ma_uint64; loop: ma_bool32): ma_uint64; cdecl; external;
function  ma_audio_buffer_seek_to_pcm_frame(pAudioBuffer: Pma_audio_buffer; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_map(pAudioBuffer: Pma_audio_buffer; ppFramesOut: PPointer; pFrameCount: Pma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_unmap(pAudioBuffer: Pma_audio_buffer; frameCount: ma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_at_end(const pAudioBuffer: Pma_audio_buffer): ma_bool32; cdecl; external;
function  ma_audio_buffer_get_cursor_in_pcm_frames(const pAudioBuffer: Pma_audio_buffer; pCursor: Pma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_get_length_in_pcm_frames(const pAudioBuffer: Pma_audio_buffer; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_audio_buffer_get_available_frames(const pAudioBuffer: Pma_audio_buffer; pAvailableFrames: Pma_uint64): ma_result; cdecl; external;
function  ma_paged_audio_buffer_data_init(format: ma_format; channels: ma_uint32; pData: Pma_paged_audio_buffer_data): ma_result; cdecl; external;
procedure ma_paged_audio_buffer_data_uninit(pData: Pma_paged_audio_buffer_data; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_paged_audio_buffer_data_get_head(pData: Pma_paged_audio_buffer_data): Pma_paged_audio_buffer_page; cdecl; external;
function  ma_paged_audio_buffer_data_get_tail(pData: Pma_paged_audio_buffer_data): Pma_paged_audio_buffer_page; cdecl; external;
function  ma_paged_audio_buffer_data_get_length_in_pcm_frames(pData: Pma_paged_audio_buffer_data; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_paged_audio_buffer_data_allocate_page(pData: Pma_paged_audio_buffer_data; pageSizeInFrames: ma_uint64; const pInitialData: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; ppPage: PPma_paged_audio_buffer_page): ma_result; cdecl; external;
function  ma_paged_audio_buffer_data_free_page(pData: Pma_paged_audio_buffer_data; pPage: Pma_paged_audio_buffer_page; const pAllocationCallbacks: Pma_allocation_callbacks): ma_result; cdecl; external;
function  ma_paged_audio_buffer_data_append_page(pData: Pma_paged_audio_buffer_data; pPage: Pma_paged_audio_buffer_page): ma_result; cdecl; external;
function  ma_paged_audio_buffer_data_allocate_and_append_page(pData: Pma_paged_audio_buffer_data; pageSizeInFrames: ma_uint32; const pInitialData: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks): ma_result; cdecl; external;
function  ma_paged_audio_buffer_config_init(pData: Pma_paged_audio_buffer_data): ma_paged_audio_buffer_config; cdecl; external;
function  ma_paged_audio_buffer_init(const pConfig: Pma_paged_audio_buffer_config; pPagedAudioBuffer: Pma_paged_audio_buffer): ma_result; cdecl; external;
procedure ma_paged_audio_buffer_uninit(pPagedAudioBuffer: Pma_paged_audio_buffer); cdecl; external;
function  ma_paged_audio_buffer_read_pcm_frames(pPagedAudioBuffer: Pma_paged_audio_buffer; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_paged_audio_buffer_seek_to_pcm_frame(pPagedAudioBuffer: Pma_paged_audio_buffer; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_paged_audio_buffer_get_cursor_in_pcm_frames(pPagedAudioBuffer: Pma_paged_audio_buffer; pCursor: Pma_uint64): ma_result; cdecl; external;
function  ma_paged_audio_buffer_get_length_in_pcm_frames(pPagedAudioBuffer: Pma_paged_audio_buffer; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_rb_init_ex(subbufferSizeInBytes: NativeUInt; subbufferCount: NativeUInt; subbufferStrideInBytes: NativeUInt; pOptionalPreallocatedBuffer: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_rb): ma_result; cdecl; external;
function  ma_rb_init(bufferSizeInBytes: NativeUInt; pOptionalPreallocatedBuffer: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_rb): ma_result; cdecl; external;
procedure ma_rb_uninit(pRB: Pma_rb); cdecl; external;
procedure ma_rb_reset(pRB: Pma_rb); cdecl; external;
function  ma_rb_acquire_read(pRB: Pma_rb; pSizeInBytes: PNativeUInt; ppBufferOut: PPointer): ma_result; cdecl; external;
function  ma_rb_commit_read(pRB: Pma_rb; sizeInBytes: NativeUInt): ma_result; cdecl; external;
function  ma_rb_acquire_write(pRB: Pma_rb; pSizeInBytes: PNativeUInt; ppBufferOut: PPointer): ma_result; cdecl; external;
function  ma_rb_commit_write(pRB: Pma_rb; sizeInBytes: NativeUInt): ma_result; cdecl; external;
function  ma_rb_seek_read(pRB: Pma_rb; offsetInBytes: NativeUInt): ma_result; cdecl; external;
function  ma_rb_seek_write(pRB: Pma_rb; offsetInBytes: NativeUInt): ma_result; cdecl; external;
function  ma_rb_pointer_distance(pRB: Pma_rb): ma_int32; cdecl; external;
function  ma_rb_available_read(pRB: Pma_rb): ma_uint32; cdecl; external;
function  ma_rb_available_write(pRB: Pma_rb): ma_uint32; cdecl; external;
function  ma_rb_get_subbuffer_size(pRB: Pma_rb): NativeUInt; cdecl; external;
function  ma_rb_get_subbuffer_stride(pRB: Pma_rb): NativeUInt; cdecl; external;
function  ma_rb_get_subbuffer_offset(pRB: Pma_rb; subbufferIndex: NativeUInt): NativeUInt; cdecl; external;
function  ma_rb_get_subbuffer_ptr(pRB: Pma_rb; subbufferIndex: NativeUInt; pBuffer: Pointer): Pointer; cdecl; external;
function  ma_pcm_rb_init_ex(format: ma_format; channels: ma_uint32; subbufferSizeInFrames: ma_uint32; subbufferCount: ma_uint32; subbufferStrideInFrames: ma_uint32; pOptionalPreallocatedBuffer: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_pcm_rb): ma_result; cdecl; external;
function  ma_pcm_rb_init(format: ma_format; channels: ma_uint32; bufferSizeInFrames: ma_uint32; pOptionalPreallocatedBuffer: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_pcm_rb): ma_result; cdecl; external;
procedure ma_pcm_rb_uninit(pRB: Pma_pcm_rb); cdecl; external;
procedure ma_pcm_rb_reset(pRB: Pma_pcm_rb); cdecl; external;
function  ma_pcm_rb_acquire_read(pRB: Pma_pcm_rb; pSizeInFrames: Pma_uint32; ppBufferOut: PPointer): ma_result; cdecl; external;
function  ma_pcm_rb_commit_read(pRB: Pma_pcm_rb; sizeInFrames: ma_uint32): ma_result; cdecl; external;
function  ma_pcm_rb_acquire_write(pRB: Pma_pcm_rb; pSizeInFrames: Pma_uint32; ppBufferOut: PPointer): ma_result; cdecl; external;
function  ma_pcm_rb_commit_write(pRB: Pma_pcm_rb; sizeInFrames: ma_uint32): ma_result; cdecl; external;
function  ma_pcm_rb_seek_read(pRB: Pma_pcm_rb; offsetInFrames: ma_uint32): ma_result; cdecl; external;
function  ma_pcm_rb_seek_write(pRB: Pma_pcm_rb; offsetInFrames: ma_uint32): ma_result; cdecl; external;
function  ma_pcm_rb_pointer_distance(pRB: Pma_pcm_rb): ma_int32; cdecl; external;
function  ma_pcm_rb_available_read(pRB: Pma_pcm_rb): ma_uint32; cdecl; external;
function  ma_pcm_rb_available_write(pRB: Pma_pcm_rb): ma_uint32; cdecl; external;
function  ma_pcm_rb_get_subbuffer_size(pRB: Pma_pcm_rb): ma_uint32; cdecl; external;
function  ma_pcm_rb_get_subbuffer_stride(pRB: Pma_pcm_rb): ma_uint32; cdecl; external;
function  ma_pcm_rb_get_subbuffer_offset(pRB: Pma_pcm_rb; subbufferIndex: ma_uint32): ma_uint32; cdecl; external;
function  ma_pcm_rb_get_subbuffer_ptr(pRB: Pma_pcm_rb; subbufferIndex: ma_uint32; pBuffer: Pointer): Pointer; cdecl; external;
function  ma_pcm_rb_get_format(const pRB: Pma_pcm_rb): ma_format; cdecl; external;
function  ma_pcm_rb_get_channels(const pRB: Pma_pcm_rb): ma_uint32; cdecl; external;
function  ma_pcm_rb_get_sample_rate(const pRB: Pma_pcm_rb): ma_uint32; cdecl; external;
procedure ma_pcm_rb_set_sample_rate(pRB: Pma_pcm_rb; sampleRate: ma_uint32); cdecl; external;
function  ma_duplex_rb_init(captureFormat: ma_format; captureChannels: ma_uint32; sampleRate: ma_uint32; captureInternalSampleRate: ma_uint32; captureInternalPeriodSizeInFrames: ma_uint32; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_duplex_rb): ma_result; cdecl; external;
function  ma_duplex_rb_uninit(pRB: Pma_duplex_rb): ma_result; cdecl; external;
function  ma_result_description(result: ma_result): PUTF8Char; cdecl; external;
function  ma_malloc(sz: NativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): Pointer; cdecl; external;
function  ma_calloc(sz: NativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): Pointer; cdecl; external;
function  ma_realloc(p: Pointer; sz: NativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): Pointer; cdecl; external;
procedure ma_free(p: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_aligned_malloc(sz: NativeUInt; alignment: NativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): Pointer; cdecl; external;
procedure ma_aligned_free(p: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_get_format_name(format: ma_format): PUTF8Char; cdecl; external;
procedure ma_blend_f32(pOut: PSingle; pInA: PSingle; pInB: PSingle; factor: Single; channels: ma_uint32); cdecl; external;
function  ma_get_bytes_per_sample(format: ma_format): ma_uint32; cdecl; external;
function  ma_log_level_to_string(logLevel: ma_uint32): PUTF8Char; cdecl; external;
function  ma_spinlock_lock(pSpinlock: Pma_spinlock): ma_result; cdecl; external;
function  ma_spinlock_lock_noyield(pSpinlock: Pma_spinlock): ma_result; cdecl; external;
function  ma_spinlock_unlock(pSpinlock: Pma_spinlock): ma_result; cdecl; external;
function  ma_mutex_init(pMutex: Pma_mutex): ma_result; cdecl; external;
procedure ma_mutex_uninit(pMutex: Pma_mutex); cdecl; external;
procedure ma_mutex_lock(pMutex: Pma_mutex); cdecl; external;
procedure ma_mutex_unlock(pMutex: Pma_mutex); cdecl; external;
function  ma_event_init(pEvent: Pma_event): ma_result; cdecl; external;
procedure ma_event_uninit(pEvent: Pma_event); cdecl; external;
function  ma_event_wait(pEvent: Pma_event): ma_result; cdecl; external;
function  ma_event_signal(pEvent: Pma_event): ma_result; cdecl; external;
function  ma_fence_init(pFence: Pma_fence): ma_result; cdecl; external;
procedure ma_fence_uninit(pFence: Pma_fence); cdecl; external;
function  ma_fence_acquire(pFence: Pma_fence): ma_result; cdecl; external;
function  ma_fence_release(pFence: Pma_fence): ma_result; cdecl; external;
function  ma_fence_wait(pFence: Pma_fence): ma_result; cdecl; external;
function  ma_async_notification_signal(pNotification: Pma_async_notification): ma_result; cdecl; external;
function  ma_async_notification_poll_init(pNotificationPoll: Pma_async_notification_poll): ma_result; cdecl; external;
function  ma_async_notification_poll_is_signalled(const pNotificationPoll: Pma_async_notification_poll): ma_bool32; cdecl; external;
function  ma_async_notification_event_init(pNotificationEvent: Pma_async_notification_event): ma_result; cdecl; external;
function  ma_async_notification_event_uninit(pNotificationEvent: Pma_async_notification_event): ma_result; cdecl; external;
function  ma_async_notification_event_wait(pNotificationEvent: Pma_async_notification_event): ma_result; cdecl; external;
function  ma_async_notification_event_signal(pNotificationEvent: Pma_async_notification_event): ma_result; cdecl; external;
function  ma_slot_allocator_config_init(capacity: ma_uint32): ma_slot_allocator_config; cdecl; external;
function  ma_slot_allocator_get_heap_size(const pConfig: Pma_slot_allocator_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_slot_allocator_init_preallocated(const pConfig: Pma_slot_allocator_config; pHeap: Pointer; pAllocator: Pma_slot_allocator): ma_result; cdecl; external;
function  ma_slot_allocator_init(const pConfig: Pma_slot_allocator_config; const pAllocationCallbacks: Pma_allocation_callbacks; pAllocator: Pma_slot_allocator): ma_result; cdecl; external;
procedure ma_slot_allocator_uninit(pAllocator: Pma_slot_allocator; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_slot_allocator_alloc(pAllocator: Pma_slot_allocator; pSlot: Pma_uint64): ma_result; cdecl; external;
function  ma_slot_allocator_free(pAllocator: Pma_slot_allocator; slot: ma_uint64): ma_result; cdecl; external;
function  ma_job_init(code: ma_uint16): ma_job; cdecl; external;
function  ma_job_process(pJob: Pma_job): ma_result; cdecl; external;
function  ma_job_queue_config_init(flags: ma_uint32; capacity: ma_uint32): ma_job_queue_config; cdecl; external;
function  ma_job_queue_get_heap_size(const pConfig: Pma_job_queue_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_job_queue_init_preallocated(const pConfig: Pma_job_queue_config; pHeap: Pointer; pQueue: Pma_job_queue): ma_result; cdecl; external;
function  ma_job_queue_init(const pConfig: Pma_job_queue_config; const pAllocationCallbacks: Pma_allocation_callbacks; pQueue: Pma_job_queue): ma_result; cdecl; external;
procedure ma_job_queue_uninit(pQueue: Pma_job_queue; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_job_queue_post(pQueue: Pma_job_queue; const pJob: Pma_job): ma_result; cdecl; external;
function  ma_job_queue_next(pQueue: Pma_job_queue; pJob: Pma_job): ma_result; cdecl; external;
function  ma_device_job_thread_config_init(): ma_device_job_thread_config; cdecl; external;
function  ma_device_job_thread_init(const pConfig: Pma_device_job_thread_config; const pAllocationCallbacks: Pma_allocation_callbacks; pJobThread: Pma_device_job_thread): ma_result; cdecl; external;
procedure ma_device_job_thread_uninit(pJobThread: Pma_device_job_thread; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_device_job_thread_post(pJobThread: Pma_device_job_thread; const pJob: Pma_job): ma_result; cdecl; external;
function  ma_device_job_thread_next(pJobThread: Pma_device_job_thread; pJob: Pma_job): ma_result; cdecl; external;
function  ma_context_config_init(): ma_context_config; cdecl; external;
function  ma_context_init(backends: Pma_backend; backendCount: ma_uint32; const pConfig: Pma_context_config; pContext: Pma_context): ma_result; cdecl; external;
function  ma_context_uninit(pContext: Pma_context): ma_result; cdecl; external;
function  ma_context_sizeof(): NativeUInt; cdecl; external;
function  ma_context_get_log(pContext: Pma_context): Pma_log; cdecl; external;
function  ma_context_enumerate_devices(pContext: Pma_context; callback: ma_enum_devices_callback_proc; pUserData: Pointer): ma_result; cdecl; external;
function  ma_context_get_devices(pContext: Pma_context; ppPlaybackDeviceInfos: PPma_device_info; pPlaybackDeviceCount: Pma_uint32; ppCaptureDeviceInfos: PPma_device_info; pCaptureDeviceCount: Pma_uint32): ma_result; cdecl; external;
function  ma_context_get_device_info(pContext: Pma_context; deviceType: ma_device_type; const pDeviceID: Pma_device_id; pDeviceInfo: Pma_device_info): ma_result; cdecl; external;
function  ma_context_is_loopback_supported(pContext: Pma_context): ma_bool32; cdecl; external;
function  ma_device_config_init(deviceType: ma_device_type): ma_device_config; cdecl; external;
function  ma_device_init(pContext: Pma_context; const pConfig: Pma_device_config; pDevice: Pma_device): ma_result; cdecl; external;
function  ma_device_init_ex(backends: Pma_backend; backendCount: ma_uint32; const pContextConfig: Pma_context_config; const pConfig: Pma_device_config; pDevice: Pma_device): ma_result; cdecl; external;
procedure ma_device_uninit(pDevice: Pma_device); cdecl; external;
function  ma_device_get_context(pDevice: Pma_device): Pma_context; cdecl; external;
function  ma_device_get_log(pDevice: Pma_device): Pma_log; cdecl; external;
function  ma_device_get_info(pDevice: Pma_device; &type: ma_device_type; pDeviceInfo: Pma_device_info): ma_result; cdecl; external;
function  ma_device_get_name(pDevice: Pma_device; &type: ma_device_type; pName: PUTF8Char; nameCap: NativeUInt; pLengthNotIncludingNullTerminator: PNativeUInt): ma_result; cdecl; external;
function  ma_device_start(pDevice: Pma_device): ma_result; cdecl; external;
function  ma_device_stop(pDevice: Pma_device): ma_result; cdecl; external;
function  ma_device_is_started(const pDevice: Pma_device): ma_bool32; cdecl; external;
function  ma_device_get_state(const pDevice: Pma_device): ma_device_state; cdecl; external;
function  ma_device_post_init(pDevice: Pma_device; deviceType: ma_device_type; const pPlaybackDescriptor: Pma_device_descriptor; const pCaptureDescriptor: Pma_device_descriptor): ma_result; cdecl; external;
function  ma_device_set_master_volume(pDevice: Pma_device; volume: Single): ma_result; cdecl; external;
function  ma_device_get_master_volume(pDevice: Pma_device; pVolume: PSingle): ma_result; cdecl; external;
function  ma_device_set_master_volume_db(pDevice: Pma_device; gainDB: Single): ma_result; cdecl; external;
function  ma_device_get_master_volume_db(pDevice: Pma_device; pGainDB: PSingle): ma_result; cdecl; external;
function  ma_device_handle_backend_data_callback(pDevice: Pma_device; pOutput: Pointer; const pInput: Pointer; frameCount: ma_uint32): ma_result; cdecl; external;
function  ma_calculate_buffer_size_in_frames_from_descriptor(const pDescriptor: Pma_device_descriptor; nativeSampleRate: ma_uint32; performanceProfile: ma_performance_profile): ma_uint32; cdecl; external;
function  ma_get_backend_name(backend: ma_backend): PUTF8Char; cdecl; external;
function  ma_get_backend_from_name(const pBackendName: PUTF8Char; pBackend: Pma_backend): ma_result; cdecl; external;
function  ma_is_backend_enabled(backend: ma_backend): ma_bool32; cdecl; external;
function  ma_get_enabled_backends(pBackends: Pma_backend; backendCap: NativeUInt; pBackendCount: PNativeUInt): ma_result; cdecl; external;
function  ma_is_loopback_supported(backend: ma_backend): ma_bool32; cdecl; external;
function  ma_calculate_buffer_size_in_milliseconds_from_frames(bufferSizeInFrames: ma_uint32; sampleRate: ma_uint32): ma_uint32; cdecl; external;
function  ma_calculate_buffer_size_in_frames_from_milliseconds(bufferSizeInMilliseconds: ma_uint32; sampleRate: ma_uint32): ma_uint32; cdecl; external;
procedure ma_copy_pcm_frames(dst: Pointer; const src: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32); cdecl; external;
procedure ma_silence_pcm_frames(p: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32); cdecl; external;
function  ma_offset_pcm_frames_ptr(p: Pointer; offsetInFrames: ma_uint64; format: ma_format; channels: ma_uint32): Pointer; cdecl; external;
function  ma_offset_pcm_frames_const_ptr(const p: Pointer; offsetInFrames: ma_uint64; format: ma_format; channels: ma_uint32): Pointer; cdecl; external;
procedure ma_clip_samples_u8(pDst: Pma_uint8; const pSrc: Pma_int16; count: ma_uint64); cdecl; external;
procedure ma_clip_samples_s16(pDst: Pma_int16; const pSrc: Pma_int32; count: ma_uint64); cdecl; external;
procedure ma_clip_samples_s24(pDst: Pma_uint8; const pSrc: Pma_int64; count: ma_uint64); cdecl; external;
procedure ma_clip_samples_s32(pDst: Pma_int32; const pSrc: Pma_int64; count: ma_uint64); cdecl; external;
procedure ma_clip_samples_f32(pDst: PSingle; const pSrc: PSingle; count: ma_uint64); cdecl; external;
procedure ma_clip_pcm_frames(pDst: Pointer; const pSrc: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32); cdecl; external;
procedure ma_copy_and_apply_volume_factor_u8(pSamplesOut: Pma_uint8; const pSamplesIn: Pma_uint8; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_s16(pSamplesOut: Pma_int16; const pSamplesIn: Pma_int16; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_s24(pSamplesOut: Pointer; const pSamplesIn: Pointer; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_s32(pSamplesOut: Pma_int32; const pSamplesIn: Pma_int32; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_f32(pSamplesOut: PSingle; const pSamplesIn: PSingle; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_u8(pSamples: Pma_uint8; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_s16(pSamples: Pma_int16; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_s24(pSamples: Pointer; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_s32(pSamples: Pma_int32; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_f32(pSamples: PSingle; sampleCount: ma_uint64; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_pcm_frames_u8(pFramesOut: Pma_uint8; const pFramesIn: Pma_uint8; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_pcm_frames_s16(pFramesOut: Pma_int16; const pFramesIn: Pma_int16; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_pcm_frames_s24(pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_pcm_frames_s32(pFramesOut: Pma_int32; const pFramesIn: Pma_int32; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_pcm_frames_f32(pFramesOut: PSingle; const pFramesIn: PSingle; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_pcm_frames(pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_pcm_frames_u8(pFrames: Pma_uint8; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_pcm_frames_s16(pFrames: Pma_int16; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_pcm_frames_s24(pFrames: Pointer; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_pcm_frames_s32(pFrames: Pma_int32; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_pcm_frames_f32(pFrames: PSingle; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_apply_volume_factor_pcm_frames(pFrames: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; factor: Single); cdecl; external;
procedure ma_copy_and_apply_volume_factor_per_channel_f32(pFramesOut: PSingle; const pFramesIn: PSingle; frameCount: ma_uint64; channels: ma_uint32; pChannelGains: PSingle); cdecl; external;
procedure ma_copy_and_apply_volume_and_clip_samples_u8(pDst: Pma_uint8; const pSrc: Pma_int16; count: ma_uint64; volume: Single); cdecl; external;
procedure ma_copy_and_apply_volume_and_clip_samples_s16(pDst: Pma_int16; const pSrc: Pma_int32; count: ma_uint64; volume: Single); cdecl; external;
procedure ma_copy_and_apply_volume_and_clip_samples_s24(pDst: Pma_uint8; const pSrc: Pma_int64; count: ma_uint64; volume: Single); cdecl; external;
procedure ma_copy_and_apply_volume_and_clip_samples_s32(pDst: Pma_int32; const pSrc: Pma_int64; count: ma_uint64; volume: Single); cdecl; external;
procedure ma_copy_and_apply_volume_and_clip_samples_f32(pDst: PSingle; const pSrc: PSingle; count: ma_uint64; volume: Single); cdecl; external;
procedure ma_copy_and_apply_volume_and_clip_pcm_frames(pDst: Pointer; const pSrc: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; volume: Single); cdecl; external;
function  ma_volume_linear_to_db(factor: Single): Single; cdecl; external;
function  ma_volume_db_to_linear(gain: Single): Single; cdecl; external;
function  ma_mix_pcm_frames_f32(pDst: PSingle; const pSrc: PSingle; frameCount: ma_uint64; channels: ma_uint32; volume: Single): ma_result; cdecl; external;
function  ma_vfs_open(pVFS: Pma_vfs; const pFilePath: PUTF8Char; openMode: ma_uint32; pFile: Pma_vfs_file): ma_result; cdecl; external;
function  ma_vfs_open_w(pVFS: Pma_vfs; const pFilePath: PWideChar; openMode: ma_uint32; pFile: Pma_vfs_file): ma_result; cdecl; external;
function  ma_vfs_close(pVFS: Pma_vfs; &file: ma_vfs_file): ma_result; cdecl; external;
function  ma_vfs_read(pVFS: Pma_vfs; &file: ma_vfs_file; pDst: Pointer; sizeInBytes: NativeUInt; pBytesRead: PNativeUInt): ma_result; cdecl; external;
function  ma_vfs_write(pVFS: Pma_vfs; &file: ma_vfs_file; const pSrc: Pointer; sizeInBytes: NativeUInt; pBytesWritten: PNativeUInt): ma_result; cdecl; external;
function  ma_vfs_seek(pVFS: Pma_vfs; &file: ma_vfs_file; offset: ma_int64; origin: ma_seek_origin): ma_result; cdecl; external;
function  ma_vfs_tell(pVFS: Pma_vfs; &file: ma_vfs_file; pCursor: Pma_int64): ma_result; cdecl; external;
function  ma_vfs_info(pVFS: Pma_vfs; &file: ma_vfs_file; pInfo: Pma_file_info): ma_result; cdecl; external;
function  ma_vfs_open_and_read_file(pVFS: Pma_vfs; const pFilePath: PUTF8Char; ppData: PPointer; pSize: PNativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): ma_result; cdecl; external;
function  ma_default_vfs_init(pVFS: Pma_default_vfs; const pAllocationCallbacks: Pma_allocation_callbacks): ma_result; cdecl; external;
function  ma_decoding_backend_config_init(preferredFormat: ma_format; seekPointCount: ma_uint32): ma_decoding_backend_config; cdecl; external;
function  ma_decoder_config_init(outputFormat: ma_format; outputChannels: ma_uint32; outputSampleRate: ma_uint32): ma_decoder_config; cdecl; external;
function  ma_decoder_config_init_default(): ma_decoder_config; cdecl; external;
function  ma_decoder_init(onRead: ma_decoder_read_proc; onSeek: ma_decoder_seek_proc; pUserData: Pointer; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl; external;
function  ma_decoder_init_memory(const pData: Pointer; dataSize: NativeUInt; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl; external;
function  ma_decoder_init_vfs(pVFS: Pma_vfs; const pFilePath: PUTF8Char; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl; external;
function  ma_decoder_init_vfs_w(pVFS: Pma_vfs; const pFilePath: PWideChar; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl; external;
function  ma_decoder_init_file(const pFilePath: PUTF8Char; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl; external;
function  ma_decoder_init_file_w(const pFilePath: PWideChar; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl; external;
function  ma_decoder_uninit(pDecoder: Pma_decoder): ma_result; cdecl; external;
function  ma_decoder_read_pcm_frames(pDecoder: Pma_decoder; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_decoder_seek_to_pcm_frame(pDecoder: Pma_decoder; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_decoder_get_data_format(pDecoder: Pma_decoder; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_decoder_get_cursor_in_pcm_frames(pDecoder: Pma_decoder; pCursor: Pma_uint64): ma_result; cdecl; external;
function  ma_decoder_get_length_in_pcm_frames(pDecoder: Pma_decoder; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_decoder_get_available_frames(pDecoder: Pma_decoder; pAvailableFrames: Pma_uint64): ma_result; cdecl; external;
function  ma_decode_from_vfs(pVFS: Pma_vfs; const pFilePath: PUTF8Char; pConfig: Pma_decoder_config; pFrameCountOut: Pma_uint64; ppPCMFramesOut: PPointer): ma_result; cdecl; external;
function  ma_decode_file(const pFilePath: PUTF8Char; pConfig: Pma_decoder_config; pFrameCountOut: Pma_uint64; ppPCMFramesOut: PPointer): ma_result; cdecl; external;
function  ma_decode_memory(const pData: Pointer; dataSize: NativeUInt; pConfig: Pma_decoder_config; pFrameCountOut: Pma_uint64; ppPCMFramesOut: PPointer): ma_result; cdecl; external;
function  ma_encoder_config_init(encodingFormat: ma_encoding_format; format: ma_format; channels: ma_uint32; sampleRate: ma_uint32): ma_encoder_config; cdecl; external;
function  ma_encoder_init(onWrite: ma_encoder_write_proc; onSeek: ma_encoder_seek_proc; pUserData: Pointer; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl; external;
function  ma_encoder_init_vfs(pVFS: Pma_vfs; const pFilePath: PUTF8Char; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl; external;
function  ma_encoder_init_vfs_w(pVFS: Pma_vfs; const pFilePath: PWideChar; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl; external;
function  ma_encoder_init_file(const pFilePath: PUTF8Char; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl; external;
function  ma_encoder_init_file_w(const pFilePath: PWideChar; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl; external;
procedure ma_encoder_uninit(pEncoder: Pma_encoder); cdecl; external;
function  ma_encoder_write_pcm_frames(pEncoder: Pma_encoder; const pFramesIn: Pointer; frameCount: ma_uint64; pFramesWritten: Pma_uint64): ma_result; cdecl; external;
function  ma_waveform_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; &type: ma_waveform_type; amplitude: Double; frequency: Double): ma_waveform_config; cdecl; external;
function  ma_waveform_init(const pConfig: Pma_waveform_config; pWaveform: Pma_waveform): ma_result; cdecl; external;
procedure ma_waveform_uninit(pWaveform: Pma_waveform); cdecl; external;
function  ma_waveform_read_pcm_frames(pWaveform: Pma_waveform; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_waveform_seek_to_pcm_frame(pWaveform: Pma_waveform; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_waveform_set_amplitude(pWaveform: Pma_waveform; amplitude: Double): ma_result; cdecl; external;
function  ma_waveform_set_frequency(pWaveform: Pma_waveform; frequency: Double): ma_result; cdecl; external;
function  ma_waveform_set_type(pWaveform: Pma_waveform; &type: ma_waveform_type): ma_result; cdecl; external;
function  ma_waveform_set_sample_rate(pWaveform: Pma_waveform; sampleRate: ma_uint32): ma_result; cdecl; external;
function  ma_pulsewave_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; dutyCycle: Double; amplitude: Double; frequency: Double): ma_pulsewave_config; cdecl; external;
function  ma_pulsewave_init(const pConfig: Pma_pulsewave_config; pWaveform: Pma_pulsewave): ma_result; cdecl; external;
procedure ma_pulsewave_uninit(pWaveform: Pma_pulsewave); cdecl; external;
function  ma_pulsewave_read_pcm_frames(pWaveform: Pma_pulsewave; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_pulsewave_seek_to_pcm_frame(pWaveform: Pma_pulsewave; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_pulsewave_set_amplitude(pWaveform: Pma_pulsewave; amplitude: Double): ma_result; cdecl; external;
function  ma_pulsewave_set_frequency(pWaveform: Pma_pulsewave; frequency: Double): ma_result; cdecl; external;
function  ma_pulsewave_set_sample_rate(pWaveform: Pma_pulsewave; sampleRate: ma_uint32): ma_result; cdecl; external;
function  ma_pulsewave_set_duty_cycle(pWaveform: Pma_pulsewave; dutyCycle: Double): ma_result; cdecl; external;
function  ma_noise_config_init(format: ma_format; channels: ma_uint32; &type: ma_noise_type; seed: ma_int32; amplitude: Double): ma_noise_config; cdecl; external;
function  ma_noise_get_heap_size(const pConfig: Pma_noise_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_noise_init_preallocated(const pConfig: Pma_noise_config; pHeap: Pointer; pNoise: Pma_noise): ma_result; cdecl; external;
function  ma_noise_init(const pConfig: Pma_noise_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNoise: Pma_noise): ma_result; cdecl; external;
procedure ma_noise_uninit(pNoise: Pma_noise; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_noise_read_pcm_frames(pNoise: Pma_noise; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_noise_set_amplitude(pNoise: Pma_noise; amplitude: Double): ma_result; cdecl; external;
function  ma_noise_set_seed(pNoise: Pma_noise; seed: ma_int32): ma_result; cdecl; external;
function  ma_noise_set_type(pNoise: Pma_noise; &type: ma_noise_type): ma_result; cdecl; external;
function  ma_resource_manager_pipeline_notifications_init(): ma_resource_manager_pipeline_notifications; cdecl; external;
function  ma_resource_manager_data_source_config_init(): ma_resource_manager_data_source_config; cdecl; external;
function  ma_resource_manager_config_init(): ma_resource_manager_config; cdecl; external;
function  ma_resource_manager_init(const pConfig: Pma_resource_manager_config; pResourceManager: Pma_resource_manager): ma_result; cdecl; external;
procedure ma_resource_manager_uninit(pResourceManager: Pma_resource_manager); cdecl; external;
function  ma_resource_manager_get_log(pResourceManager: Pma_resource_manager): Pma_log; cdecl; external;
function  ma_resource_manager_register_file(pResourceManager: Pma_resource_manager; const pFilePath: PUTF8Char; flags: ma_uint32): ma_result; cdecl; external;
function  ma_resource_manager_register_file_w(pResourceManager: Pma_resource_manager; const pFilePath: PWideChar; flags: ma_uint32): ma_result; cdecl; external;
function  ma_resource_manager_register_decoded_data(pResourceManager: Pma_resource_manager; const pName: PUTF8Char; const pData: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; sampleRate: ma_uint32): ma_result; cdecl; external;
function  ma_resource_manager_register_decoded_data_w(pResourceManager: Pma_resource_manager; const pName: PWideChar; const pData: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; sampleRate: ma_uint32): ma_result; cdecl; external;
function  ma_resource_manager_register_encoded_data(pResourceManager: Pma_resource_manager; const pName: PUTF8Char; const pData: Pointer; sizeInBytes: NativeUInt): ma_result; cdecl; external;
function  ma_resource_manager_register_encoded_data_w(pResourceManager: Pma_resource_manager; const pName: PWideChar; const pData: Pointer; sizeInBytes: NativeUInt): ma_result; cdecl; external;
function  ma_resource_manager_unregister_file(pResourceManager: Pma_resource_manager; const pFilePath: PUTF8Char): ma_result; cdecl; external;
function  ma_resource_manager_unregister_file_w(pResourceManager: Pma_resource_manager; const pFilePath: PWideChar): ma_result; cdecl; external;
function  ma_resource_manager_unregister_data(pResourceManager: Pma_resource_manager; const pName: PUTF8Char): ma_result; cdecl; external;
function  ma_resource_manager_unregister_data_w(pResourceManager: Pma_resource_manager; const pName: PWideChar): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_init_ex(pResourceManager: Pma_resource_manager; const pConfig: Pma_resource_manager_data_source_config; pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_init(pResourceManager: Pma_resource_manager; const pFilePath: PUTF8Char; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_init_w(pResourceManager: Pma_resource_manager; const pFilePath: PWideChar; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_init_copy(pResourceManager: Pma_resource_manager; const pExistingDataBuffer: Pma_resource_manager_data_buffer; pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_uninit(pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_read_pcm_frames(pDataBuffer: Pma_resource_manager_data_buffer; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_seek_to_pcm_frame(pDataBuffer: Pma_resource_manager_data_buffer; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_get_data_format(pDataBuffer: Pma_resource_manager_data_buffer; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_get_cursor_in_pcm_frames(pDataBuffer: Pma_resource_manager_data_buffer; pCursor: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_get_length_in_pcm_frames(pDataBuffer: Pma_resource_manager_data_buffer; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_result(const pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_set_looping(pDataBuffer: Pma_resource_manager_data_buffer; isLooping: ma_bool32): ma_result; cdecl; external;
function  ma_resource_manager_data_buffer_is_looping(const pDataBuffer: Pma_resource_manager_data_buffer): ma_bool32; cdecl; external;
function  ma_resource_manager_data_buffer_get_available_frames(pDataBuffer: Pma_resource_manager_data_buffer; pAvailableFrames: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_init_ex(pResourceManager: Pma_resource_manager; const pConfig: Pma_resource_manager_data_source_config; pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_init(pResourceManager: Pma_resource_manager; const pFilePath: PUTF8Char; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_init_w(pResourceManager: Pma_resource_manager; const pFilePath: PWideChar; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_uninit(pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_read_pcm_frames(pDataStream: Pma_resource_manager_data_stream; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_seek_to_pcm_frame(pDataStream: Pma_resource_manager_data_stream; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_get_data_format(pDataStream: Pma_resource_manager_data_stream; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_get_cursor_in_pcm_frames(pDataStream: Pma_resource_manager_data_stream; pCursor: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_get_length_in_pcm_frames(pDataStream: Pma_resource_manager_data_stream; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_result(const pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_set_looping(pDataStream: Pma_resource_manager_data_stream; isLooping: ma_bool32): ma_result; cdecl; external;
function  ma_resource_manager_data_stream_is_looping(const pDataStream: Pma_resource_manager_data_stream): ma_bool32; cdecl; external;
function  ma_resource_manager_data_stream_get_available_frames(pDataStream: Pma_resource_manager_data_stream; pAvailableFrames: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_source_init_ex(pResourceManager: Pma_resource_manager; const pConfig: Pma_resource_manager_data_source_config; pDataSource: Pma_resource_manager_data_source): ma_result; cdecl; external;
function  ma_resource_manager_data_source_init(pResourceManager: Pma_resource_manager; const pName: PUTF8Char; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataSource: Pma_resource_manager_data_source): ma_result; cdecl; external;
function  ma_resource_manager_data_source_init_w(pResourceManager: Pma_resource_manager; const pName: PWideChar; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataSource: Pma_resource_manager_data_source): ma_result; cdecl; external;
function  ma_resource_manager_data_source_init_copy(pResourceManager: Pma_resource_manager; const pExistingDataSource: Pma_resource_manager_data_source; pDataSource: Pma_resource_manager_data_source): ma_result; cdecl; external;
function  ma_resource_manager_data_source_uninit(pDataSource: Pma_resource_manager_data_source): ma_result; cdecl; external;
function  ma_resource_manager_data_source_read_pcm_frames(pDataSource: Pma_resource_manager_data_source; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_source_seek_to_pcm_frame(pDataSource: Pma_resource_manager_data_source; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_source_get_data_format(pDataSource: Pma_resource_manager_data_source; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_resource_manager_data_source_get_cursor_in_pcm_frames(pDataSource: Pma_resource_manager_data_source; pCursor: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_source_get_length_in_pcm_frames(pDataSource: Pma_resource_manager_data_source; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_data_source_result(const pDataSource: Pma_resource_manager_data_source): ma_result; cdecl; external;
function  ma_resource_manager_data_source_set_looping(pDataSource: Pma_resource_manager_data_source; isLooping: ma_bool32): ma_result; cdecl; external;
function  ma_resource_manager_data_source_is_looping(const pDataSource: Pma_resource_manager_data_source): ma_bool32; cdecl; external;
function  ma_resource_manager_data_source_get_available_frames(pDataSource: Pma_resource_manager_data_source; pAvailableFrames: Pma_uint64): ma_result; cdecl; external;
function  ma_resource_manager_post_job(pResourceManager: Pma_resource_manager; const pJob: Pma_job): ma_result; cdecl; external;
function  ma_resource_manager_post_job_quit(pResourceManager: Pma_resource_manager): ma_result; cdecl; external;
function  ma_resource_manager_next_job(pResourceManager: Pma_resource_manager; pJob: Pma_job): ma_result; cdecl; external;
function  ma_resource_manager_process_job(pResourceManager: Pma_resource_manager; pJob: Pma_job): ma_result; cdecl; external;
function  ma_resource_manager_process_next_job(pResourceManager: Pma_resource_manager): ma_result; cdecl; external;
function  ma_node_config_init(): ma_node_config; cdecl; external;
function  ma_node_get_heap_size(pNodeGraph: Pma_node_graph; const pConfig: Pma_node_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_node_init_preallocated(pNodeGraph: Pma_node_graph; const pConfig: Pma_node_config; pHeap: Pointer; pNode: Pma_node): ma_result; cdecl; external;
function  ma_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_node): ma_result; cdecl; external;
procedure ma_node_uninit(pNode: Pma_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_node_get_node_graph(const pNode: Pma_node): Pma_node_graph; cdecl; external;
function  ma_node_get_input_bus_count(const pNode: Pma_node): ma_uint32; cdecl; external;
function  ma_node_get_output_bus_count(const pNode: Pma_node): ma_uint32; cdecl; external;
function  ma_node_get_input_channels(const pNode: Pma_node; inputBusIndex: ma_uint32): ma_uint32; cdecl; external;
function  ma_node_get_output_channels(const pNode: Pma_node; outputBusIndex: ma_uint32): ma_uint32; cdecl; external;
function  ma_node_attach_output_bus(pNode: Pma_node; outputBusIndex: ma_uint32; pOtherNode: Pma_node; otherNodeInputBusIndex: ma_uint32): ma_result; cdecl; external;
function  ma_node_detach_output_bus(pNode: Pma_node; outputBusIndex: ma_uint32): ma_result; cdecl; external;
function  ma_node_detach_all_output_buses(pNode: Pma_node): ma_result; cdecl; external;
function  ma_node_set_output_bus_volume(pNode: Pma_node; outputBusIndex: ma_uint32; volume: Single): ma_result; cdecl; external;
function  ma_node_get_output_bus_volume(const pNode: Pma_node; outputBusIndex: ma_uint32): Single; cdecl; external;
function  ma_node_set_state(pNode: Pma_node; state: ma_node_state): ma_result; cdecl; external;
function  ma_node_get_state(const pNode: Pma_node): ma_node_state; cdecl; external;
function  ma_node_set_state_time(pNode: Pma_node; state: ma_node_state; globalTime: ma_uint64): ma_result; cdecl; external;
function  ma_node_get_state_time(const pNode: Pma_node; state: ma_node_state): ma_uint64; cdecl; external;
function  ma_node_get_state_by_time(const pNode: Pma_node; globalTime: ma_uint64): ma_node_state; cdecl; external;
function  ma_node_get_state_by_time_range(const pNode: Pma_node; globalTimeBeg: ma_uint64; globalTimeEnd: ma_uint64): ma_node_state; cdecl; external;
function  ma_node_get_time(const pNode: Pma_node): ma_uint64; cdecl; external;
function  ma_node_set_time(pNode: Pma_node; localTime: ma_uint64): ma_result; cdecl; external;
function  ma_node_graph_config_init(channels: ma_uint32): ma_node_graph_config; cdecl; external;
function  ma_node_graph_init(const pConfig: Pma_node_graph_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNodeGraph: Pma_node_graph): ma_result; cdecl; external;
procedure ma_node_graph_uninit(pNodeGraph: Pma_node_graph; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_node_graph_get_endpoint(pNodeGraph: Pma_node_graph): Pma_node; cdecl; external;
function  ma_node_graph_read_pcm_frames(pNodeGraph: Pma_node_graph; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_node_graph_get_channels(const pNodeGraph: Pma_node_graph): ma_uint32; cdecl; external;
function  ma_node_graph_get_time(const pNodeGraph: Pma_node_graph): ma_uint64; cdecl; external;
function  ma_node_graph_set_time(pNodeGraph: Pma_node_graph; globalTime: ma_uint64): ma_result; cdecl; external;
function  ma_data_source_node_config_init(pDataSource: Pma_data_source): ma_data_source_node_config; cdecl; external;
function  ma_data_source_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_data_source_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pDataSourceNode: Pma_data_source_node): ma_result; cdecl; external;
procedure ma_data_source_node_uninit(pDataSourceNode: Pma_data_source_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_data_source_node_set_looping(pDataSourceNode: Pma_data_source_node; isLooping: ma_bool32): ma_result; cdecl; external;
function  ma_data_source_node_is_looping(pDataSourceNode: Pma_data_source_node): ma_bool32; cdecl; external;
function  ma_splitter_node_config_init(channels: ma_uint32): ma_splitter_node_config; cdecl; external;
function  ma_splitter_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_splitter_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pSplitterNode: Pma_splitter_node): ma_result; cdecl; external;
procedure ma_splitter_node_uninit(pSplitterNode: Pma_splitter_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_biquad_node_config_init(channels: ma_uint32; b0: Single; b1: Single; b2: Single; a0: Single; a1: Single; a2: Single): ma_biquad_node_config; cdecl; external;
function  ma_biquad_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_biquad_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_biquad_node): ma_result; cdecl; external;
function  ma_biquad_node_reinit(const pConfig: Pma_biquad_config; pNode: Pma_biquad_node): ma_result; cdecl; external;
procedure ma_biquad_node_uninit(pNode: Pma_biquad_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_lpf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_lpf_node_config; cdecl; external;
function  ma_lpf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_lpf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_lpf_node): ma_result; cdecl; external;
function  ma_lpf_node_reinit(const pConfig: Pma_lpf_config; pNode: Pma_lpf_node): ma_result; cdecl; external;
procedure ma_lpf_node_uninit(pNode: Pma_lpf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_hpf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_hpf_node_config; cdecl; external;
function  ma_hpf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_hpf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_hpf_node): ma_result; cdecl; external;
function  ma_hpf_node_reinit(const pConfig: Pma_hpf_config; pNode: Pma_hpf_node): ma_result; cdecl; external;
procedure ma_hpf_node_uninit(pNode: Pma_hpf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_bpf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_bpf_node_config; cdecl; external;
function  ma_bpf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_bpf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_bpf_node): ma_result; cdecl; external;
function  ma_bpf_node_reinit(const pConfig: Pma_bpf_config; pNode: Pma_bpf_node): ma_result; cdecl; external;
procedure ma_bpf_node_uninit(pNode: Pma_bpf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_notch_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; q: Double; frequency: Double): ma_notch_node_config; cdecl; external;
function  ma_notch_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_notch_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_notch_node): ma_result; cdecl; external;
function  ma_notch_node_reinit(const pConfig: Pma_notch_config; pNode: Pma_notch_node): ma_result; cdecl; external;
procedure ma_notch_node_uninit(pNode: Pma_notch_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_peak_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; q: Double; frequency: Double): ma_peak_node_config; cdecl; external;
function  ma_peak_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_peak_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_peak_node): ma_result; cdecl; external;
function  ma_peak_node_reinit(const pConfig: Pma_peak_config; pNode: Pma_peak_node): ma_result; cdecl; external;
procedure ma_peak_node_uninit(pNode: Pma_peak_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_loshelf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; q: Double; frequency: Double): ma_loshelf_node_config; cdecl; external;
function  ma_loshelf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_loshelf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_loshelf_node): ma_result; cdecl; external;
function  ma_loshelf_node_reinit(const pConfig: Pma_loshelf_config; pNode: Pma_loshelf_node): ma_result; cdecl; external;
procedure ma_loshelf_node_uninit(pNode: Pma_loshelf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_hishelf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; q: Double; frequency: Double): ma_hishelf_node_config; cdecl; external;
function  ma_hishelf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_hishelf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_hishelf_node): ma_result; cdecl; external;
function  ma_hishelf_node_reinit(const pConfig: Pma_hishelf_config; pNode: Pma_hishelf_node): ma_result; cdecl; external;
procedure ma_hishelf_node_uninit(pNode: Pma_hishelf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_delay_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; delayInFrames: ma_uint32; decay: Single): ma_delay_node_config; cdecl; external;
function  ma_delay_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_delay_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pDelayNode: Pma_delay_node): ma_result; cdecl; external;
procedure ma_delay_node_uninit(pDelayNode: Pma_delay_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
procedure ma_delay_node_set_wet(pDelayNode: Pma_delay_node; value: Single); cdecl; external;
function  ma_delay_node_get_wet(const pDelayNode: Pma_delay_node): Single; cdecl; external;
procedure ma_delay_node_set_dry(pDelayNode: Pma_delay_node; value: Single); cdecl; external;
function  ma_delay_node_get_dry(const pDelayNode: Pma_delay_node): Single; cdecl; external;
procedure ma_delay_node_set_decay(pDelayNode: Pma_delay_node; value: Single); cdecl; external;
function  ma_delay_node_get_decay(const pDelayNode: Pma_delay_node): Single; cdecl; external;
function  ma_engine_node_config_init(pEngine: Pma_engine; &type: ma_engine_node_type; flags: ma_uint32): ma_engine_node_config; cdecl; external;
function  ma_engine_node_get_heap_size(const pConfig: Pma_engine_node_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl; external;
function  ma_engine_node_init_preallocated(const pConfig: Pma_engine_node_config; pHeap: Pointer; pEngineNode: Pma_engine_node): ma_result; cdecl; external;
function  ma_engine_node_init(const pConfig: Pma_engine_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pEngineNode: Pma_engine_node): ma_result; cdecl; external;
procedure ma_engine_node_uninit(pEngineNode: Pma_engine_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl; external;
function  ma_sound_config_init(): ma_sound_config; cdecl; external;
function  ma_sound_config_init_2(pEngine: Pma_engine): ma_sound_config; cdecl; external;
function  ma_sound_group_config_init(): ma_sound_group_config; cdecl; external;
function  ma_sound_group_config_init_2(pEngine: Pma_engine): ma_sound_group_config; cdecl; external;
function  ma_engine_config_init(): ma_engine_config; cdecl; external;
function  ma_engine_init(const pConfig: Pma_engine_config; pEngine: Pma_engine): ma_result; cdecl; external;
procedure ma_engine_uninit(pEngine: Pma_engine); cdecl; external;
function  ma_engine_read_pcm_frames(pEngine: Pma_engine; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl; external;
function  ma_engine_get_node_graph(pEngine: Pma_engine): Pma_node_graph; cdecl; external;
function  ma_engine_get_resource_manager(pEngine: Pma_engine): Pma_resource_manager; cdecl; external;
function  ma_engine_get_device(pEngine: Pma_engine): Pma_device; cdecl; external;
function  ma_engine_get_log(pEngine: Pma_engine): Pma_log; cdecl; external;
function  ma_engine_get_endpoint(pEngine: Pma_engine): Pma_node; cdecl; external;
function  ma_engine_get_time_in_pcm_frames(const pEngine: Pma_engine): ma_uint64; cdecl; external;
function  ma_engine_get_time_in_milliseconds(const pEngine: Pma_engine): ma_uint64; cdecl; external;
function  ma_engine_set_time_in_pcm_frames(pEngine: Pma_engine; globalTime: ma_uint64): ma_result; cdecl; external;
function  ma_engine_set_time_in_milliseconds(pEngine: Pma_engine; globalTime: ma_uint64): ma_result; cdecl; external;
function  ma_engine_get_time(const pEngine: Pma_engine): ma_uint64; cdecl; external;
function  ma_engine_set_time(pEngine: Pma_engine; globalTime: ma_uint64): ma_result; cdecl; external;
function  ma_engine_get_channels(const pEngine: Pma_engine): ma_uint32; cdecl; external;
function  ma_engine_get_sample_rate(const pEngine: Pma_engine): ma_uint32; cdecl; external;
function  ma_engine_start(pEngine: Pma_engine): ma_result; cdecl; external;
function  ma_engine_stop(pEngine: Pma_engine): ma_result; cdecl; external;
function  ma_engine_set_volume(pEngine: Pma_engine; volume: Single): ma_result; cdecl; external;
function  ma_engine_get_volume(pEngine: Pma_engine): Single; cdecl; external;
function  ma_engine_set_gain_db(pEngine: Pma_engine; gainDB: Single): ma_result; cdecl; external;
function  ma_engine_get_gain_db(pEngine: Pma_engine): Single; cdecl; external;
function  ma_engine_get_listener_count(const pEngine: Pma_engine): ma_uint32; cdecl; external;
function  ma_engine_find_closest_listener(const pEngine: Pma_engine; absolutePosX: Single; absolutePosY: Single; absolutePosZ: Single): ma_uint32; cdecl; external;
procedure ma_engine_listener_set_position(pEngine: Pma_engine; listenerIndex: ma_uint32; x: Single; y: Single; z: Single); cdecl; external;
function  ma_engine_listener_get_position(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_vec3f; cdecl; external;
procedure ma_engine_listener_set_direction(pEngine: Pma_engine; listenerIndex: ma_uint32; x: Single; y: Single; z: Single); cdecl; external;
function  ma_engine_listener_get_direction(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_vec3f; cdecl; external;
procedure ma_engine_listener_set_velocity(pEngine: Pma_engine; listenerIndex: ma_uint32; x: Single; y: Single; z: Single); cdecl; external;
function  ma_engine_listener_get_velocity(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_vec3f; cdecl; external;
procedure ma_engine_listener_set_cone(pEngine: Pma_engine; listenerIndex: ma_uint32; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl; external;
procedure ma_engine_listener_get_cone(const pEngine: Pma_engine; listenerIndex: ma_uint32; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl; external;
procedure ma_engine_listener_set_world_up(pEngine: Pma_engine; listenerIndex: ma_uint32; x: Single; y: Single; z: Single); cdecl; external;
function  ma_engine_listener_get_world_up(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_vec3f; cdecl; external;
procedure ma_engine_listener_set_enabled(pEngine: Pma_engine; listenerIndex: ma_uint32; isEnabled: ma_bool32); cdecl; external;
function  ma_engine_listener_is_enabled(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_bool32; cdecl; external;
function  ma_engine_play_sound_ex(pEngine: Pma_engine; const pFilePath: PUTF8Char; pNode: Pma_node; nodeInputBusIndex: ma_uint32): ma_result; cdecl; external;
function  ma_engine_play_sound(pEngine: Pma_engine; const pFilePath: PUTF8Char; pGroup: Pma_sound_group): ma_result; cdecl; external;
function  ma_sound_init_from_file(pEngine: Pma_engine; const pFilePath: PUTF8Char; flags: ma_uint32; pGroup: Pma_sound_group; pDoneFence: Pma_fence; pSound: Pma_sound): ma_result; cdecl; external;
function  ma_sound_init_from_file_w(pEngine: Pma_engine; const pFilePath: PWideChar; flags: ma_uint32; pGroup: Pma_sound_group; pDoneFence: Pma_fence; pSound: Pma_sound): ma_result; cdecl; external;
function  ma_sound_init_copy(pEngine: Pma_engine; const pExistingSound: Pma_sound; flags: ma_uint32; pGroup: Pma_sound_group; pSound: Pma_sound): ma_result; cdecl; external;
function  ma_sound_init_from_data_source(pEngine: Pma_engine; pDataSource: Pma_data_source; flags: ma_uint32; pGroup: Pma_sound_group; pSound: Pma_sound): ma_result; cdecl; external;
function  ma_sound_init_ex(pEngine: Pma_engine; const pConfig: Pma_sound_config; pSound: Pma_sound): ma_result; cdecl; external;
procedure ma_sound_uninit(pSound: Pma_sound); cdecl; external;
function  ma_sound_get_engine(const pSound: Pma_sound): Pma_engine; cdecl; external;
function  ma_sound_get_data_source(const pSound: Pma_sound): Pma_data_source; cdecl; external;
function  ma_sound_start(pSound: Pma_sound): ma_result; cdecl; external;
function  ma_sound_stop(pSound: Pma_sound): ma_result; cdecl; external;
function  ma_sound_stop_with_fade_in_pcm_frames(pSound: Pma_sound; fadeLengthInFrames: ma_uint64): ma_result; cdecl; external;
function  ma_sound_stop_with_fade_in_milliseconds(pSound: Pma_sound; fadeLengthInFrames: ma_uint64): ma_result; cdecl; external;
procedure ma_sound_set_volume(pSound: Pma_sound; volume: Single); cdecl; external;
function  ma_sound_get_volume(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_pan(pSound: Pma_sound; pan: Single); cdecl; external;
function  ma_sound_get_pan(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_pan_mode(pSound: Pma_sound; panMode: ma_pan_mode); cdecl; external;
function  ma_sound_get_pan_mode(const pSound: Pma_sound): ma_pan_mode; cdecl; external;
procedure ma_sound_set_pitch(pSound: Pma_sound; pitch: Single); cdecl; external;
function  ma_sound_get_pitch(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_spatialization_enabled(pSound: Pma_sound; enabled: ma_bool32); cdecl; external;
function  ma_sound_is_spatialization_enabled(const pSound: Pma_sound): ma_bool32; cdecl; external;
procedure ma_sound_set_pinned_listener_index(pSound: Pma_sound; listenerIndex: ma_uint32); cdecl; external;
function  ma_sound_get_pinned_listener_index(const pSound: Pma_sound): ma_uint32; cdecl; external;
function  ma_sound_get_listener_index(const pSound: Pma_sound): ma_uint32; cdecl; external;
function  ma_sound_get_direction_to_listener(const pSound: Pma_sound): ma_vec3f; cdecl; external;
procedure ma_sound_set_position(pSound: Pma_sound; x: Single; y: Single; z: Single); cdecl; external;
function  ma_sound_get_position(const pSound: Pma_sound): ma_vec3f; cdecl; external;
procedure ma_sound_set_direction(pSound: Pma_sound; x: Single; y: Single; z: Single); cdecl; external;
function  ma_sound_get_direction(const pSound: Pma_sound): ma_vec3f; cdecl; external;
procedure ma_sound_set_velocity(pSound: Pma_sound; x: Single; y: Single; z: Single); cdecl; external;
function  ma_sound_get_velocity(const pSound: Pma_sound): ma_vec3f; cdecl; external;
procedure ma_sound_set_attenuation_model(pSound: Pma_sound; attenuationModel: ma_attenuation_model); cdecl; external;
function  ma_sound_get_attenuation_model(const pSound: Pma_sound): ma_attenuation_model; cdecl; external;
procedure ma_sound_set_positioning(pSound: Pma_sound; positioning: ma_positioning); cdecl; external;
function  ma_sound_get_positioning(const pSound: Pma_sound): ma_positioning; cdecl; external;
procedure ma_sound_set_rolloff(pSound: Pma_sound; rolloff: Single); cdecl; external;
function  ma_sound_get_rolloff(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_min_gain(pSound: Pma_sound; minGain: Single); cdecl; external;
function  ma_sound_get_min_gain(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_max_gain(pSound: Pma_sound; maxGain: Single); cdecl; external;
function  ma_sound_get_max_gain(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_min_distance(pSound: Pma_sound; minDistance: Single); cdecl; external;
function  ma_sound_get_min_distance(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_max_distance(pSound: Pma_sound; maxDistance: Single); cdecl; external;
function  ma_sound_get_max_distance(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_cone(pSound: Pma_sound; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl; external;
procedure ma_sound_get_cone(const pSound: Pma_sound; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl; external;
procedure ma_sound_set_doppler_factor(pSound: Pma_sound; dopplerFactor: Single); cdecl; external;
function  ma_sound_get_doppler_factor(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_directional_attenuation_factor(pSound: Pma_sound; directionalAttenuationFactor: Single); cdecl; external;
function  ma_sound_get_directional_attenuation_factor(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_fade_in_pcm_frames(pSound: Pma_sound; volumeBeg: Single; volumeEnd: Single; fadeLengthInFrames: ma_uint64); cdecl; external;
procedure ma_sound_set_fade_in_milliseconds(pSound: Pma_sound; volumeBeg: Single; volumeEnd: Single; fadeLengthInMilliseconds: ma_uint64); cdecl; external;
procedure ma_sound_set_fade_start_in_pcm_frames(pSound: Pma_sound; volumeBeg: Single; volumeEnd: Single; fadeLengthInFrames: ma_uint64; absoluteGlobalTimeInFrames: ma_uint64); cdecl; external;
procedure ma_sound_set_fade_start_in_milliseconds(pSound: Pma_sound; volumeBeg: Single; volumeEnd: Single; fadeLengthInMilliseconds: ma_uint64; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl; external;
function  ma_sound_get_current_fade_volume(const pSound: Pma_sound): Single; cdecl; external;
procedure ma_sound_set_start_time_in_pcm_frames(pSound: Pma_sound; absoluteGlobalTimeInFrames: ma_uint64); cdecl; external;
procedure ma_sound_set_start_time_in_milliseconds(pSound: Pma_sound; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl; external;
procedure ma_sound_set_stop_time_in_pcm_frames(pSound: Pma_sound; absoluteGlobalTimeInFrames: ma_uint64); cdecl; external;
procedure ma_sound_set_stop_time_in_milliseconds(pSound: Pma_sound; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl; external;
procedure ma_sound_set_stop_time_with_fade_in_pcm_frames(pSound: Pma_sound; stopAbsoluteGlobalTimeInFrames: ma_uint64; fadeLengthInFrames: ma_uint64); cdecl; external;
procedure ma_sound_set_stop_time_with_fade_in_milliseconds(pSound: Pma_sound; stopAbsoluteGlobalTimeInMilliseconds: ma_uint64; fadeLengthInMilliseconds: ma_uint64); cdecl; external;
function  ma_sound_is_playing(const pSound: Pma_sound): ma_bool32; cdecl; external;
function  ma_sound_get_time_in_pcm_frames(const pSound: Pma_sound): ma_uint64; cdecl; external;
function  ma_sound_get_time_in_milliseconds(const pSound: Pma_sound): ma_uint64; cdecl; external;
procedure ma_sound_set_looping(pSound: Pma_sound; isLooping: ma_bool32); cdecl; external;
function  ma_sound_is_looping(const pSound: Pma_sound): ma_bool32; cdecl; external;
function  ma_sound_at_end(const pSound: Pma_sound): ma_bool32; cdecl; external;
function  ma_sound_seek_to_pcm_frame(pSound: Pma_sound; frameIndex: ma_uint64): ma_result; cdecl; external;
function  ma_sound_get_data_format(pSound: Pma_sound; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl; external;
function  ma_sound_get_cursor_in_pcm_frames(pSound: Pma_sound; pCursor: Pma_uint64): ma_result; cdecl; external;
function  ma_sound_get_length_in_pcm_frames(pSound: Pma_sound; pLength: Pma_uint64): ma_result; cdecl; external;
function  ma_sound_get_cursor_in_seconds(pSound: Pma_sound; pCursor: PSingle): ma_result; cdecl; external;
function  ma_sound_get_length_in_seconds(pSound: Pma_sound; pLength: PSingle): ma_result; cdecl; external;
function  ma_sound_set_end_callback(pSound: Pma_sound; callback: ma_sound_end_proc; pUserData: Pointer): ma_result; cdecl; external;
function  ma_sound_group_init(pEngine: Pma_engine; flags: ma_uint32; pParentGroup: Pma_sound_group; pGroup: Pma_sound_group): ma_result; cdecl; external;
function  ma_sound_group_init_ex(pEngine: Pma_engine; const pConfig: Pma_sound_group_config; pGroup: Pma_sound_group): ma_result; cdecl; external;
procedure ma_sound_group_uninit(pGroup: Pma_sound_group); cdecl; external;
function  ma_sound_group_get_engine(const pGroup: Pma_sound_group): Pma_engine; cdecl; external;
function  ma_sound_group_start(pGroup: Pma_sound_group): ma_result; cdecl; external;
function  ma_sound_group_stop(pGroup: Pma_sound_group): ma_result; cdecl; external;
procedure ma_sound_group_set_volume(pGroup: Pma_sound_group; volume: Single); cdecl; external;
function  ma_sound_group_get_volume(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_pan(pGroup: Pma_sound_group; pan: Single); cdecl; external;
function  ma_sound_group_get_pan(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_pan_mode(pGroup: Pma_sound_group; panMode: ma_pan_mode); cdecl; external;
function  ma_sound_group_get_pan_mode(const pGroup: Pma_sound_group): ma_pan_mode; cdecl; external;
procedure ma_sound_group_set_pitch(pGroup: Pma_sound_group; pitch: Single); cdecl; external;
function  ma_sound_group_get_pitch(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_spatialization_enabled(pGroup: Pma_sound_group; enabled: ma_bool32); cdecl; external;
function  ma_sound_group_is_spatialization_enabled(const pGroup: Pma_sound_group): ma_bool32; cdecl; external;
procedure ma_sound_group_set_pinned_listener_index(pGroup: Pma_sound_group; listenerIndex: ma_uint32); cdecl; external;
function  ma_sound_group_get_pinned_listener_index(const pGroup: Pma_sound_group): ma_uint32; cdecl; external;
function  ma_sound_group_get_listener_index(const pGroup: Pma_sound_group): ma_uint32; cdecl; external;
function  ma_sound_group_get_direction_to_listener(const pGroup: Pma_sound_group): ma_vec3f; cdecl; external;
procedure ma_sound_group_set_position(pGroup: Pma_sound_group; x: Single; y: Single; z: Single); cdecl; external;
function  ma_sound_group_get_position(const pGroup: Pma_sound_group): ma_vec3f; cdecl; external;
procedure ma_sound_group_set_direction(pGroup: Pma_sound_group; x: Single; y: Single; z: Single); cdecl; external;
function  ma_sound_group_get_direction(const pGroup: Pma_sound_group): ma_vec3f; cdecl; external;
procedure ma_sound_group_set_velocity(pGroup: Pma_sound_group; x: Single; y: Single; z: Single); cdecl; external;
function  ma_sound_group_get_velocity(const pGroup: Pma_sound_group): ma_vec3f; cdecl; external;
procedure ma_sound_group_set_attenuation_model(pGroup: Pma_sound_group; attenuationModel: ma_attenuation_model); cdecl; external;
function  ma_sound_group_get_attenuation_model(const pGroup: Pma_sound_group): ma_attenuation_model; cdecl; external;
procedure ma_sound_group_set_positioning(pGroup: Pma_sound_group; positioning: ma_positioning); cdecl; external;
function  ma_sound_group_get_positioning(const pGroup: Pma_sound_group): ma_positioning; cdecl; external;
procedure ma_sound_group_set_rolloff(pGroup: Pma_sound_group; rolloff: Single); cdecl; external;
function  ma_sound_group_get_rolloff(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_min_gain(pGroup: Pma_sound_group; minGain: Single); cdecl; external;
function  ma_sound_group_get_min_gain(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_max_gain(pGroup: Pma_sound_group; maxGain: Single); cdecl; external;
function  ma_sound_group_get_max_gain(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_min_distance(pGroup: Pma_sound_group; minDistance: Single); cdecl; external;
function  ma_sound_group_get_min_distance(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_max_distance(pGroup: Pma_sound_group; maxDistance: Single); cdecl; external;
function  ma_sound_group_get_max_distance(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_cone(pGroup: Pma_sound_group; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl; external;
procedure ma_sound_group_get_cone(const pGroup: Pma_sound_group; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl; external;
procedure ma_sound_group_set_doppler_factor(pGroup: Pma_sound_group; dopplerFactor: Single); cdecl; external;
function  ma_sound_group_get_doppler_factor(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_directional_attenuation_factor(pGroup: Pma_sound_group; directionalAttenuationFactor: Single); cdecl; external;
function  ma_sound_group_get_directional_attenuation_factor(const pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_fade_in_pcm_frames(pGroup: Pma_sound_group; volumeBeg: Single; volumeEnd: Single; fadeLengthInFrames: ma_uint64); cdecl; external;
procedure ma_sound_group_set_fade_in_milliseconds(pGroup: Pma_sound_group; volumeBeg: Single; volumeEnd: Single; fadeLengthInMilliseconds: ma_uint64); cdecl; external;
function  ma_sound_group_get_current_fade_volume(pGroup: Pma_sound_group): Single; cdecl; external;
procedure ma_sound_group_set_start_time_in_pcm_frames(pGroup: Pma_sound_group; absoluteGlobalTimeInFrames: ma_uint64); cdecl; external;
procedure ma_sound_group_set_start_time_in_milliseconds(pGroup: Pma_sound_group; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl; external;
procedure ma_sound_group_set_stop_time_in_pcm_frames(pGroup: Pma_sound_group; absoluteGlobalTimeInFrames: ma_uint64); cdecl; external;
procedure ma_sound_group_set_stop_time_in_milliseconds(pGroup: Pma_sound_group; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl; external;
function  ma_sound_group_is_playing(const pGroup: Pma_sound_group): ma_bool32; cdecl; external;
function  ma_sound_group_get_time_in_pcm_frames(const pGroup: Pma_sound_group): ma_uint64; cdecl; external;

implementation

{$L CPas.miniaudio.o}

end.
