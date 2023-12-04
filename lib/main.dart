import 'package:flutter/material.dart';
import 'package:onboarding/utils/onboard_pages.dart';
import 'package:onboarding/widgets/welcome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int _currentPage = 0;

  void _handleNextPage() {
    int currentPage = _pageController.page!.toInt();

    if (currentPage == pages.length - 1) {
      return;
    }

    _pageController.animateToPage(
      _pageController.page!.toInt() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onChangePage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: _onChangePage,
              children: [
                ...List.generate(pages.length, (index) {
                  return Welcome(
                    welcomeData: pages[index],
                    onNextPage: _handleNextPage,
                  );
                })
              ],
            ),
            Positioned(
              bottom: 140.0,
              right: 0,
              left: 0,
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentPage,
                  count: pages.length,
                  effect: const JumpingDotEffect(
                      dotHeight: 12.0,
                      dotWidth: 12.0,
                      verticalOffset: 12.0,
                      paintStyle: PaintingStyle.stroke,
                      activeDotColor: Colors.blueAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
