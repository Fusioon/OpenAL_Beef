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

#endregion SOURCE

		public enum InitError
		{
			Device,
			Context,
		}

		public static Result<ALCdevice*, InitError> InitAL(char8*** argv, int32* argc)
		{
			ALCcontext* ctx;
			ALCdevice* device = null;

			if (device == null)
				device = alcOpenDevice(null);

			if (device == null)
				return .Err(.Device);

			ctx = alcCreateContext(device, null);
			if (ctx == null || alcMakeContextCurrent(ctx) == ALC_FALSE)
			{
				if(ctx != null)
					alcDestroyContext(ctx);

				alcCloseDevice(device);
				return .Err(.Context);
			}
			return device;
		}


		public static void CloseAL()
		{
			ALCdevice *device;
			ALCcontext *ctx;

			ctx = alcGetCurrentContext();
			if(ctx == null)
			    return;

			device = alcGetContextsDevice(ctx);

			alcMakeContextCurrent(null);
			alcDestroyContext(ctx);
			alcCloseDevice(device);
		}
	}
}