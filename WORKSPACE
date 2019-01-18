android_sdk_repository(name = "androidsdk")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_MAVEN_TAG = "0.0.5"
RULES_MAVEN_SHA = "ee8b989efdcc886aa86290b7db6d4c05b339ab739d38f34091d93d22ab8f7c4c"

http_archive(
    name = "rules_maven",
    strip_prefix = "rules_maven-%s" % RULES_MAVEN_TAG,
    sha256 = RULES_MAVEN_SHA,
    url = "https://github.com/jin/rules_maven/archive/%s.zip" % RULES_MAVEN_TAG,
)

load("@rules_maven//:defs.bzl", "maven_install")
load("//bazel/robolectric:android_all.bzl", "ROBOLECTRIC_ANDROID_ALL_JARS")
load("//:versions.bzl", "versions")

TEST_DEPS = [
    "org.robolectric:robolectric:" + versions["robolectric"],
    "org.assertj:assertj-core:" + versions["assertj"],
    "junit:junit:" + versions["junit"],
    "androidx.test:runner:" + versions["androidx.test"]["runner"],
    "androidx.test:rules:" + versions["androidx.test"]["rules"],
    "androidx.test.ext:junit:" + versions["androidx.test"]["ext"]["junit"],
    "androidx.test.espresso:espresso-core:" + versions["espresso"],
    "org.easymock:easymock:" + versions["easymock"],
    "org.powermock:powermock-core:" + versions["powermock"],
    "org.powermock:powermock-module-junit4:" + versions["powermock"],
    "org.powermock:powermock-api-easymock:" + versions["powermock"],
] + ROBOLECTRIC_ANDROID_ALL_JARS.values()

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
        "https://jcenter.bintray.com",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)

ATS_COMMIT = "6ec000c66e1daabb9cd0abd29c265550df5c11b1"

http_archive(
    name = "android_test_support",
    strip_prefix = "android-test-%s" % ATS_COMMIT,
    urls = ["https://github.com/jin/android-test/archive/%s.tar.gz" % ATS_COMMIT],
)

load("@android_test_support//:repo.bzl", "android_test_repositories")

android_test_repositories()
