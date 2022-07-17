import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_social_network/bottom_sheet/content.dart';
import 'package:share_social_network/bottom_sheet/pill_gesture.dart';
import 'package:share_social_network/models/facebook.dart';
import 'package:share_social_network/models/instagram.dart';
import 'package:share_social_network/models/more.dart';
import 'package:share_social_network/models/telegram.dart';
import 'package:share_social_network/models/twitter.dart';
import 'package:share_social_network/models/whatsapp.dart';

class ShareSocialNetwork extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color pillColor;
  final Telegram? telegram;
  final Instagram? instagram;
  final Facebook? facebook;
  final More? more;
  final Twitter? twitter;
  final Whatsapp? whatsapp;
  final String? copyToClipboard;
  final bool? showTextShare;
  final ScreenshotController? screenshotController;

  ShareSocialNetwork({
    required this.child,
    required this.pillColor,
    this.backgroundColor,
    this.telegram,
    this.instagram,
    this.facebook,
    this.more,
    this.twitter,
    this.whatsapp,
    this.screenshotController,
    this.copyToClipboard,
    this.showTextShare,
  });

  static show<T>({
    required BuildContext context,
    Color? barrierColor,
    bool barrierDismissible = true,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Color? pillColor,
    Telegram? telegram,
    Color? backgroundColor,
    Instagram? instagram,
    Facebook? facebook,
    More? more,
    Twitter? twitter,
    Whatsapp? whatsapp,
    bool? showTextShare = true,
    String? copyToClipboard,
    ScreenshotController? screenshotController,
  }) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
      barrierDismissible: barrierDismissible,
      barrierLabel: "Dismiss",
      transitionDuration: transitionDuration,
      transitionBuilder: (context, animation1, animation2, widget) {
        final curvedValue = Curves.easeInOut.transform(animation1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
          child: Opacity(
            opacity: animation1.value,
            child: ShareSocialNetwork(
              child: Content(
                telegramShare: telegram,
                instagramShare: instagram,
                facebookShare: facebook,
                twitterShare: twitter,
                whatsappShare: whatsapp,
                moreShare: more,
                copyToClipboard: copyToClipboard,
                showTextShare: showTextShare,
                screenshotController: screenshotController,
              ),
              pillColor: pillColor ?? Colors.white,
              backgroundColor: backgroundColor ?? Colors.black,
            ),
          ),
        );
      },
    );
  }

  @override
  _ShareSocialNetworkState createState() => _ShareSocialNetworkState();
}

class _ShareSocialNetworkState extends State<ShareSocialNetwork> {
  var _initialPosition = 0.0;
  var _currentPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 100,
      width: 100,
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets +
            EdgeInsets.only(top: deviceHeight / 3.0 + _currentPosition),
        duration: Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: MediaQuery.removeViewInsets(
          removeLeft: true,
          removeTop: true,
          removeRight: true,
          removeBottom: true,
          context: context,
          child: Center(
            child: Container(
              width: deviceWidth,
              height: deviceHeight / 1.5,
              child: Material(
                color: widget.backgroundColor ??
                    Theme.of(context).dialogBackgroundColor,
                elevation: 24.0,
                type: MaterialType.card,
                child: Column(
                  children: <Widget>[
                    PillGesture(
                      pillColor: widget.pillColor,
                      onVerticalDragStart: _onVerticalDragStart,
                      onVerticalDragEnd: _onVerticalDragEnd,
                      onVerticalDragUpdate: _onVerticalDragUpdate,
                    ),
                    widget.child,
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onVerticalDragStart(DragStartDetails drag) {
    setState(() {
      _initialPosition = drag.globalPosition.dy;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails drag) {
    setState(() {
      final temp = _currentPosition;
      _currentPosition = drag.globalPosition.dy - _initialPosition;
      if (_currentPosition < 0) {
        _currentPosition = temp;
      }
    });
  }

  void _onVerticalDragEnd(DragEndDetails drag) {
    if (_currentPosition > 100.0) {
      Navigator.pop(context);
      return;
    }
    setState(() {
      _currentPosition = 0.0;
    });
  }
}
