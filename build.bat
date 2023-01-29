@IF NOT EXIST build mkdir build

@IF %ERRORLEVEL% NEQ 0 GOTO HADERROR

cd build

@IF %ERRORLEVEL% NEQ 0 GOTO HADERROR

cmake ..
REM cmake --build . --config Debug
cmake --build . --config Release

:SUCCESS
@echo SUCCESS!
@popd
@exit /b 0

:HADERROR
@echo =================FAILED=================
@popd
@exit /b 1