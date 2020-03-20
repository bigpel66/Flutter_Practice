import 'dart:io';
import 'package:image/image.dart';

class Converter {
  const Converter();
  
  String convertImage(FileSystemEntity selectedFile, String format) {
    final imageToByte = (selectedFile as File).readAsBytesSync();
    final rawImage = decodeImage(imageToByte);

    var newImage;
    var newPath;

    if (format == 'jpg') {
      newImage = encodeJpg(rawImage);
    } else if (format == 'png') {
      newImage = encodePng(rawImage);
    } else {
      print('Unsupported file type');
    }

    newPath = replaceExtension(selectedFile.path, format);

    File(newPath).writeAsBytesSync(newImage);

    return newPath;
  }

  String replaceExtension(String path, String newExtension) {
    return path.replaceAll(RegExp(r'(png|jpg|jpeg)'), newExtension);
  }
}
