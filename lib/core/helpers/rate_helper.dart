import 'dart:io';

// import 'package:in_app_review/in_app_review.dart';
import 'package:injectable/injectable.dart';
// import 'package:share_plus/share_plus.dart';

@lazySingleton
class RateAppHelper {
  Future<void> requestReview() async {
    // final InAppReview inAppReview = InAppReview.instance;
    // if (await inAppReview.isAvailable()) {
    //   // Open the in-app review dialog
    //   await inAppReview.requestReview();
    // } else {
    //   // Fallback to opening the store listing if in-app review is unavailable
    //   await inAppReview.openStoreListing(appStoreId: '');
    // }
  }

  void shareFozApp() async {
    const urlAndroid = 'https://play.google.com/store/apps/details?id=&hl=en';
    const urlIOS = 'https://apps.apple.com/eg/app/';
    var url = Platform.isAndroid ? urlAndroid : urlIOS;
    // Share.share(url, subject: '🌟 Check Out The Amazing Foz App! 🌟');
  }
}
