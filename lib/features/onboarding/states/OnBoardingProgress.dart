import 'package:riverpod_annotation/riverpod_annotation.dart';

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
