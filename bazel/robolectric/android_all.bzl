ROBOLECTRIC_ANDROID_ALL_JARS = {
    28: "org.robolectric:android-all:9-robolectric-4913185-2",
    27: "org.robolectric:android-all:8.1.0-robolectric-4611349",
    26: "org.robolectric:android-all:8.0.0_r4-robolectric-r1",
    25: "org.robolectric:android-all:7.1.0_r7-robolectric-r1",
    24: "org.robolectric:android-all:7.0.0_r1-robolectric-r1",
    23: "org.robolectric:android-all:6.0.1_r3-robolectric-r1",
    22: "org.robolectric:android-all:5.1.1_r9-robolectric-r2",
    21: "org.robolectric:android-all:5.0.2_r3-robolectric-r0",
    19: "org.robolectric:android-all:4.4_r1-robolectric-r2",
    18: "org.robolectric:android-all:4.3_r2-robolectric-r1",
    17: "org.robolectric:android-all:4.2.2_r1.2-robolectric-r1",
    16: "org.robolectric:android-all:4.1.2_r1-robolectric-r1",
}

def get_android_all_jars(target_sdk_version):
    if target_sdk_version == 28:
        return [
            ROBOLECTRIC_ANDROID_ALL_JARS[28],
            ROBOLECTRIC_ANDROID_ALL_JARS[27],
        ]
    else:
        return [ROBOLECTRIC_ANDROID_ALL_JARS[target_sdk_version]]
