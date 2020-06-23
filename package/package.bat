echo f | xcopy /f /y ..\playpass_as3\bin\playpass_as3_lib.swc
"7z.exe" e playpass_as3_lib.swc -odefault library.swf -aoa
echo f | xcopy /f /y default\library.swf android\
echo f | xcopy /f /y ..\playpass_android\app\build\intermediates\packaged-classes\release\classes.jar android\

adt -package -storetype pkcs12 -keystore cert.p12 -storepass ****** -target ane "com.gerantech.extensions.playpass.ane" extension.xml -swc playpass_as3_lib.swc -platform Android-ARM -C android . -platform Android-ARM64 -C android . -platform Android-x86 -C android . -platform default -C default . && echo f | xcopy /f /y com.gerantech.extensions.playpass.ane ..\playpass_test\exts\