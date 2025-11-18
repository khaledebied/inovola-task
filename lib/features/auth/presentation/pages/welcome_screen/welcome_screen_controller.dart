part of 'welcome_screen_imports.dart';

class WelcomeScreenController {
  ObsValue<List<OnboardingEntity>> onBoardingObs = ObsValue.withInit([]);
  ObsValue<int> currentIndexObs = ObsValue.withInit(0);
  ObsValue<bool> partnerObs = ObsValue.withInit(false);
  var pageController = PageController();

  List<OnboardingEntity> list = [
    OnboardingEntity(title: tr("lblOnboardingTitle1"), desc: tr("lblOnboardingDesc1"), line: 'assets/images/on_boarding_line_1.png', icon: Res.onboarding1Icon),
    OnboardingEntity(title: tr("lblOnboardingTitle2"), desc: tr("lblOnboardingDesc2"), line: 'assets/images/on_boarding_line_2.png', icon: Res.onboarding2Icon),
    OnboardingEntity(title: tr("lblOnboardingTitle3"), desc: tr("lblOnboardingDesc3"), line: 'assets/images/on_boarding_line_3.png', icon: Res.onboarding3Icon),
  ];
  void initOnboardingData(bool isPartner) {
    partnerObs.setValue(isPartner);

    onBoardingObs.setValue(list);
  }

  void onPageChange(int index) {
    currentIndexObs.setValue(index);
  }

  void onButtonClick(BuildContext context) {
    // AutoRouter.of(context).push(LoginRoute(isPartner: partnerObs.getValue()));
  }

  void onIncrementPage(BuildContext context) {
    int currentIndex = currentIndexObs.getValue();
    if (currentIndex == 2 || partnerObs.getValue()) {
      // AutoRouter.of(context).push(LoginRoute(isPartner: partnerObs.getValue()));
      return;
    }
    currentIndex++;
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    currentIndexObs.setValue(currentIndex);
  }
}
