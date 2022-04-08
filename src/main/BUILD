load("@rules_jvm_external//:defs.bzl", "artifact")
load("//:versions.bzl", "versions", "targetSdkVersion")
load("@build_bazel_rules_android//android:rules.bzl", "android_binary", "android_library")

android_binary(
    name = "template_app",
    custom_package = "burrows.apps.example.template",
    manifest = "AndroidManifest.xml",
    manifest_values = {
        "targetSdkVersion": str(targetSdkVersion),
    },
    visibility = ["//src/androidTest:__subpackages__"],
    deps = ["//src/main:template_app_lib"],
)

android_library(
    name = "template_app_lib",
    srcs = glob(["java/**/*.java"]),
    custom_package = "burrows.apps.example.template",
    manifest = "java/AndroidManifest.xml",
    resource_files = glob(["res/**/*"]),
    visibility = ["//src:__subpackages__"],
    deps = [":external_deps"],
)

android_library(
    name = "external_deps",
    exports = [
        artifact("com.google.android.material:material:" + versions["material"]),
        artifact("com.google.android.gms:play-services-ads:" + versions["gps"]),
        artifact("com.google.android.gms:play-services-ads-lite:" + versions["gps"]),
        artifact("com.google.android.gms:play-services-basement:" + versions["gps"]),
        artifact("com.google.android.gms:play-services-base:" + versions["gps"]),
        artifact("androidx.annotation:annotation:" + versions["annotation"]),
        artifact("androidx.cardview:cardview:" + versions["cardview"]),
        artifact("androidx.appcompat:appcompat:" + versions["material"]),
        artifact("androidx.recyclerview:recyclerview:" + versions["material"]),
        artifact("androidx.fragment:fragment:" + versions["material"]),
    ],
)
