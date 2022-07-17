import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_social_network/models/facebook.dart';
import 'package:share_social_network/models/instagram.dart';
import 'package:share_social_network/models/more.dart';
import 'package:share_social_network/models/telegram.dart';
import 'package:share_social_network/models/twitter.dart';
import 'package:share_social_network/models/whatsapp.dart';
import 'package:share_social_network/share_social_network.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Bottom Sheet',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScreenshotController screenshotController = ScreenshotController();

  void shareSocialNetwork(BuildContext context) async {
    String imagePath = await screenshotController.capture().then((image) async {
      final directory = await getApplicationDocumentsDirectory();
      final file = await File('${directory.path}/temp.png').create();
      await file.writeAsBytes(image!);
      return file.path;
    });

    ShareSocialNetwork.show(
      context: context,
      backgroundColor: Colors.white,
      pillColor: Colors.black12,
      transitionDuration: Duration(milliseconds: 300),
      screenshotController: screenshotController,
      copyToClipboard: "https://www.figma.com/file/weeidl/Share...",
      telegram: Telegram(
        content: "Hello World \n https://github.com/weeidl",
      ),
      instagram: Instagram(
        backgroundBottomColor: "#ffffff",
        backgroundTopColor: "#ffffff",
        attributionURL: "https://deep-link-url",
        imagePath: imagePath,
      ),
      facebook: Facebook(
        backgroundTopColor: "#ffffff",
        attributionURL: "https://github.com/weeidl",
        backgroundBottomColor: "#000000",
        imagePath: imagePath,
        appId: "xxxxxxxxxxxxx",
      ),
      more: More(
        message: 'Hello World \n https://github.com/weeidl',
      ),
      twitter: Twitter(
        captionText: 'Share twitter',
        hashtags: ["hello", "world", "weeild", "artur"],
        url: 'https://github.com/weeidl',
        trailingText: " \nweeidl",
      ),
      whatsapp: Whatsapp(
        content: 'Hello World \n https://github.com/weeidl',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: ElevatedButton(
        onPressed: () {
          shareSocialNetwork(context);
        },
        child: Screenshot(
            controller: screenshotController, child: Text('Click it')),
      )),
    );
  }
}
