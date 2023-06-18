using System;
using System.Interop;

namespace OpenAL
{
	struct ALCdevice;
	struct ALCcontext;

	public static class OpenALSoft
	{
#region ALC

		/** Boolean False. */
		public const int ALC_FALSE =  0;

		/** Boolean True. */
		public const int ALC_TRUE = 1;

		/** Context attribute: <int> Hz. */
		public const int ALC_FREQUENCY = 0x1007;

		/** Context attribute: <int> Hz. */
		public const int ALC_REFRESH = 0x1008;

		/** Context attribute: AL_TRUE or AL_FALSE synchronous context? */
		public const int ALC_SYNC = 0x1009;

		/** Context attribute: <int> requested Mono (3D) Sources. */
		public const int ALC_MONO_SOURCES = 0x1010;

		/** Context attribute: <int> requested Stereo Sources. */
		public const int ALC_STEREO_SOURCES = 0x1011;

		/** No error. */
		public const int  ALC_NO_ERROR = 0;

		/** Invalid device handle. */
		public const int ALC_INVALID_DEVICE = 0xA001;

		/** Invalid context handle. */
		public const int ALC_INVALID_CONTEXT = 0xA002;

		/** Invalid enum parameter passed to an ALC call. */
		public const int ALC_INVALID_ENUM = 0xA003;

		/** Invalid value parameter passed to an ALC call. */
		public const int ALC_INVALID_VALUE = 0xA004;

		/** Out of memory. */
		public const int ALC_OUT_OF_MEMORY = 0xA005;


		/** Runtime ALC major version. */
		public const int ALC_MAJOR_VERSION = 0x1000;
		/** Runtime ALC minor version. */
		public const int ALC_MINOR_VERSION = 0x1001;

		/** Context attribute list size. */
		public const int ALC_ATTRIBUTES_SIZE = 0x1002;
		/** Context attribute list properties. */
		public const int ALC_ALL_ATTRIBUTES = 0x1003;

		/** String for the default device specifier. */
		public const int ALC_DEFAULT_DEVICE_SPECIFIER = 0x1004;
		/**
		 * String for the given device's specifier.
		 *
		 * If device handle is NULL, it is instead a null-char separated list of
		 * strings of known device specifiers (list ends with an empty string).
		 */
		public const int ALC_DEVICE_SPECIFIER = 0x1005;
		/** String for space-separated list of ALC extensions. */
		public const int ALC_EXTENSIONS = 0x1006;


		/** Capture extension */
		public const int  ALC_EXT_CAPTURE = 1;
		/**
		 * String for the given capture device's specifier.
		 *
		 * If device handle is NULL, it is instead a null-char separated list of
		 * strings of known capture device specifiers (list ends with an empty string).
		 */
		public const int ALC_CAPTURE_DEVICE_SPECIFIER = 0x310;
		/** String for the default capture device specifier. */
		public const int ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER = 0x311;
		/** Number of sample frames available for capture. */
		public const int ALC_CAPTURE_SAMPLES = 0x312;


		/** Enumerate All extension */
		public const int  ALC_ENUMERATE_ALL_EXT = 1;
		/** String for the default extended device specifier. */
		public const int ALC_DEFAULT_ALL_DEVICES_SPECIFIER = 0x1012;
		/**
		 * String for the given extended device's specifier.
		 *
		 * If device handle is NULL, it is instead a null-char separated list of
		 * strings of known extended device specifiers (list ends with an empty string).
		 */
		public const int ALC_ALL_DEVICES_SPECIFIER = 0x1013;


		public typealias ALCboolean = uint8;
		public typealias ALCchar = char8;
		public typealias ALCint = int32;
		public typealias ALCenum = int32;
		public typealias ALCvoid = void;
		public typealias ALCsizei = int32;
		public typealias ALCuint = uint32;

#if !OPENAL_DYNLOAD

		[CLink]
		public static extern ALCcontext* alcCreateContext(ALCdevice *device, ALCint *attrlist);

		[CLink]
		public static extern ALCboolean alcMakeContextCurrent(ALCcontext *context);

		[CLink]
		public static extern void alcProcessContext(ALCcontext *context);

		[CLink]
		public static extern void alcSuspendContext(ALCcontext *context);

		[CLink]
		public static extern void alcDestroyContext(ALCcontext *context);

		[CLink]
		public static extern ALCcontext* alcGetCurrentContext();

		[CLink]
		public static extern ALCdevice* alcGetContextsDevice(ALCcontext *context);

		[CLink]
		public static extern ALCdevice* alcOpenDevice(ALCchar *devicename);

		[CLink]
		public static extern ALCboolean alcCloseDevice(ALCdevice *device);

		[CLink]
		public static extern ALCenum alcGetError(ALCdevice *device);

		[CLink]
		public static extern ALCboolean alcIsExtensionPresent(ALCdevice *device, ALCchar *extname);

		[CLink]
		public static extern ALCvoid* alcGetProcAddress(ALCdevice *device, ALCchar *funcname);

		[CLink]
		public static extern ALCenum alcGetEnumValue(ALCdevice *device, ALCchar *enumname);

		[CLink]
		public static extern ALCchar* alcGetString(ALCdevice *device, ALCenum param);

		[CLink]
		public static extern void alcGetIntegerv(ALCdevice *device, ALCenum param, ALCsizei size, ALCint *values);

		[CLink]
		public static extern ALCdevice* alcCaptureOpenDevice(ALCchar *devicename, ALCuint frequency, ALCenum format, ALCsizei buffersize);

		[CLink]
		public static extern ALCboolean alcCaptureCloseDevice(ALCdevice *device);

		[CLink]
		public static extern void alcCaptureStart(ALCdevice *device);

		[CLink]
		public static extern void alcCaptureStop(ALCdevice *device);

		[CLink]
		public static extern void alcCaptureSamples(ALCdevice *device, ALCvoid *buffer, ALCsizei samples);

#endif

		/*
			Runtime loader function pointer definitions
		*/

		public function ALCcontext* PFN_alcCreateContext(ALCdevice *device, ALCint *attrlist);

		public function ALCboolean PFN_alcMakeContextCurrent(ALCcontext *context);

		public function void PFN_alcProcessContext(ALCcontext *context);

		public function void PFN_alcSuspendContext(ALCcontext *context);

		public function void PFN_alcDestroyContext(ALCcontext *context);

		public function ALCcontext* PFN_alcGetCurrentContext();

		public function ALCdevice* PFN_alcGetContextsDevice(ALCcontext *context);

		public function ALCdevice* PFN_alcOpenDevice(ALCchar *devicename);

		public function ALCboolean PFN_alcCloseDevice(ALCdevice *device);

		public function ALCenum PFN_alcGetError(ALCdevice *device);

		public function ALCboolean PFN_alcIsExtensionPresent(ALCdevice *device, ALCchar *extname);

		public function ALCvoid* PFN_alcGetProcAddress(ALCdevice *device, ALCchar *funcname);

		public function ALCenum PFN_alcGetEnumValue(ALCdevice *device, ALCchar *enumname);

		public function ALCchar* PFN_alcGetString(ALCdevice *device, ALCenum param);

		public function void PFN_alcGetIntegerv(ALCdevice *device, ALCenum param, ALCsizei size, ALCint *values);

		public function ALCdevice* PFN_alcCaptureOpenDevice(ALCchar *devicename, ALCuint frequency, ALCenum format, ALCsizei buffersize);

		public function ALCboolean PFN_alcCaptureCloseDevice(ALCdevice *device);

		public function void PFN_alcCaptureStart(ALCdevice *device);

		public function void PFN_alcCaptureStop(ALCdevice *device);

		public function void PFN_alcCaptureSamples(ALCdevice *device, ALCvoid *buffer, ALCsizei samples);

#endregion ALC

#region SOURCE

		/**
		 * Relative source.
		 * Type:    ALboolean
		 * Range:   [AL_TRUE, AL_FALSE]
		 * Default: AL_FALSE
		 *
		 * Specifies if the Source has relative coordinates.
		 */
		public const int AL_SOURCE_RELATIVE = 0x202;


		/**
		 * Inner cone angle, in degrees.
		 * Type:    ALint, ALfloat
		 * Range:   [0 - 360]
		 * Default: 360
		 *
		 * The angle covered by the inner cone, where the source will not attenuate.
		 */
		public const int AL_CONE_INNER_ANGLE = 0x1001;

		/**
		 * Outer cone angle, in degrees.
		 * Range:   [0 - 360]
		 * Default: 360
		 *
		 * The angle covered by the outer cone, where the source will be fully
		 * attenuated.
		 */
		public const int AL_CONE_OUTER_ANGLE = 0x1002;

		/**
		 * Source pitch.
		 * Type:    ALfloat
		 * Range:   [0.5 - 2.0]
		 * Default: 1.0
		 *
		 * A multiplier for the frequency (sample rate) of the source's buffer.
		 */
		public const int AL_PITCH = 0x1003;

		/**
		 * Source or listener position.
		 * Type:    ALfloat[3], ALint[3]
		 * Default: {0, 0, 0}
		 *
		 * The source or listener location in three dimensional space.
		 *
		 * OpenAL, like OpenGL, uses a right handed coordinate system, where in a
		 * frontal default view X (thumb) points right, Y points up (index finger), and
		 * Z points towards the viewer/camera (middle finger).
		 *
		 * To switch from a left handed coordinate system, flip the sign on the Z
		 * coordinate.
		 */
		public const int AL_POSITION = 0x1004;

		/**
		 * Source direction.
		 * Type:    ALfloat[3], ALint[3]
		 * Default: {0, 0, 0}
		 *
		 * Specifies the current direction in local space.
		 * A zero-length vector specifies an omni-directional source (cone is ignored).
		 */
		public const int AL_DIRECTION = 0x1005;

		/**
		 * Source or listener velocity.
		 * Type:    ALfloat[3], ALint[3]
		 * Default: {0, 0, 0}
		 *
		 * Specifies the current velocity in local space.
		 */
		public const int AL_VELOCITY = 0x1006;

		/**
		 * Source looping.
		 * Type:    ALboolean
		 * Range:   [AL_TRUE, AL_FALSE]
		 * Default: AL_FALSE
		 *
		 * Specifies whether source is looping.
		 */
		public const int AL_LOOPING = 0x1007;

		/**
		 * Source buffer.
		 * Type:  ALuint
		 * Range: any valid Buffer.
		 *
		 * Specifies the buffer to provide sound samples.
		 */
		public const int AL_BUFFER = 0x1009;

		/**
		 * Source or listener gain.
		 * Type:  ALfloat
		 * Range: [0.0 - ]
		 *
		 * A value of 1.0 means unattenuated. Each division by 2 equals an attenuation
		 * of about -6dB. Each multiplicaton by 2 equals an amplification of about
		 * +6dB.
		 *
		 * A value of 0.0 is meaningless with respect to a logarithmic scale; it is
		 * silent.
		 */
		public const int AL_GAIN = 0x100A;

		/**
		 * Minimum source gain.
		 * Type:  ALfloat
		 * Range: [0.0 - 1.0]
		 *
		 * The minimum gain allowed for a source, after distance and cone attenation is
		 * applied (if applicable).
		 */
		public const int AL_MIN_GAIN = 0x100D;

		/**
		 * Maximum source gain.
		 * Type:  ALfloat
		 * Range: [0.0 - 1.0]
		 *
		 * The maximum gain allowed for a source, after distance and cone attenation is
		 * applied (if applicable).
		 */
		public const int AL_MAX_GAIN = 0x100E;

		/**
		 * Listener orientation.
		 * Type: ALfloat[6]
		 * Default: {0.0, 0.0, -1.0, 0.0, 1.0, 0.0}
		 *
		 * Effectively two three dimensional vectors. The first vector is the front (or
		 * "at") and the second is the top (or "up").
		 *
		 * Both vectors are in local space.
		 */
		public const int AL_ORIENTATION = 0x100F;

		/**
		 * Source state (query only).
		 * Type:  ALint
		 * Range: [AL_INITIAL, AL_PLAYING, AL_PAUSED, AL_STOPPED]
		 */
		public const int AL_SOURCE_STATE = 0x1010;

		/* Source state values. */
		public const int AL_INITIAL = 0x1011;
		public const int AL_PLAYING = 0x1012;
		public const int AL_PAUSED = 0x1013;
		public const int AL_STOPPED = 0x1014;

		/**
		 * Source Buffer Queue size (query only).
		 * Type: ALint
		 *
		 * The number of buffers queued using alSourceQueueBuffers, minus the buffers
		 * removed with alSourceUnqueueBuffers.
		 */
		public const int AL_BUFFERS_QUEUED = 0x1015;

		/**
		 * Source Buffer Queue processed count (query only).
		 * Type: ALint
		 *
		 * The number of queued buffers that have been fully processed, and can be
		 * removed with alSourceUnqueueBuffers.
		 *
		 * Looping sources will never fully process buffers because they will be set to
		 * play again for when the source loops.
		 */
		public const int AL_BUFFERS_PROCESSED = 0x1016;

		/**
		 * Source reference distance.
		 * Type:    ALfloat
		 * Range:   [0.0 - ]
		 * Default: 1.0
		 *
		 * The distance in units that no attenuation occurs.
		 *
		 * At 0.0, no distance attenuation ever occurs on non-linear attenuation models.
		 */
		public const int AL_REFERENCE_DISTANCE = 0x1020;

		/**
		 * Source rolloff factor.
		 * Type:    ALfloat
		 * Range:   [0.0 - ]
		 * Default: 1.0
		 *
		 * Multiplier to exaggerate or diminish distance attenuation.
		 *
		 * At 0.0, no distance attenuation ever occurs.
		 */
		public const int AL_ROLLOFF_FACTOR = 0x1021;

		/**
		 * Outer cone gain.
		 * Type:    ALfloat
		 * Range:   [0.0 - 1.0]
		 * Default: 0.0
		 *
		 * The gain attenuation applied when the listener is outside of the source's
		 * outer cone.
		 */
		public const int AL_CONE_OUTER_GAIN = 0x1022;

		/**
		 * Source maximum distance.
		 * Type:    ALfloat
		 * Range:   [0.0 - ]
		 * Default: FLT_MAX
		 *
		 * The distance above which the source is not attenuated any further with a
		 * clamped distance model, or where attenuation reaches 0.0 gain for linear
		 * distance models with a default rolloff factor.
		 */
		public const int AL_MAX_DISTANCE = 0x1023;

		/** Source buffer position, in seconds */
		public const int AL_SEC_OFFSET = 0x1024;
		/** Source buffer position, in sample frames */
		public const int AL_SAMPLE_OFFSET = 0x1025;
		/** Source buffer position, in bytes */
		public const int AL_BYTE_OFFSET = 0x1026;

		/**
		 * Source type (query only).
		 * Type:  ALint
		 * Range: [AL_STATIC, AL_STREAMING, AL_UNDETERMINED]
		 *
		 * A Source is Static if a Buffer has been attached using AL_BUFFER.
		 *
		 * A Source is Streaming if one or more Buffers have been attached using
		 * alSourceQueueBuffers.
		 *
		 * A Source is Undetermined when it has the NULL buffer attached using
		 * AL_BUFFER.
		 */
		public const int AL_SOURCE_TYPE = 0x1027;

		/* Source type values. */
		public const int AL_STATIC = 0x1028;
		public const int AL_STREAMING = 0x1029;
		public const int AL_UNDETERMINED = 0x1030;

		/** Unsigned 8-bit mono buffer format. */
		public const int AL_FORMAT_MONO8 = 0x1100;
		/** Signed 16-bit mono buffer format. */
		public const int AL_FORMAT_MONO16 = 0x1101;
		/** Unsigned 8-bit stereo buffer format. */
		public const int AL_FORMAT_STEREO8 = 0x1102;
		/** Signed 16-bit stereo buffer format. */
		public const int AL_FORMAT_STEREO16 = 0x1103;

		/** Buffer frequency (query only). */
		public const int AL_FREQUENCY = 0x2001;
		/** Buffer bits per sample (query only). */
		public const int AL_BITS = 0x2002;
		/** Buffer channel count (query only). */
		public const int AL_CHANNELS = 0x2003;
		/** Buffer data size (query only). */
		public const int AL_SIZE = 0x2004;


		/* Buffer state. Not for public use. */
		public const int AL_UNUSED = 0x2010;
		public const int AL_PENDING = 0x2011;
		public const int AL_PROCESSED = 0x2012;


		/** No error. */
		public const int AL_NO_ERROR = 0;

		/** Invalid name paramater passed to AL call. */
		public const int AL_INVALID_NAME = 0xA001;

		/** Invalid enum parameter passed to AL call. */
		public const int AL_INVALID_ENUM = 0xA002;

		/** Invalid value parameter passed to AL call. */
		public const int AL_INVALID_VALUE = 0xA003;

		/** Illegal AL call. */
		public const int AL_INVALID_OPERATION = 0xA004;

		/** Not enough memory. */
		public const int AL_OUT_OF_MEMORY = 0xA005;


		/** Context string: Vendor ID. */
		public const int AL_VENDOR = 0xB001;
		/** Context string: Version. */
		public const int AL_VERSION = 0xB002;
		/** Context string: Renderer ID. */
		public const int AL_RENDERER = 0xB003;
		/** Context string: Space-separated extension list. */
		public const int AL_EXTENSIONS = 0xB004;


		/**
		 * Doppler scale.
		 * Type:    ALfloat
		 * Range:   [0.0 - ]
		 * Default: 1.0
		 *
		 * Scale for source and listener velocities.
		 */
		public const int AL_DOPPLER_FACTOR = 0xC000;

		/**
		 * Doppler velocity (deprecated).
		 *
		 * A multiplier applied to the Speed of Sound.
		 */
		public const int AL_DOPPLER_VELOCITY = 0xC001;

		/**
		 * Speed of Sound, in units per second.
		 * Type:    ALfloat
		 * Range:   [0.0001 - ]
		 * Default: 343.3
		 *
		 * The speed at which sound waves are assumed to travel, when calculating the
		 * doppler effect.
		 */
		public const int AL_SPEED_OF_SOUND = 0xC003;

		/**
		 * Distance attenuation model.
		 * Type:    ALint
		 * Range:   [AL_NONE, AL_INVERSE_DISTANCE, AL_INVERSE_DISTANCE_CLAMPED,
		 *           AL_LINEAR_DISTANCE, AL_LINEAR_DISTANCE_CLAMPED,
		 *           AL_EXPONENT_DISTANCE, AL_EXPONENT_DISTANCE_CLAMPED]
		 * Default: AL_INVERSE_DISTANCE_CLAMPED
		 *
		 * The model by which sources attenuate with distance.
		 *
		 * None     - No distance attenuation.
		 * Inverse  - Doubling the distance halves the source gain.
		 * Linear   - Linear gain scaling between the reference and max distances.
		 * Exponent - Exponential gain dropoff.
		 *
		 * Clamped variations work like the non-clamped counterparts, except the
		 * distance calculated is clamped between the reference and max distances.
		 */
		public const int AL_DISTANCE_MODEL = 0xD000;

		/* Distance model values. */
		public const int AL_INVERSE_DISTANCE = 0xD001;
		public const int AL_INVERSE_DISTANCE_CLAMPED = 0xD002;
		public const int AL_LINEAR_DISTANCE = 0xD003;
		public const int AL_LINEAR_DISTANCE_CLAMPED = 0xD004;
		public const int AL_EXPONENT_DISTANCE = 0xD005;
		public const int AL_EXPONENT_DISTANCE_CLAMPED = 0xD006;

		public typealias ALfloat = float;
		public typealias ALdouble = float;
		public typealias ALenum = int32;
		public typealias ALint = int32;
		public typealias ALsizei = int32;
		public typealias ALuint = uint32;
		public typealias ALboolean = uint8;
		public typealias ALchar = char8;
		public typealias ALvoid = void;

#if !OPENAL_DYNLOAD

		[CLink]
		public static extern void alDopplerFactor(ALfloat value);

		[CLink]
		public static extern void alDopplerVelocity(ALfloat value);

		[CLink]
		public static extern void alSpeedOfSound(ALfloat value);

		[CLink]
		public static extern void alDistanceModel(ALenum distanceModel);

		[CLink]
		public static extern void alEnable(ALenum capability);

		[CLink]
		public static extern void alDisable(ALenum capability);

		[CLink]
		public static extern ALboolean alIsEnabled(ALenum capability);

		[CLink]
		public static extern ALchar* alGetString(ALenum param);

		[CLink]
		public static extern void alGetBooleanv(ALenum param, ALboolean *values);

		[CLink]
		public static extern void alGetIntegerv(ALenum param, ALint *values);

		[CLink]
		public static extern void alGetFloatv(ALenum param, ALfloat *values);

		[CLink]
		public static extern void alGetDoublev(ALenum param, ALdouble *values);

		[CLink]
		public static extern ALboolean alGetBoolean(ALenum param);

		[CLink]
		public static extern ALint alGetInteger(ALenum param);

		[CLink]
		public static extern ALfloat alGetFloat(ALenum param);

		[CLink]
		public static extern ALdouble alGetDouble(ALenum param);

		[CLink]
		public static extern ALenum alGetError();

		[CLink]
		public static extern ALboolean alIsExtensionPresent(ALchar *extname);

		[CLink]
		public static extern void* alGetProcAddress(ALchar *fname);

		[CLink]
		public static extern ALenum alGetEnumValue(ALchar *ename);

		[CLink]
		public static extern void alListenerf(ALenum param, ALfloat value);

		[CLink]
		public static extern void alListener3f(ALenum param, ALfloat value1, ALfloat value2, ALfloat value3);

		[CLink]
		public static extern void alListenerfv(ALenum param, ALfloat *values);

		[CLink]
		public static extern void alListeneri(ALenum param, ALint value);

		[CLink]
		public static extern void alListener3i(ALenum param, ALint value1, ALint value2, ALint value3);

		[CLink]
		public static extern void alListeneriv(ALenum param, ALint *values);

		[CLink]
		public static extern void alGetListenerf(ALenum param, ALfloat *value);

		[CLink]
		public static extern void alGetListener3f(ALenum param, ALfloat *value1, ALfloat *value2, ALfloat *value3);

		[CLink]
		public static extern void alGetListenerfv(ALenum param, ALfloat *values);

		[CLink]
		public static extern void alGetListeneri(ALenum param, ALint *value);

		[CLink]
		public static extern void alGetListener3i(ALenum param, ALint *value1, ALint *value2, ALint *value3);

		[CLink]
		public static extern void alGetListeneriv(ALenum param, ALint *values);

		[CLink]
		public static extern void alGenSources(ALsizei n, ALuint *sources);

		[CLink]
		public static extern void alDeleteSources(ALsizei n, ALuint *sources);

		[CLink]
		public static extern ALboolean alIsSource(ALuint source);

		[CLink]
		public static extern void alSourcef(ALuint source, ALenum param, ALfloat value);

		[CLink]
		public static extern void alSource3f(ALuint source, ALenum param, ALfloat value1, ALfloat value2, ALfloat value3);

		[CLink]
		public static extern void alSourcefv(ALuint source, ALenum param, ALfloat *values);

		[CLink]
		public static extern void alSourcei(ALuint source, ALenum param, ALint value);

		[CLink]
		public static extern void alSource3i(ALuint source, ALenum param, ALint value1, ALint value2, ALint value3);

		[CLink]
		public static extern void alSourceiv(ALuint source, ALenum param, ALint *values);

		[CLink]
		public static extern void alGetSourcef(ALuint source, ALenum param, ALfloat *value);

		[CLink]
		public static extern void alGetSource3f(ALuint source, ALenum param, ALfloat *value1, ALfloat *value2, ALfloat *value3);

		[CLink]
		public static extern void alGetSourcefv(ALuint source, ALenum param, ALfloat *values);

		[CLink]
		public static extern void alGetSourcei(ALuint source,  ALenum param, ALint *value);

		[CLink]
		public static extern void alGetSource3i(ALuint source, ALenum param, ALint *value1, ALint *value2, ALint *value3);

		[CLink]
		public static extern void alGetSourceiv(ALuint source,  ALenum param, ALint *values);

		[CLink]
		public static extern void alSourcePlayv(ALsizei n, ALuint *sources);

		[CLink]
		public static extern void alSourceStopv(ALsizei n, ALuint *sources);

		[CLink]
		public static extern void alSourceRewindv(ALsizei n, ALuint *sources);

		[CLink]
		public static extern void alSourcePausev(ALsizei n, ALuint *sources);

		[CLink]
		public static extern void alSourcePlay(ALuint source);

		[CLink]
		public static extern void alSourceStop(ALuint source);

		[CLink]
		public static extern void alSourceRewind(ALuint source);

		[CLink]
		public static extern void alSourcePause(ALuint source);

		[CLink]
		public static extern void alSourceQueueBuffers(ALuint source, ALsizei nb, ALuint *buffers);

		[CLink]
		public static extern void alSourceUnqueueBuffers(ALuint source, ALsizei nb, ALuint *buffers);

		[CLink]
		public static extern void alGenBuffers(ALsizei n, ALuint *buffers);

		[CLink]
		public static extern void alDeleteBuffers(ALsizei n, ALuint *buffers);

		[CLink]
		public static extern ALboolean alIsBuffer(ALuint buffer);

		[CLink]
		public static extern void alBufferData(ALuint buffer, ALenum format, ALvoid *data, ALsizei size, ALsizei freq);

		[CLink]
		public static extern void alBufferf(ALuint buffer, ALenum param, ALfloat value);

		[CLink]
		public static extern void alBuffer3f(ALuint buffer, ALenum param, ALfloat value1, ALfloat value2, ALfloat value3);

		[CLink]
		public static extern void alBufferfv(ALuint buffer, ALenum param, ALfloat *values);

		[CLink]
		public static extern void alBufferi(ALuint buffer, ALenum param, ALint value);

		[CLink]
		public static extern void alBuffer3i(ALuint buffer, ALenum param, ALint value1, ALint value2, ALint value3);

		[CLink]
		public static extern void alBufferiv(ALuint buffer, ALenum param, ALint *values);

		[CLink]
		public static extern void alGetBufferf(ALuint buffer, ALenum param, ALfloat *value);

		[CLink]
		public static extern void alGetBuffer3f(ALuint buffer, ALenum param, ALfloat *value1, ALfloat *value2, ALfloat *value3);

		[CLink]
		public static extern void alGetBufferfv(ALuint buffer, ALenum param, ALfloat *values);

		[CLink]
		public static extern void alGetBufferi(ALuint buffer, ALenum param, ALint *value);

		[CLink]
		public static extern void alGetBuffer3i(ALuint buffer, ALenum param, ALint *value1, ALint *value2, ALint *value3);

		[CLink]
		public static extern void alGetBufferiv(ALuint buffer, ALenum param, ALint *values);

#endif

		/*
		 Runtime loader function definitions
		*/
		
		public function void PFN_alDopplerFactor(ALfloat vPFN_alue);

		public function void PFN_alDopplerVelocity(ALfloat vPFN_alue);

		public function void PFN_alSpeedOfSound(ALfloat vPFN_alue);

		public function void PFN_alDistanceModel(ALenum distanceModel);

		public function void PFN_alEnable(ALenum capability);

		public function void PFN_alDisable(ALenum capability);

		public function ALboolean PFN_alIsEnabled(ALenum capability);

		public function ALchar* PFN_alGetString(ALenum param);

		public function void PFN_alGetBooleanv(ALenum param, ALboolean *vPFN_alues);

		public function void PFN_alGetIntegerv(ALenum param, ALint *vPFN_alues);

		public function void PFN_alGetFloatv(ALenum param, ALfloat *vPFN_alues);

		public function void PFN_alGetDoublev(ALenum param, ALdouble *vPFN_alues);

		public function ALboolean PFN_alGetBoolean(ALenum param);

		public function ALint PFN_alGetInteger(ALenum param);

		public function ALfloat PFN_alGetFloat(ALenum param);

		public function ALdouble PFN_alGetDouble(ALenum param);

		public function ALenum PFN_alGetError();

		public function ALboolean PFN_alIsExtensionPresent(ALchar *extname);

		public function void* PFN_alGetProcAddress(ALchar *fname);

		public function ALenum PFN_alGetEnumValue(ALchar *ename);

		public function void PFN_alListenerf(ALenum param, ALfloat vPFN_alue);

		public function void PFN_alListener3f(ALenum param, ALfloat vPFN_alue1, ALfloat vPFN_alue2, ALfloat vPFN_alue3);

		public function void PFN_alListenerfv(ALenum param, ALfloat *vPFN_alues);

		public function void PFN_alListeneri(ALenum param, ALint vPFN_alue);

		public function void PFN_alListener3i(ALenum param, ALint vPFN_alue1, ALint vPFN_alue2, ALint vPFN_alue3);

		public function void PFN_alListeneriv(ALenum param, ALint *vPFN_alues);

		public function void PFN_alGetListenerf(ALenum param, ALfloat *vPFN_alue);

		public function void PFN_alGetListener3f(ALenum param, ALfloat *vPFN_alue1, ALfloat *vPFN_alue2, ALfloat *vPFN_alue3);

		public function void PFN_alGetListenerfv(ALenum param, ALfloat *vPFN_alues);

		public function void PFN_alGetListeneri(ALenum param, ALint *vPFN_alue);

		public function void PFN_alGetListener3i(ALenum param, ALint *vPFN_alue1, ALint *vPFN_alue2, ALint *vPFN_alue3);

		public function void PFN_alGetListeneriv(ALenum param, ALint *vPFN_alues);

		public function void PFN_alGenSources(ALsizei n, ALuint *sources);

		public function void PFN_alDeleteSources(ALsizei n, ALuint *sources);

		public function ALboolean PFN_alIsSource(ALuint source);

		public function void PFN_alSourcef(ALuint source, ALenum param, ALfloat vPFN_alue);

		public function void PFN_alSource3f(ALuint source, ALenum param, ALfloat vPFN_alue1, ALfloat vPFN_alue2, ALfloat vPFN_alue3);

		public function void PFN_alSourcefv(ALuint source, ALenum param, ALfloat *vPFN_alues);

		public function void PFN_alSourcei(ALuint source, ALenum param, ALint vPFN_alue);

		public function void PFN_alSource3i(ALuint source, ALenum param, ALint vPFN_alue1, ALint vPFN_alue2, ALint vPFN_alue3);

		public function void PFN_alSourceiv(ALuint source, ALenum param, ALint *vPFN_alues);

		public function void PFN_alGetSourcef(ALuint source, ALenum param, ALfloat *vPFN_alue);

		public function void PFN_alGetSource3f(ALuint source, ALenum param, ALfloat *vPFN_alue1, ALfloat *vPFN_alue2, ALfloat *vPFN_alue3);

		public function void PFN_alGetSourcefv(ALuint source, ALenum param, ALfloat *vPFN_alues);

		public function void PFN_alGetSourcei(ALuint source,  ALenum param, ALint *vPFN_alue);

		public function void PFN_alGetSource3i(ALuint source, ALenum param, ALint *vPFN_alue1, ALint *vPFN_alue2, ALint *vPFN_alue3);

		public function void PFN_alGetSourceiv(ALuint source,  ALenum param, ALint *vPFN_alues);

		public function void PFN_alSourcePlayv(ALsizei n, ALuint *sources);

		public function void PFN_alSourceStopv(ALsizei n, ALuint *sources);

		public function void PFN_alSourceRewindv(ALsizei n, ALuint *sources);

		public function void PFN_alSourcePausev(ALsizei n, ALuint *sources);

		public function void PFN_alSourcePlay(ALuint source);

		public function void PFN_alSourceStop(ALuint source);

		public function void PFN_alSourceRewind(ALuint source);

		public function void PFN_alSourcePause(ALuint source);

		public function void PFN_alSourceQueueBuffers(ALuint source, ALsizei nb, ALuint *buffers);

		public function void PFN_alSourceUnqueueBuffers(ALuint source, ALsizei nb, ALuint *buffers);

		public function void PFN_alGenBuffers(ALsizei n, ALuint *buffers);

		public function void PFN_alDeleteBuffers(ALsizei n, ALuint *buffers);

		public function ALboolean PFN_alIsBuffer(ALuint buffer);

		public function void PFN_alBufferData(ALuint buffer, ALenum format, ALvoid *data, ALsizei size, ALsizei freq);

		public function void PFN_alBufferf(ALuint buffer, ALenum param, ALfloat vPFN_alue);

		public function void PFN_alBuffer3f(ALuint buffer, ALenum param, ALfloat vPFN_alue1, ALfloat vPFN_alue2, ALfloat vPFN_alue3);

		public function void PFN_alBufferfv(ALuint buffer, ALenum param, ALfloat *vPFN_alues);

		public function void PFN_alBufferi(ALuint buffer, ALenum param, ALint vPFN_alue);

		public function void PFN_alBuffer3i(ALuint buffer, ALenum param, ALint vPFN_alue1, ALint vPFN_alue2, ALint vPFN_alue3);

		public function void PFN_alBufferiv(ALuint buffer, ALenum param, ALint *vPFN_alues);

		public function void PFN_alGetBufferf(ALuint buffer, ALenum param, ALfloat *vPFN_alue);

		public function void PFN_alGetBuffer3f(ALuint buffer, ALenum param, ALfloat *vPFN_alue1, ALfloat *vPFN_alue2, ALfloat *vPFN_alue3);

		public function void PFN_alGetBufferfv(ALuint buffer, ALenum param, ALfloat *vPFN_alues);

		public function void PFN_alGetBufferi(ALuint buffer, ALenum param, ALint *vPFN_alue);

		public function void PFN_alGetBuffer3i(ALuint buffer, ALenum param, ALint *vPFN_alue1, ALint *vPFN_alue2, ALint *vPFN_alue3);

		public function void PFN_alGetBufferiv(ALuint buffer, ALenum param, ALint *vPFN_alues);

#endregion SOURCE

		public enum InitError
		{
			Device,
			Context,
		}

		// ALC
		public static PFN_alcCreateContext alcCreateContextFn;
		public static PFN_alcMakeContextCurrent alcMakeContextCurrentFn;
		public static PFN_alcProcessContext alcProcessContextFn;
		public static PFN_alcSuspendContext alcSuspendContextFn;
		public static PFN_alcDestroyContext alcDestroyContextFn;
		public static PFN_alcGetCurrentContext alcGetCurrentContextFn;
		public static PFN_alcGetContextsDevice alcGetContextsDeviceFn;
		public static PFN_alcOpenDevice alcOpenDeviceFn;
		public static PFN_alcCloseDevice alcCloseDeviceFn;
		public static PFN_alcGetError alcGetErrorFn;
		public static PFN_alcIsExtensionPresent alcIsExtensionPresentFn;
		public static PFN_alcGetProcAddress alcGetProcAddressFn;
		public static PFN_alcGetEnumValue alcGetEnumValueFn;
		public static PFN_alcGetString alcGetStringFn;
		public static PFN_alcGetIntegerv alcGetIntegervFn;
		public static PFN_alcCaptureOpenDevice alcCaptureOpenDeviceFn;
		public static PFN_alcCaptureCloseDevice alcCaptureCloseDeviceFn;
		public static PFN_alcCaptureStart alcCaptureStartFn;
		public static PFN_alcCaptureStop alcCaptureStopFn;
		public static PFN_alcCaptureSamples alcCaptureSamplesFn;

		// AL

		public static PFN_alDopplerFactor alDopplerFactorFn;
		public static PFN_alDopplerVelocity alDopplerVelocityFn;
		public static PFN_alSpeedOfSound alSpeedOfSoundFn;
		public static PFN_alDistanceModel alDistanceModelFn;
		public static PFN_alEnable alEnableFn;
		public static PFN_alDisable alDisableFn;
		public static PFN_alIsEnabled alIsEnabledFn;
		public static PFN_alGetString alGetStringFn;
		public static PFN_alGetBooleanv alGetBooleanvFn;
		public static PFN_alGetIntegerv alGetIntegervFn;
		public static PFN_alGetFloatv alGetFloatvFn;
		public static PFN_alGetDoublev alGetDoublevFn;
		public static PFN_alGetBoolean alGetBooleanFn;
		public static PFN_alGetInteger alGetIntegerFn;
		public static PFN_alGetFloat alGetFloatFn;
		public static PFN_alGetDouble alGetDoubleFn;
		public static PFN_alGetError alGetErrorFn;
		public static PFN_alIsExtensionPresent alIsExtensionPresentFn;
		public static PFN_alGetProcAddress alGetProcAddressFn;
		public static PFN_alGetEnumValue alGetEnumValueFn;
		public static PFN_alListenerf alListenerfFn;
		public static PFN_alListener3f alListener3fFn;
		public static PFN_alListenerfv alListenerfvFn;
		public static PFN_alListeneri alListeneriFn;
		public static PFN_alListener3i alListener3iFn;
		public static PFN_alListeneriv alListenerivFn;
		public static PFN_alGetListenerf alGetListenerfFn;
		public static PFN_alGetListener3f alGetListener3fFn;
		public static PFN_alGetListenerfv alGetListenerfvFn;
		public static PFN_alGetListeneri alGetListeneriFn;
		public static PFN_alGetListener3i alGetListener3iFn;
		public static PFN_alGetListeneriv alGetListenerivFn;
		public static PFN_alGenSources alGenSourcesFn;
		public static PFN_alDeleteSources alDeleteSourcesFn;
		public static PFN_alIsSource alIsSourceFn;
		public static PFN_alSourcef alSourcefFn;
		public static PFN_alSource3f alSource3fFn;
		public static PFN_alSourcefv alSourcefvFn;
		public static PFN_alSourcei alSourceiFn;
		public static PFN_alSource3i alSource3iFn;
		public static PFN_alSourceiv alSourceivFn;
		public static PFN_alGetSourcef alGetSourcefFn;
		public static PFN_alGetSource3f alGetSource3fFn;
		public static PFN_alGetSourcefv alGetSourcefvFn;
		public static PFN_alGetSourcei alGetSourceiFn;
		public static PFN_alGetSource3i alGetSource3iFn;
		public static PFN_alGetSourceiv alGetSourceivFn;
		public static PFN_alSourcePlayv alSourcePlayvFn;
		public static PFN_alSourceStopv alSourceStopvFn;
		public static PFN_alSourceRewindv alSourceRewindvFn;
		public static PFN_alSourcePausev alSourcePausevFn;
		public static PFN_alSourcePlay alSourcePlayFn;
		public static PFN_alSourceStop alSourceStopFn;
		public static PFN_alSourceRewind alSourceRewindFn;
		public static PFN_alSourcePause alSourcePauseFn;
		public static PFN_alSourceQueueBuffers alSourceQueueBuffersFn;
		public static PFN_alSourceUnqueueBuffers alSourceUnqueueBuffersFn;
		public static PFN_alGenBuffers alGenBuffersFn;
		public static PFN_alDeleteBuffers alDeleteBuffersFn;
		public static PFN_alIsBuffer alIsBufferFn;
		public static PFN_alBufferData alBufferDataFn;
		public static PFN_alBufferf alBufferfFn;
		public static PFN_alBuffer3f alBuffer3fFn;
		public static PFN_alBufferfv alBufferfvFn;
		public static PFN_alBufferi alBufferiFn;
		public static PFN_alBuffer3i alBuffer3iFn;
		public static PFN_alBufferiv alBufferivFn;
		public static PFN_alGetBufferf alGetBufferfFn;
		public static PFN_alGetBuffer3f alGetBuffer3fFn;
		public static PFN_alGetBufferfv alGetBufferfvFn;
		public static PFN_alGetBufferi alGetBufferiFn;
		public static PFN_alGetBuffer3i alGetBuffer3iFn;
		public static PFN_alGetBufferiv alGetBufferivFn;

		public delegate void* LoaderDelegate(StringView name);

		static void InitFunctionPtrsStatic()
		{
#if !OPENAL_DYNLOAD

			// ALC
			alcCreateContextFn = => alcCreateContext;
			alcMakeContextCurrentFn = => alcMakeContextCurrent;
			alcProcessContextFn = => alcProcessContext;
			alcSuspendContextFn = => alcSuspendContext;
			alcDestroyContextFn = => alcDestroyContext;
			alcGetCurrentContextFn = => alcGetCurrentContext;
			alcGetContextsDeviceFn = => alcGetContextsDevice;
			alcOpenDeviceFn = => alcOpenDevice;
			alcCloseDeviceFn = => alcCloseDevice;
			alcGetErrorFn = => alcGetError;
			alcIsExtensionPresentFn = => alcIsExtensionPresent;
			alcGetProcAddressFn = => alcGetProcAddress;
			alcGetEnumValueFn = => alcGetEnumValue;
			alcGetStringFn = => alcGetString;
			alcGetIntegervFn = => alcGetIntegerv;
			alcCaptureOpenDeviceFn = => alcCaptureOpenDevice;
			alcCaptureCloseDeviceFn = => alcCaptureCloseDevice;
			alcCaptureStartFn = => alcCaptureStart;
			alcCaptureStopFn = => alcCaptureStop;
			alcCaptureSamplesFn = => alcCaptureSamples;

			// AL
			alDopplerFactorFn = => alDopplerFactor;
			alDopplerVelocityFn = => alDopplerVelocity;
			alSpeedOfSoundFn = => alSpeedOfSound;
			alDistanceModelFn = => alDistanceModel;
			alEnableFn = => alEnable;
			alDisableFn = => alDisable;
			alIsEnabledFn = => alIsEnabled;
			alGetStringFn = => alGetString;
			alGetBooleanvFn = => alGetBooleanv;
			alGetIntegervFn = => alGetIntegerv;
			alGetFloatvFn = => alGetFloatv;
			alGetDoublevFn = => alGetDoublev;
			alGetBooleanFn = => alGetBoolean;
			alGetIntegerFn = => alGetInteger;
			alGetFloatFn = => alGetFloat;
			alGetDoubleFn = => alGetDouble;
			alGetErrorFn = => alGetError;
			alIsExtensionPresentFn = => alIsExtensionPresent;
			alGetProcAddressFn = => alGetProcAddress;
			alGetEnumValueFn = => alGetEnumValue;
			alListenerfFn = => alListenerf;
			alListener3fFn = => alListener3f;
			alListenerfvFn = => alListenerfv;
			alListeneriFn = => alListeneri;
			alListener3iFn = => alListener3i;
			alListenerivFn = => alListeneriv;
			alGetListenerfFn = => alGetListenerf;
			alGetListener3fFn = => alGetListener3f;
			alGetListenerfvFn = => alGetListenerfv;
			alGetListeneriFn = => alGetListeneri;
			alGetListener3iFn = => alGetListener3i;
			alGetListenerivFn = => alGetListeneriv;
			alGenSourcesFn = => alGenSources;
			alDeleteSourcesFn = => alDeleteSources;
			alIsSourceFn = => alIsSource;
			alSourcefFn = => alSourcef;
			alSource3fFn = => alSource3f;
			alSourcefvFn = => alSourcefv;
			alSourceiFn = => alSourcei;
			alSource3iFn = => alSource3i;
			alSourceivFn = => alSourceiv;
			alGetSourcefFn = => alGetSourcef;
			alGetSource3fFn = => alGetSource3f;
			alGetSourcefvFn = => alGetSourcefv;
			alGetSourceiFn = => alGetSourcei;
			alGetSource3iFn = => alGetSource3i;
			alGetSourceivFn = => alGetSourceiv;
			alSourcePlayvFn = => alSourcePlayv;
			alSourceStopvFn = => alSourceStopv;
			alSourceRewindvFn = => alSourceRewindv;
			alSourcePausevFn = => alSourcePausev;
			alSourcePlayFn = => alSourcePlay;
			alSourceStopFn = => alSourceStop;
			alSourceRewindFn = => alSourceRewind;
			alSourcePauseFn = => alSourcePause;
			alSourceQueueBuffersFn = => alSourceQueueBuffers;
			alSourceUnqueueBuffersFn = => alSourceUnqueueBuffers;
			alGenBuffersFn = => alGenBuffers;
			alDeleteBuffersFn = => alDeleteBuffers;
			alIsBufferFn = => alIsBuffer;
			alBufferDataFn = => alBufferData;
			alBufferfFn = => alBufferf;
			alBuffer3fFn = => alBuffer3f;
			alBufferfvFn = => alBufferfv;
			alBufferiFn = => alBufferi;
			alBuffer3iFn = => alBuffer3i;
			alBufferivFn = => alBufferiv;
			alGetBufferfFn = => alGetBufferf;
			alGetBuffer3fFn = => alGetBuffer3f;
			alGetBufferfvFn = => alGetBufferfv;
			alGetBufferiFn = => alGetBufferi;
			alGetBuffer3iFn = => alGetBuffer3i;
			alGetBufferivFn = => alGetBufferiv;
#endif
		}

		static void InitFunctionPtrsDynamic(LoaderDelegate loader)
		{
			// ALC
			alcCreateContextFn = (.)loader("alalcCreateContext");
			alcMakeContextCurrentFn = (.)loader("alalcMakeContextCurrent");
			alcProcessContextFn = (.)loader("alalcProcessContext");
			alcSuspendContextFn = (.)loader("alalcSuspendContext");
			alcDestroyContextFn = (.)loader("alalcDestroyContext");
			alcGetCurrentContextFn = (.)loader("alalcGetCurrentContext");
			alcGetContextsDeviceFn = (.)loader("alalcGetContextsDevice");
			alcOpenDeviceFn = (.)loader("alalcOpenDevice");
			alcCloseDeviceFn = (.)loader("alalcCloseDevice");
			alcGetErrorFn = (.)loader("alalcGetError");
			alcIsExtensionPresentFn = (.)loader("alalcIsExtensionPresent");
			alcGetProcAddressFn = (.)loader("alalcGetProcAddress");
			alcGetEnumValueFn = (.)loader("alalcGetEnumValue");
			alcGetStringFn = (.)loader("alalcGetString");
			alcGetIntegervFn = (.)loader("alalcGetIntegerv");
			alcCaptureOpenDeviceFn = (.)loader("alalcCaptureOpenDevice");
			alcCaptureCloseDeviceFn = (.)loader("alalcCaptureCloseDevice");
			alcCaptureStartFn = (.)loader("alalcCaptureStart");
			alcCaptureStopFn = (.)loader("alalcCaptureStop");
			alcCaptureSamplesFn = (.)loader("alalcCaptureSamples");

			// AL
			alDopplerFactorFn = (.)loader("alDopplerFactor");
			alDopplerVelocityFn = (.)loader("alDopplerVelocity");
			alSpeedOfSoundFn = (.)loader("alSpeedOfSound");
			alDistanceModelFn = (.)loader("alDistanceModel");
			alEnableFn = (.)loader("alEnable");
			alDisableFn = (.)loader("alDisable");
			alIsEnabledFn = (.)loader("alIsEnabled");
			alGetStringFn = (.)loader("alGetString");
			alGetBooleanvFn = (.)loader("alGetBooleanv");
			alGetIntegervFn = (.)loader("alGetIntegerv");
			alGetFloatvFn = (.)loader("alGetFloatv");
			alGetDoublevFn = (.)loader("alGetDoublev");
			alGetBooleanFn = (.)loader("alGetBoolean");
			alGetIntegerFn = (.)loader("alGetInteger");
			alGetFloatFn = (.)loader("alGetFloat");
			alGetDoubleFn = (.)loader("alGetDouble");
			alGetErrorFn = (.)loader("alGetError");
			alIsExtensionPresentFn = (.)loader("alIsExtensionPresent");
			alGetProcAddressFn = (.)loader("alGetProcAddress");
			alGetEnumValueFn = (.)loader("alGetEnumValue");
			alListenerfFn = (.)loader("alListenerf");
			alListener3fFn = (.)loader("alListener3f");
			alListenerfvFn = (.)loader("alListenerfv");
			alListeneriFn = (.)loader("alListeneri");
			alListener3iFn = (.)loader("alListener3i");
			alListenerivFn = (.)loader("alListeneriv");
			alGetListenerfFn = (.)loader("alGetListenerf");
			alGetListener3fFn = (.)loader("alGetListener3f");
			alGetListenerfvFn = (.)loader("alGetListenerfv");
			alGetListeneriFn = (.)loader("alGetListeneri");
			alGetListener3iFn = (.)loader("alGetListener3i");
			alGetListenerivFn = (.)loader("alGetListeneriv");
			alGenSourcesFn = (.)loader("alGenSources");
			alDeleteSourcesFn = (.)loader("alDeleteSources");
			alIsSourceFn = (.)loader("alIsSource");
			alSourcefFn = (.)loader("alSourcef");
			alSource3fFn = (.)loader("alSource3f");
			alSourcefvFn = (.)loader("alSourcefv");
			alSourceiFn = (.)loader("alSourcei");
			alSource3iFn = (.)loader("alSource3i");
			alSourceivFn = (.)loader("alSourceiv");
			alGetSourcefFn = (.)loader("alGetSourcef");
			alGetSource3fFn = (.)loader("alGetSource3f");
			alGetSourcefvFn = (.)loader("alGetSourcefv");
			alGetSourceiFn = (.)loader("alGetSourcei");
			alGetSource3iFn = (.)loader("alGetSource3i");
			alGetSourceivFn = (.)loader("alGetSourceiv");
			alSourcePlayvFn = (.)loader("alSourcePlayv");
			alSourceStopvFn = (.)loader("alSourceStopv");
			alSourceRewindvFn = (.)loader("alSourceRewindv");
			alSourcePausevFn = (.)loader("alSourcePausev");
			alSourcePlayFn = (.)loader("alSourcePlay");
			alSourceStopFn = (.)loader("alSourceStop");
			alSourceRewindFn = (.)loader("alSourceRewind");
			alSourcePauseFn = (.)loader("alSourcePause");
			alSourceQueueBuffersFn = (.)loader("alSourceQueueBuffers");
			alSourceUnqueueBuffersFn = (.)loader("alSourceUnqueueBuffers");
			alGenBuffersFn = (.)loader("alGenBuffers");
			alDeleteBuffersFn = (.)loader("alDeleteBuffers");
			alIsBufferFn = (.)loader("alIsBuffer");
			alBufferDataFn = (.)loader("alBufferData");
			alBufferfFn = (.)loader("alBufferf");
			alBuffer3fFn = (.)loader("alBuffer3f");
			alBufferfvFn = (.)loader("alBufferfv");
			alBufferiFn = (.)loader("alBufferi");
			alBuffer3iFn = (.)loader("alBuffer3i");
			alBufferivFn = (.)loader("alBufferiv");
			alGetBufferfFn = (.)loader("alGetBufferf");
			alGetBuffer3fFn = (.)loader("alGetBuffer3f");
			alGetBufferfvFn = (.)loader("alGetBufferfv");
			alGetBufferiFn = (.)loader("alGetBufferi");
			alGetBuffer3iFn = (.)loader("alGetBuffer3i");
			alGetBufferivFn = (.)loader("alGetBufferiv");
		}

#if OPENAL_DYNLOAD
		public const bool IS_DYNLIB = true;
#else
		public const bool IS_DYNLIB = false;
#endif

		public static Result<ALCdevice*, InitError> InitAL(LoaderDelegate loader = null)
		{
			//Internal.LoadSharedLibrary("openal");
#if OPENAL_DYNLOAD
			Runtime.Assert(loader != null);
			InitFunctionPtrsDynamic(loader);
#else
			InitFunctionPtrsStatic();
#endif
			ALCcontext* ctx;
			ALCdevice* device = null;

			if (device == null)
				device = alcOpenDeviceFn(null);

			if (device == null)
				return .Err(.Device);

			ctx = alcCreateContextFn(device, null);
			if (ctx == null || alcMakeContextCurrentFn(ctx) == ALC_FALSE)
			{
				if(ctx != null)
					alcDestroyContextFn(ctx);

				alcCloseDeviceFn(device);
				return .Err(.Context);
			}
			return device;
		}


		public static void CloseAL()
		{
			ALCdevice *device;
			ALCcontext *ctx;

			ctx = alcGetCurrentContextFn();
			if(ctx == null)
			    return;

			device = alcGetContextsDeviceFn(ctx);

			alcMakeContextCurrentFn(null);
			alcDestroyContextFn(ctx);
			alcCloseDeviceFn(device);
		}
	}
}