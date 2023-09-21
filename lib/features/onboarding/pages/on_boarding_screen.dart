import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_universe/features/authentication/presentation/pages/authentication_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'on_boarding_screen.g.dart';

@riverpod
class OnBoardingProgress extends _$OnBoardingProgress {
  @override
  double build() {
    return 0.25;
  }

  void updateProgress(int pageIndex) {
    state = pageIndex == 0
        ? 0.25
        : pageIndex == 1
            ? 0.50
            : pageIndex == 2
                ? 0.75
                : 1;
  }
}

class OnboardModel {
  final String image, title, description;

  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  late PageController _pageController;

  final List<OnboardModel> contentList = [
    OnboardModel(
        image: "assets/images/onboarding_image_1.jpg",
        title: "Get Schwifty",
        description: "Get ready to have some\n fun with Rick and Morty"),
    OnboardModel(
        image: "assets/images/onboarding_image_2.jpg",
        title: "Wubba Lubba Dub Dub",
        description: "Welcome to the Rick\n and Morty universe"),
    OnboardModel(
        image: "assets/images/onboarding_image_3.jpg",
        title: "To Infinity and Beyond",
        description: "Explore the multiverse\n with Rick and Morty"),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentProgress = ref.watch(onBoardingProgressProvider);
    final progressUpdater = ref.watch(onBoardingProgressProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: contentList.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    progressUpdater.updateProgress(index);
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    image: contentList[index].image,
                    title: contentList[index].title,
                    description: contentList[index].description,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 20.0,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AuthenticationScreen()),
                            ModalRoute.withName('/authentication'));
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 55,
                      height: 55,
                      child: FloatingActionButton(
                        backgroundColor: const Color(0xFFEAE6EE),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              TweenAnimationBuilder<double>(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.easeInOut,
                                tween: Tween<double>(
                                  begin: 0,
                                  end: currentProgress,
                                ),
                                builder: (context, value, _) =>
                                    CircularProgressIndicator(
                                  value: value,
                                  color: const Color(0xFFD0BCFF),
                                ),
                              ),
                              const Icon(Icons.arrow_forward),
                            ],
                          ),
                        ),
                        onPressed: () {
                          if (currentProgress < 0.75) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linearToEaseOut,
                            );
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AuthenticationScreen()),
                                ModalRoute.withName('/authentication'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/rick_and_morty_text.png"),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Image.asset(image),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
