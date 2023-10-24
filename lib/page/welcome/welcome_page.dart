import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wahyubseptian_briefcase/page/component/image.dart';
import 'package:wahyubseptian_briefcase/page/home/home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLastPage = false;
  final controller = PageController();

  Widget lastButton() {
    return TextButton(
        style: TextButton.styleFrom(
            foregroundColor: ThemeData().primaryColor,
            minimumSize: const Size.fromHeight(80),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: ThemeData().secondaryHeaderColor),
        onPressed: () async {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyHomePage()));
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('isFirstTime', true);
        },
        child: const Text("GET STARTED"));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listBoard = [
      Container(
        color: Theme.of(context).hintColor,
        child: Column(
          children: [
            Center(
                child: SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: const ImageWidget(
                fit: BoxFit.fitWidth,
              ),
            )),
          ],
        ),
      ),
      Container(
        color: Theme.of(context).hintColor,
        child: const Center(child: Text("page 2")),
      ),
      Container(
        color: Theme.of(context).hintColor,
        child: const Center(child: Text("page 3")),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [...listBoard],
          ),
        ),
        bottomSheet: isLastPage
            ? lastButton()
            : Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: true,
                      child: TextButton(
                        child: const Text("SKIP"),
                        onPressed: () {
                          controller.jumpToPage(2);
                        },
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                            spacing: 16,
                            dotColor: Theme.of(context).primaryColor,
                            activeDotColor: Theme.of(context).hintColor),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                      ),
                    ),
                    TextButton(
                      child: const Text("NEXT"),
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut);
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
