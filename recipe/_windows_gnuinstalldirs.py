from pathlib import Path
import re

"""Workaround for https://github.com/llvm/llvm-project/issues/83802"""

cmakelists = Path.cwd() / "CMakeLists.txt"
contents = cmakelists.read_text(encoding="utf-8")
re.sub(r"(cmake_minimum_required\([^\n]\))", r"\1\ninclude(GNUInstallDirs)", contents, count=1)
cmakelists.write_text(contents, encoding="utf-8")
