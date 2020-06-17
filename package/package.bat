echo f | xcopy /f /y ..\playpass_android\app\build\intermediates\packaged-classes\release\classes.jar android\

REM echo f | xcopy /f /y  C:\_projects\contributions\playpass-android\package\android\classes.jar
adt -package -storetype pkcs12 -keystore cert.p12 -storepass ****** -target ane "com.gerantech.extensions.playpass.ane" extension.xml -swc android_extension_as3_lib.swc -platform Android-ARM -C android . -platform Android-ARM64 -C android . -platform Android-x86 -C android . -platform default -C default . && echo f | xcopy /f /y com.gerantech.extensions.playpass.ane ..\playpass_test\exts\
