import 'package:flutter/material.dart';

class ContentWidgets extends StatelessWidget {
  const ContentWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    child: Container(
                      height: 64,
                      color: Colors.white.withOpacity(0.8),
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SHARE',
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
                ],
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
    );
  }
}
