REM TODO(galexite): remove once llvm/llvm-project#83807 has been merged
python -c ^" ^
from pathlib import Path; ^
import re; ^
^
cmakelists = Path.cwd() / 'CMakeLists.txt'; ^
contents = cmakelists.read_text(encoding='utf-8'); ^
contents = re.sub(r'(cmake_minimum_required\([^\n]+\))', r'\1\ninclude(GNUInstallDirs)', contents, count=1); ^
cmakelists.write_text(contents, encoding='utf-8') ^
^"

if %ERRORLEVEL% neq 0 exit 1

mkdir build
cd build

cmake ^
  -G "Ninja" ^
  %CMAKE_ARGS% ^
  -DCMAKE_PREFIX_PATH=%PREFIX% ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_C_COMPILER=%CC% ^
  -DCMAKE_CXX_COMPILER=%CXX% ^
  ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build . -j%CPU_COUNT%
if %ERRORLEVEL% neq 0 exit 1

cmake --install . -v
if %ERRORLEVEL% neq 0 exit 1
