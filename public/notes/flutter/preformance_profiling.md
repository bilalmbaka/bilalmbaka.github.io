In modern rendering pipelines like Flutter, work is split between two primary threads:

[Filip Hracek Medium 1](https://blog.flutter.dev/performance-testing-of-flutter-apps-df7669bb7df7) <br>
[Filip Hracek Medium](https://blog.flutter.dev/raster-thread-performance-optimization-tips-e949b9dbcf06)


__UI Thread__: Where app logic (Dart) runs, widgets are built, and positioning is calculated.

__Raster Thread__: Executes the rendering engine (Skia or Impeller) to draw shadows, 
apply opacities, decode images, and communicate with the graphics card.

__Platform thread__:
The platform's main thread. Plugin code runs here. For more information, see the UIKit documentation for iOS, or the MainThread documentation for Android. This thread is not shown in the performance overlay.

__I/O thread__:
Performs expensive tasks (mostly I/O) that would otherwise block either the UI or raster threads. This thread is not shown in the performance overlay.
