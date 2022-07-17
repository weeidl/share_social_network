# Share Social Network
 
[![pub package](https://img.shields.io/pub/v/adaptive_action_sheet.svg)](https://pub.dev/packages/custom_bottom_sheet)


A ready-made platform that provides a wide range of ways to share, you will need to provide access directly to certain popular applications or just share using the built-in default sharing.

## Platforms

Works on both platforms `Android` and `iOS`

| ![Image](https://github.com/weeidl/share_social_network/blob/master/image/instagram-weeidl.gif) | ![Image](https://github.com/weeidl/share_social_network/blob/master/image/image.png) | ![Image](https://github.com/weeidl/share_social_network/blob/master/image/twitter-weeidl.gif) |
| :------------: | :------------: | :------------: |
| **Video** | **Photo** |  **Video** |


## Usage

### Android Configuration

#### Paste the following attribute in the `manifest` tag in the `android/app/src/main/AndroidManifest.xml`:

```
 		`xmlns:tools="http://schemas.android.com/tools"`
```

## Getting Started

 Add the package to your pubspec.yaml:

 ```yaml
 custom_bottom_sheet: ^1.1.2
 ```
 
 In your dart file, import the library:

 ```Dart
import 'package:custom_bottom_sheet/custom_bottom_sheet.dart';
 ``` 
  Instead of using a `showModalBottomSheet` use `SlideDialog.showSlideDialog` Widget:

  ```Dart
void customBottomSheet(BuildContext context) {
    SlideDialog.showSlideDialog(
      context: context,
      backgroundColor: Colors.white,
      pillColor: Colors.yellow,
      transitionDuration: Duration(milliseconds: 300),
      child: Text('Your code'),
    );
  }
```

### Parameters:
#### SlideDialog.showSlideDialog:
* `pillColor`: Color for the yellow label at the top of the model sheet.
* `backgroundColor`: The background of everything is set SlideDialog.showSlideDialog.
* `transitionDuration`: The time of the animation of the appearance and closing.
* `child`: Pass here the widgets that you want to display.

### Follow Me:
[![instagram](https://img.shields.io/badge/-instagram-05151e?style=for-the-badge&logo=instagram)](https://www.instagram.com/weeidl/)
[![Telegram](https://img.shields.io/badge/-Telegram-05151e?style=for-the-badge&logo=Telegram)](https://t.me/weeidl)
[![LinkedIn](https://img.shields.io/badge/-LinkedIn-05151e?style=for-the-badge&logo=LinkedIn)](https://www.linkedin.com/in/weeidl/)
[![GitHub](https://img.shields.io/badge/-GitHub-05151e?style=for-the-badge&logo=GitHub)](https://github.com/weeidl)
