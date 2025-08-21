bm642romtool --base bm642.z64 "extract/"
armips bm642ws.s
xcopy "new_files" "extract/files" /S /E /Y
bm642romtool --build --base bm642.z64 "extract/" bm642ws.z64
