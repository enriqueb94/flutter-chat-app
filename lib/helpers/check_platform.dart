import 'dart:io';

bool comprobarPlataforma() {
  if (Platform.isAndroid) {
    return true;
  } else {
    return false;
  }
}
