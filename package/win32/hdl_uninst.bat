@echo off
echo HSP Docs Library �ɂ���č쐬���ꂽ�ݒ�t�@�C���A�f�[�^�t�@�C�����������܂��B
echo (�v���O�����{�� ����уh�L�������g�t�@�C���͍폜����܂���B)
pause

del "%TMP%\HDL\*.HTM"
rmdir "%TMP%\HDL"

del "%APPDATA%\Hot Soup Processor\hdl*.*"
del "%APPDATA%\Hot Soup Processor\hhw*.*"
rmdir "%APPDATA%\Hot Soup Processor"

reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION" /v hdl.exe /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_GPU_RENDERING" /v hdl.exe /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_USE_LEGACY_JSCRIPT" /v hdl.exe /f
