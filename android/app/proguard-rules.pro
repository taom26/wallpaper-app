-keep class androidx.lifecycle.DefaultLifecycleObserver
-keep class androidx.lifecycle.DefaultLifecycleObserver
-keepclassmembers class * {
    @androidx.lifecycle.OnLifecycleEvent *;
}

# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
