load("@rules_maven//:defs.bzl", "artifact")
load("//bazel/robolectric:android_all.bzl", "get_android_all_jars")
load("//:versions.bzl", "versions", "targetSdkVersion")

ANDROID_ALL_JARS = [artifact(jar) for jar in get_android_all_jars(targetSdkVersion)]

java_library(
    name = "robolectric_and_android_all",
    data = [":robolectric-deps.properties"],
    exports = [
        artifact("org.robolectric:robolectric:" + versions["robolectric"]),
    ] + ANDROID_ALL_JARS,
    visibility = ["//src/test:__subpackages__"],
)

filegroup(
    name = "android_all_jars",
    srcs = ANDROID_ALL_JARS,
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

