load("@rules_maven//:defs.bzl", "artifact")
load("//:versions.bzl", "versions")

android_instrumentation_test(
    name = "main_activity_test",
    tags = ["manual"],  # Linux only, so this excludes it from //...
    target_device = "@android_test_support//tools/android/emulated_devices/generic_phone:android_23_x86_qemu2",
    test_app = ":template_test_app",
)

android_binary(
    name = "template_test_app",
    srcs = ["java/burrows/apps/example/template/instrumentation/MainActivityTest.java"],
    custom_package = "burrows.apps.example.template.instrumentation",
    instruments = "//src/main:template_app",
    manifest = "AndroidManifest.xml",
    deps = [
        artifact("androidx.test:runner:" + versions["androidx.test"]["runner"]),
        artifact("androidx.test:rules:" + versions["androidx.test"]["runner"]),
        artifact("androidx.annotation:annotation:" + versions["annotation"]),
        artifact("androidx.test.espresso:espresso-core:" + versions["espresso"]),
        artifact("androidx.test.ext:junit:" + versions["androidx.test"]["ext"]["junit"]),
        artifact("junit:junit:" + versions["junit"]),
        "//src/main:template_app_lib",
    ],
)
