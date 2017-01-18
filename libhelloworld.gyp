{
    "targets": [
        {
            "target_name": "libhelloworld_jni",
            "type": "shared_library",
            "dependencies": [
              "./deps/djinni/support-lib/support_lib.gyp:djinni_jni",
            ],
            "ldflags": [ "-llog", "-Wl,--build-id,--gc-sections,--exclude-libs,ALL" ],
            "sources": [
              "./deps/djinni/support-lib/jni/djinni_main.cpp",
              "<!@(python glob.py generated-src/jni   '*.cpp' '*.hpp')",
              "<!@(python glob.py generated-src/cpp   '*.cpp' '*.hpp')",
              "<!@(python glob.py src '*.cpp' '*.hpp')",
            ],
            "include_dirs": [
              "generated-src/jni",
              "generated-src/cpp",
              "src",
            ],
        },
        {
            "target_name": "libhelloworld_objc",
            "type": 'static_library',
            "dependencies": [
              "./deps/djinni/support-lib/support_lib.gyp:djinni_objc",
            ],
            'direct_dependent_settings': {

            },
            "sources": [
              "<!@(python glob.py generated-src/objc  '*.cpp' '*.mm' '*.m' '*.h' '*.hpp')",
              "<!@(python glob.py generated-src/cpp   '*.cpp' '*.hpp')",
              "<!@(python glob.py src '*.cpp' '*.hpp')",
            ],
            "include_dirs": [
              "generated-src/objc",
              "generated-src/cpp",
              "src",
            ],
        },
    ],
}