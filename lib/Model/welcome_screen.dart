import 'dart:async';
import 'package:dental_news/Main_Bottom.dart';
import 'package:dental_news/utils/utils.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController();
  int pageIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (pageIndex < 2) {
        controller.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      } else {
        timer.cancel();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          image: const DecorationImage(
            image: AssetImage('image/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            PageView(
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              controller: controller,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'image/firstScreen.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Get Anything Online',
                        textAlign: TextAlign.right,
                        style: k2Style,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.032,
                        vertical: MediaQuery.of(context).size.height * 0.016,
                      ),
                      child: Text(
                        'You can buy anything ranging from digital products to hardware with just a few clicks.',
                        textAlign: TextAlign.right,
                        style: k3Style,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'image/secondScreen.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Shipping Anywhere',
                        textAlign: TextAlign.right,
                        style: k2Style,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.032,
                        vertical: MediaQuery.of(context).size.height * 0.016,
                      ),
                      child: Text(
                        'We will ship to anywhere in the world with a 30-day 100% money-back guarantee.',
                        textAlign: TextAlign.right,
                        style: k3Style,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'image/thirdScreen.png',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'On-time Delivery',
                        textAlign: TextAlign.right,
                        style: k2Style,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.032,
                        vertical: MediaQuery.of(context).size.height * 0.016,
                      ),
                      child: Text(
                        'You can track your product with our powerful tracking service.',
                        textAlign: TextAlign.right,
                        style: k3Style,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.016,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: MediaQuery.of(context).size.width * 0.03,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: color.app, width: 1),
                            color: pageIndex == 0 ? purple : Colors.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: MediaQuery.of(context).size.width * 0.03,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: color.app, width: 1),
                            color: pageIndex == 1 ? purple : Colors.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8.0),
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: MediaQuery.of(context).size.width * 0.03,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color.fromARGB(255, 202, 202, 202),
                                width: 1),
                            color: pageIndex == 2 ? purple : Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Opacity(
                          opacity: pageIndex != 2 ? 1.0 : 0.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color.app,
                            ),
                            child: Text(
                              'SKIP',
                              style: k2Style,
                            ),
                          ),
                        ),
                        if (pageIndex != 2)
                          ElevatedButton(
                            onPressed: () {
                              if (controller.page != 2.0) {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.linear,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color.app,
                            ),
                            child: Text(
                              'NEXT',
                              style: k2Style,
                            ),
                          )
                        else
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: color.app,
                            ),
                            child: Text(
                              'FINISH',
                              style: k2Style,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
