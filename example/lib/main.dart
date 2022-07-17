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
      copyToClipboard: "https://github.com/weeidl/share_social...",
      telegram: Telegram(
        content: "Hello World \n https://github.com/weeidl",
      ),
      instagram: Instagram(
        backgroundBottomColor: "#FF7391",
        backgroundTopColor: "#591E78",
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

  bool test = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned(
            top: 42,
            left: 16,
            right: 0,
            child: Text(
              'Share Social\nNetwork',
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 52,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://media-exp2.licdn.com/dms/image/C4D03AQF-VBhIrilqaw/profile-displayphoto-shrink_400_400/0/1647000614856?e=1663804800&v=beta&t=iaxDxCoMb0k_cJSqxACrgIv8zlgNKOPJUQSaKEsOTUs'),
                ),
              ),
              height: 52,
              width: 52,
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Screenshot(
              controller: screenshotController,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://phonoteka.org/uploads/posts/2021-06/1624617488_16-phonoteka_org-p-oboi-priroda-temnie-krasivo-16.jpg'),
                    ),
                  ),
                  height: 400,
                  width: MediaQuery.of(context).size.width - 34,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 16,
                        top: 16,
                        child: Text(
                          'WEEIDL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            print(test);
                            setState(() {
                              test = false;
                            });
                            shareSocialNetwork(context);
                          },
                          child: Container(
                            height: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            width: double.infinity,
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (test == true) ? 'SHARE' : 'Click to go',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Image.network(
                                    'http://cdn.onlinewebfonts.com/svg/img_168616.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 580,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://c.wallhere.com/photos/7a/f0/landscape_clouds-97686.jpg!d'),
                  ),
                ),
                height: 400,
                width: MediaQuery.of(context).size.width - 34,
                child: Stack(
                  children: [
                    Positioned(
                      left: 16,
                      top: 16,
                      child: Text(
                        'PROFILE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        height: 64,
                        color: Colors.white.withOpacity(0.5),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'ПОДЕЛИТЬСЯ',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Center(
      //     child: ElevatedButton(
      //   onPressed: () {
      //     shareSocialNetwork(context);
      //   },
      //   child: Screenshot(
      //     controller: screenshotController,
      //     child: ContentWidgets(),
      //   ),
      // )),
    );
  }
}
