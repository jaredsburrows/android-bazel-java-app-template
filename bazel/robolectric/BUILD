load("@rules_maven//:defs.bzl", "artifact")
load("//bazel/robolectric:android_all.bzl", "ROBOLECTRIC_ANDROID_ALL_JARS")
load("//:versions.bzl", "versions", "targetSdkVersion")

ANDROID_ALL_JAR = artifact(ROBOLECTRIC_ANDROID_ALL_JARS[targetSdkVersion])

java_library(
    name = "robolectric_and_android_all",
    data = [":robolectric-deps.properties"],
    exports = [
        artifact("org.robolectric:robolectric:" + versions["robolectric"]),
        ANDROID_ALL_JAR
    ],
    visibility = ["//src/test:__subpackages__"],
)

filegroup(
    name = "android_all_jars",
    srcs = [ANDROID_ALL_JAR],
)

genrule(
    name = "gen_properties",
    srcs = [":android_all_jars"],
    outs = ["robolectric-deps.properties"],
    cmd = "$(location :gen_deps) $(locations :android_all_jars) > $@",
    tools = [":gen_deps"],
)

py_binary(
    name = "gen_deps",
    srcs = ["gen_deps.py"],
)

