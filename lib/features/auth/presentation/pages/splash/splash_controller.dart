part of 'splash_imports.dart';

class SplashController {
  late AnimationController _controller;

  /// init splash
  Future<void> initSplash(TickerProvider ticker, BuildContext context) async {
    _controller = AnimationController(vsync: ticker);
  }

  /// manipulate save data
  void manipulateSaveData(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userStr = preferences.getString("user");
    if (userStr != null) {
      UserModel data = UserModel.fromJson(json.decode("$userStr"));
      GlobalState.instance.set("token", data.token);
      Storage.setToken(data.token ?? '');
      GetIt.I<LoginHelper>().setCurrentUserData(data, true, context);
    } else {
      // AutoRouter.of(context).push(WelcomeScreenRoute());
    }
  }
}
