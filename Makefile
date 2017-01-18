./build_ios/libhelloworld.xcodeproj: libhelloworld.gyp ./deps/djinni/support-lib/support_lib.gyp ./djinni/helloworld.djinni
	sh ./run_djinni.sh
	deps/gyp/gyp --depth=. -f xcode -DOS=ios --generator-output ./build_ios -Ideps/djinni/common.gypi ./libhelloworld.gyp --root-target=libhelloworld_objc

ios: ./build_ios/libhelloworld.xcodeproj
	xcodebuild -workspace ios_project/NativeDemo.xcworkspace \
		   -scheme NativeDemo \
		   -configuration 'Debug' \
		   -sdk iphonesimulator


./build_android/out/Debug/CMakeLists.txt: libhelloworld.gyp ./deps/djinni/support-lib/support_lib.gyp ./djinni/helloworld.djinni
	sh ./run_djinni.sh
	deps/gyp/gyp --depth=. -f cmake -DOS=android --generator-output ./build_android -Ideps/djinni/common.gypi ./libhelloworld.gyp --root-target=libhelloworld_jni
	ex +g/LIBRARY_OUTPUT_DIRECTORY/d -cwq ./build_android/out/Debug/CMakeLists.txt

android: ./build_android/out/Debug/CMakeLists.txt
	cd android_project/NativeDemo/ && ./gradlew app:assembleDebug
	@echo "Apks produced at:"
	@python deps/djinni/example/glob.py ./ '*.apk'

clean:
	-rm -rf build/
	-rm -rf deps/build/
	-rm -rf build_mac/
	-rm -rf build_ios/
	-rm -rf build_android/
	-rm -rf obj/
	-rm -rf libs/
	-rm -rf djinni-output-temp/