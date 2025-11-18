import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense_tracker/core/helpers/di.dart';
import 'package:expense_tracker/core/helpers/global_context.dart';
import 'package:expense_tracker/core/helpers/global_state.dart';
import 'package:expense_tracker/core/utilities/loading_dialog.dart';

import '../../features/auth/presentation/manager/user_cubit/user_cubit.dart';

class DynamicLinkHelper {
  static const String clientBundle = "com.tracker.app";

  DynamicLinkHelper._();

  static final DynamicLinkHelper instance = DynamicLinkHelper._();

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  ///todo update admin

  Future<Uri> createDynamicLink({required String promorCode}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse('https://fozapp.page.link/$promorCode'),
      uriPrefix: 'https://fozapp.page.link',
      androidParameters: const AndroidParameters(
        packageName: clientBundle,
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: clientBundle,
        minimumVersion: '1',
        appStoreId: '1666211271',
      ),
    );
    final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(parameters);
    Uri url = shortLink.shortUrl;
    return url;
  }

  Future<void> retrieveDynamicLink(BuildContext context, {bool isSplash = false}) async {
    try {
      dynamicLinks.onLink.listen((dynamicLinkData) {
        final deepLink = dynamicLinkData.link;
        print("======deepLink======> $deepLink");
        handleDeepLink(deepLink, isSplash);
      });
      final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;
      if (deepLink != null) {
        print("======deepLink======> $deepLink");
        handleDeepLink(deepLink, isSplash);
      }
    } catch (e) {
      CustomToast.showSimpleToast(msg: e.toString());
      if (kDebugMode) {
        print("============> $e");
      }
    }
  }

  handleDeepLink(deepLink, bool isSplash) async {
    var customerUserId = "";
    var ownerBusinessId = "";
    var expired = "";
    if ("$deepLink".contains("uid")) {
      customerUserId = "$deepLink".split("uid=").last;
    }
    if ("$deepLink".contains("bid")) {
      expired = "$deepLink".split("mil=").last;
      ownerBusinessId = "$deepLink".split("bid=").last.split("&").first;
    }
    if (expired.isNotEmpty && expired != "https://servvis.com" && DateTime.now().millisecondsSinceEpoch.abs() - int.parse(expired) > 3600000) {
      BuildContext context = getIt<GlobalContext>().context();
      var user = context.read<UserCubit>().state.model;
      print("===linkUser===$user");
      if ((user == null && isSplash) || user != null) {
        CustomToast.showSimpleToast(msg: "Expired Link !");
      }
      return;
    }
    if (ownerBusinessId.isNotEmpty && ownerBusinessId != "https://servvis.com") {
      GlobalState.instance.set("ownerBusinessId", ownerBusinessId);
      // Utils.setOwnerBusinessId(ownerBusinessId);
      // Future.delayed(const Duration(seconds: 1), () {
      //   _handleCreateAdministrator();
      // });
    }
    if (customerUserId.isNotEmpty && customerUserId != "https://servvis.com") {
      GlobalState.instance.set("customerUserId", customerUserId);
      // Utils.setCustomerUserId(customerUserId);
      Future.delayed(const Duration(seconds: 1), () {});
    }
  }

  Future<void> initDynamicLink() async {
    final initalLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (initalLink != null) {
      //nav background
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          _handelDeepLinkNavigation(initalLink.link.path);
        },
      );
    }
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      //forground
      final path = dynamicLinkData.link.path;
      debugPrint('dynamic link path: $path');
      //nav

      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          _handelDeepLinkNavigation(path);
        },
      );
    }).onError((dynamic error) {
      debugPrint('onLink error: $error');
    });
  }

  void _handelDeepLinkNavigation(String path) {
    final splitLink = path.split('/');
  }
}
