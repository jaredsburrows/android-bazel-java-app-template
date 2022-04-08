load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")
load("//:versions.bzl", "versions")

android_sdk_repository(name = "androidsdk", build_tools_version = "30.0.3") # resolve dx error

ATS_TAG = "1edfdab3134a7f01b37afabd3eebfd2c5bb05151"
ATS_SHA256 = "dcd1ff76aef1a26329d77863972780c8fe1fc8ff625747342239f0489c2837ec"
RULES_MAVEN_TAG = "0.0.5"
RULES_MAVEN_SHA = "ee8b989efdcc886aa86290b7db6d4c05b339ab739d38f34091d93d22ab8f7c4c"
RULES_JVM_EXTERNAL_TAG = "3.1"
RULES_JVM_EXTERNAL_SHA = "e246373de2353f3d34d35814947aa8b7d0dd1a58c2f7a6c41cfeaff3007c2d14"

http_archive(
    name = "build_bazel_rules_android",
    urls = ["https://github.com/bazelbuild/rules_android/archive/v0.1.1.zip"],
    sha256 = "cd06d15dd8bb59926e4d65f9003bfc20f9da4b2519985c27e190cddc8b7a7806",
    strip_prefix = "rules_android-0.1.1",
)

http_archive(
    name = "android_test_support",
    sha256 = ATS_SHA256,
    strip_prefix = "android-test-%s" % ATS_TAG,
    urls = ["https://github.com/android/android-test/archive/%s.tar.gz" % ATS_TAG],
)

load("@android_test_support//:repo.bzl", "android_test_repositories")

android_test_repositories()

http_archive(
    name = "robolectric",
    urls = ["https://github.com/robolectric/robolectric-bazel/archive/4.7.3.tar.gz"],
    strip_prefix = "robolectric-bazel-4.7.3",
)

load("@robolectric//bazel:robolectric.bzl", "robolectric_repositories")

robolectric_repositories()

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

TEST_DEPS = [
    "org.robolectric:robolectric:" + versions["robolectric"],
    "org.assertj:assertj-core:" + versions["assertj"],
    "junit:junit:" + versions["junit"],
    "androidx.test:annotation:" + versions["androidx.test"]["annotation"],
    "androidx.test:core:" + versions["androidx.test"]["core"],
    "androidx.test:runner:" + versions["androidx.test"]["runner"],
    "androidx.test:rules:" + versions["androidx.test"]["rules"],
    "androidx.test.ext:junit:" + versions["androidx.test"]["ext"]["junit"],
    "androidx.test.espresso:espresso-core:" + versions["espresso"],
    "org.easymock:easymock:" + versions["easymock"],
    "org.powermock:powermock-core:" + versions["powermock"],
    "org.powermock:powermock-module-junit4:" + versions["powermock"],
    "org.powermock:powermock-api-easymock:" + versions["powermock"],
]

maven_install(
    artifacts = [
        "com.google.android.material:material:" + versions["material"],
        "androidx.cardview:cardview:" + versions["cardview"],
        "com.google.android.gms:play-services-ads:" + versions["gps"],
        "com.google.android.gms:play-services-basement:" + versions["gps"],
        "com.google.android.gms:play-services-base:" + versions["gps"],
        "androidx.annotation:annotation:" + versions["annotation"],
    ] + TEST_DEPS,
    repositories = [
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

