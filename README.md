# bookmark_with_image_flutter

An experimental project to port [bookmark-with-image](https://github.com/unhurried/bookmark-with-image) v2 (Electron + Vue.js) to Flutter.

## Development

```shell
# Run the application in degub mode.
#
# Place sqlite3.dll in the top directory in advance.
# https://www.sqlite.org/download.html
flutter run -d windows

# Build the application into an .ext file.
#
# The package will be created in build\windows\runner\Release
# Place sqliete3.dll in the directory as the .exe file before running.
flutter build windows
```
