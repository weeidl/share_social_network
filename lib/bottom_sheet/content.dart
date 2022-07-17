import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_social_network/bottom_sheet/social_network_buttons.dart';
import 'package:share_social_network/models/facebook.dart';
import 'package:share_social_network/models/instagram.dart';
import 'package:share_social_network/models/more.dart';
import 'package:share_social_network/models/telegram.dart';
import 'package:share_social_network/models/twitter.dart';
import 'package:share_social_network/models/whatsapp.dart';
import 'package:share_social_network/share/social_share.dart';

class Content extends StatefulWidget {
  final Telegram? telegramShare;
  final Instagram? instagramShare;
  final Facebook? facebookShare;
  final Whatsapp? whatsappShare;
  final Twitter? twitterShare;
  final More? moreShare;
  final String? copyToClipboard;
  final ScreenshotController? screenshotController;
  final bool? showTextShare;
  const Content(
      {Key? key,
      this.telegramShare,
      this.instagramShare,
      this.facebookShare,
      this.whatsappShare,
      this.twitterShare,
      this.screenshotController,
      this.moreShare,
      this.showTextShare = true,
      this.copyToClipboard})
      : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

String? showTextShareEdit;

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    bool languageCodePlatform(BuildContext context) {
      final platformLanguageCode = Localizations.localeOf(context).toString();
      if (platformLanguageCode == 'en') {
        return true;
      } else {
        return false;
      }
    }

    print('=-=-=- ${languageCodePlatform(context)}');
    return Column(
      children: [
        if (widget.showTextShare == true)
          Text(
            languageCodePlatform(context) ? 'Поделиться' : 'Share',
            style: TextStyle(
                color: Color(0xFF3D5A80),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            if (widget.instagramShare != null)
              SocialNetworkButtons(
                name: languageCodePlatform(context)
                    ? 'Instagram\nСторис'
                    : 'Instagram\nStory',
                image:
                    'https://raw.githubusercontent.com/weeidl/share_social_network/0ed59c7360942a7450d5fa09ce49a6f0e0d6a9e3/image/instagram.svg',
                onTap: () async => SocialShare.shareInstagramStory(
                  widget.instagramShare!.imagePath,
                  backgroundTopColor: widget.instagramShare?.backgroundTopColor,
                  backgroundBottomColor:
                      widget.instagramShare?.backgroundBottomColor,
                  attributionURL: widget.instagramShare?.attributionURL,
                  backgroundImagePath:
                      widget.instagramShare?.backgroundImagePath,
                ).then((data) {
                  print(data);
                }),
              ),
            if (widget.telegramShare != null)
              SocialNetworkButtons(
                name: 'Telegram',
                image:
                    'https://raw.githubusercontent.com/weeidl/share_social_network/0ed59c7360942a7450d5fa09ce49a6f0e0d6a9e3/image/telegram.svg',
                onTap: () => SocialShare.shareTelegram(
                  widget.telegramShare!.content,
                ).then((data) {
                  print(data);
                }),
              ),
            if (widget.facebookShare != null)
              SocialNetworkButtons(
                name: languageCodePlatform(context)
                    ? 'Facebook\nСторис'
                    : 'Facebook\nStory',
                image:
                    'https://raw.githubusercontent.com/weeidl/share_social_network/0ed59c7360942a7450d5fa09ce49a6f0e0d6a9e3/image/facebook.svg',
                onTap: () async => await widget.screenshotController
                    ?.capture()
                    .then((image) async {
                  final directory = await getApplicationDocumentsDirectory();
                  final file =
                      await File('${directory.path}/temp.png').create();
                  await file.writeAsBytes(image!);
                  Platform.isAndroid
                      ? SocialShare.shareFacebookStory(
                          widget.facebookShare!.imagePath,
                          widget.facebookShare!.backgroundTopColor,
                          widget.facebookShare!.backgroundBottomColor,
                          widget.facebookShare!.attributionURL,
                          appId: widget.facebookShare?.appId,
                        ).then((data) {
                          print(data);
                        })
                      : SocialShare.shareFacebookStory(
                          widget.facebookShare!.imagePath,
                          widget.facebookShare!.backgroundTopColor,
                          widget.facebookShare!.backgroundBottomColor,
                          widget.facebookShare!.attributionURL,
                        ).then((data) {
                          print(data);
                        });
                }),
              ),
            if (widget.whatsappShare != null)
              SocialNetworkButtons(
                name: 'Whatsapp',
                image:
                    'https://raw.githubusercontent.com/weeidl/share_social_network/0ed59c7360942a7450d5fa09ce49a6f0e0d6a9e3/image/whatsapp.svg',
                onTap: () => SocialShare.shareWhatsapp(
                  widget.whatsappShare!.content,
                ).then((data) {
                  print(data);
                }),
              ),
            if (widget.twitterShare != null)
              SocialNetworkButtons(
                name: 'Twitter',
                image:
                    'https://raw.githubusercontent.com/weeidl/share_social_network/0ed59c7360942a7450d5fa09ce49a6f0e0d6a9e3/image/twitter.svg',
                onTap: () => SocialShare.shareTwitter(
                  widget.twitterShare!.captionText,
                  hashtags: widget.twitterShare?.hashtags,
                  url: widget.twitterShare?.url,
                  trailingText: widget.twitterShare?.trailingText,
                ).then((data) {
                  print(data);
                }),
              ),
            if (widget.moreShare != null)
              SocialNetworkButtons(
                name: languageCodePlatform(context)
                    ? 'Другие приложения'
                    : 'Share Options',
                image:
                    'https://raw.githubusercontent.com/weeidl/share_social_network/0ed59c7360942a7450d5fa09ce49a6f0e0d6a9e3/image/share.svg',
                onTap: () async => await widget.screenshotController
                    ?.capture()
                    .then((image) async {
                  SocialShare.shareOptions(widget.moreShare!.message)
                      .then((data) {
                    print(data);
                  });
                }),
              ),
          ],
        ),
        SizedBox(height: 42),
        Text(
          languageCodePlatform(context)
              ? 'Или поделитесь ссылкой'
              : 'Or share with link',
          style: TextStyle(
              color: Color(0xFF3D5A80).withOpacity(0.5), fontSize: 16),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 54,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFF9D9D9D).withOpacity(0.15),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showTextShareEdit = languageCodePlatform(context)
                          ? 'Скопирован'
                          : 'Copied';
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        showTextShareEdit = widget.copyToClipboard!;
                      });
                    });
                    SocialShare.copyToClipboard(
                      widget.copyToClipboard,
                    ).then((data) {
                      print(data);
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        showTextShareEdit ?? widget.copyToClipboard ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xFF3D5A80).withOpacity(0.5)),
                      ),
                      Spacer(),
                      SvgPicture.network(
                        'https://raw.githubusercontent.com/weeidl/share_social_network/0ed59c7360942a7450d5fa09ce49a6f0e0d6a9e3/image/copy.svg',
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
