import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ShareSocialNetwork {
  static const MethodChannel _channel = const MethodChannel('social_share');

  static Future<String?> shareInstagramStory(
    String imagePath, {
    String? backgroundTopColor,
    String? backgroundBottomColor,
    String? attributionURL,
    String? backgroundImagePath,
  }) async {
    Map<String, dynamic> args;
    if (Platform.isIOS) {
      if (backgroundImagePath == null) {
        args = <String, dynamic>{
          "stickerImage": imagePath,
          "backgroundTopColor": backgroundTopColor,
          "backgroundBottomColor": backgroundBottomColor,
          "attributionURL": attributionURL
        };
      } else {
        args = <String, dynamic>{
          "stickerImage": imagePath,
          "backgroundImage": backgroundImagePath,
          "backgroundTopColor": backgroundTopColor,
          "backgroundBottomColor": backgroundBottomColor,
          "attributionURL": attributionURL
        };
      }
    } else {
      final tempDir = await getTemporaryDirectory();

      File file = File(imagePath);
      Uint8List bytes = file.readAsBytesSync();
      var stickerData = bytes.buffer.asUint8List();
      String stickerAssetName = 'stickerAsset.png';
      final Uint8List stickerAssetAsList = stickerData;
      final stickerAssetPath = '${tempDir.path}/$stickerAssetName';
      file = await File(stickerAssetPath).create();
      file.writeAsBytesSync(stickerAssetAsList);

      String? backgroundAssetName;
      if (backgroundImagePath != null) {
        File backgroundImage = File(backgroundImagePath);
        Uint8List backgroundImageData = backgroundImage.readAsBytesSync();
        backgroundAssetName = 'backgroundAsset.jpg';
        final Uint8List backgroundAssetAsList = backgroundImageData;
        final backgroundAssetPath = '${tempDir.path}/$backgroundAssetName';
        File backFile = await File(backgroundAssetPath).create();
        backFile.writeAsBytesSync(backgroundAssetAsList);
      }

      args = <String, dynamic>{
        "stickerImage": stickerAssetName,
        "backgroundImage": backgroundAssetName,
        "backgroundTopColor": backgroundTopColor,
        "backgroundBottomColor": backgroundBottomColor,
        "attributionURL": attributionURL,
      };
    }
    final String? response = await _channel.invokeMethod(
      'shareInstagramStory',
      args,
    );
    return response;
  }
}
