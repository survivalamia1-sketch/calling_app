# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# WebRTC
-keep class org.webrtc.** { *; }
-keep class com.cloudwebrtc.webrtc.** { *; }
-dontwarn org.webrtc.**

# WebRTC JNI
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep WebRTC peer connection and related classes
-keep class org.webrtc.PeerConnection { *; }
-keep class org.webrtc.PeerConnectionFactory { *; }
-keep class org.webrtc.MediaStream { *; }
-keep class org.webrtc.VideoTrack { *; }
-keep class org.webrtc.AudioTrack { *; }
-keep class org.webrtc.DataChannel { *; }
-keep class org.webrtc.IceCandidate { *; }
-keep class org.webrtc.SessionDescription { *; }
-keep class org.webrtc.MediaConstraints { *; }
-keep class org.webrtc.VideoCapturer { *; }
-keep class org.webrtc.CameraVideoCapturer { *; }
-keep class org.webrtc.Camera1Enumerator { *; }
-keep class org.webrtc.Camera2Enumerator { *; }
-keep class org.webrtc.VideoRenderer { *; }
-keep class org.webrtc.SurfaceViewRenderer { *; }
-keep class org.webrtc.EglBase { *; }
-keep class org.webrtc.EglBase$Context { *; }
-keep class org.webrtc.EglRenderer { *; }
-keep class org.webrtc.RendererCommon { *; }
-keep class org.webrtc.GlRectDrawer { *; }
-keep class org.webrtc.VideoCodecInfo { *; }
-keep class org.webrtc.RtpReceiver { *; }
-keep class org.webrtc.RtpSender { *; }
-keep class org.webrtc.RtpTransceiver { *; }

# Keep all interfaces
-keep interface org.webrtc.** { *; }

# Keep all enums
-keepclassmembers enum org.webrtc.** {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Gson (for JSON serialization)
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Keep model classes (adjust package names as needed)
-keep class com.yourcompany.app.models.** { *; }
-keep class com.yourcompany.app.data.** { *; }

# Preserve line numbers for debugging
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# Remove logging in release builds
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

# Keep crash reporting
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
