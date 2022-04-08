# Android Bazel Java App Template 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Build](https://github.com/jaredsburrows/android-bazel-java-app-template/actions/workflows/build.yml/badge.svg)](https://github.com/jaredsburrows/android-bazel-java-app-template/actions/workflows/build.yml)
[![Twitter Follow](https://img.shields.io/twitter/follow/jaredsburrows.svg?style=social)](https://twitter.com/jaredsburrows)

Bazel + Android Studio + Robolectric + Espresso + Mockito + EasyMock/PowerMock

## Technologies used:
#### Build Tools:
| Name                                                                                     | Description          |
|------------------------------------------------------------------------------------------|----------------------|
| [Bazel](https://bazel.build)                                                             | Bazel build system   |
| [Android SDK](http://developer.android.com/tools/revisions/platforms.html#5.1)           | Official SDK         |
| [Android SDK Build Tools](http://developer.android.com/tools/revisions/build-tools.html) | Official Build Tools |
| [Android Studio](http://tools.android.com/recent) or                                     | Official IDE         |
| [Intellij](https://www.jetbrains.com/idea/download/)                                     | Intellij IDE         |

#### Testing Frameworks:
| Name                                                                  | Description               |
|-----------------------------------------------------------------------|---------------------------|
| [Espresso](https://google.github.io/android-testing-support-library/) | Instrumentation Framework |
| [Robolectric](https://github.com/robolectric/robolectric)             | Unit Testing Framework    |

# Getting Started:
## `Android Studio` or `Intellij` Support (Simple):
- **Import/Open this project with Android Studio/Intellij**
  1. Install the [Bazel plugin](https://ij.bazel.build/).
  1. In the project selection dialog, click "Import Bazel Project".
  1. For the project view, select "Create from scratch".
  1. Click "Finish".

## Building and Running

This project builds with [Bazel](https://bazel.build), Bazel's [Android
rules](https://docs.bazel.build/versions/master/be/android.html), and the
Android Build [tools](http://tools.android.com/tech-docs/new-build-system).

**Build the APK:**

    $ bazel build //src/main:template_app

**Install the APK:**

    $ bazel mobile-install //src/main:template_app
    
or:

    $ bazel build //src/main:template_app && adb install bazel-bin/src/main/template_app.apk

**Run the App:**

    $ bazel mobile-install //src/main:template_app --start_app

> *Note:* Expect the first build to take a few minutes, depending on your
> machine, because Bazel's cache is clean. After Bazel downloads and builds the
> app once, subsequent builds will be much faster.

## Testing

**Running the Unit Tests:**

The [Junit](http://junit.org/junit4/) and
[Robolectric](https://github.com/robolectric/robolectric) tests run on the JVM,
no need for emulators or real devices.

    $ bazel test //src/test:all

**Run a single unit test (`android_local_test`):**

    $ bazel test //src/test:play_services_utils_test

**Get the list of all `android_local_test` targets:**

    $ bazel query 'kind(android_local_test, //src/test/...)'

**Running the Instrumentation Tests:**

The
[Espresso](https://developer.android.com/training/testing/ui-testing/espresso-testing.html)
instrumentation tests run on the device. There is no need to launch an emulator,
Bazel will do it automatically as part of the instrumentation test.

This is currently only supported on Linux.

    $ bazel test //src/androidTest:main_activity_test
    
Read the [Bazel docs
here](https://docs.bazel.build/versions/master/android-instrumentation-test.html).

