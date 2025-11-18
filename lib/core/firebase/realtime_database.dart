import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RealTimeDatabaseService {
  String config = "app_configuration";
  String common = "_common";
  String transactions = "transactions";
  String env = const String.fromEnvironment("APP_ENV_NAME");
  String subRef = Platform.isIOS ? "iOS" : "android";

  dynamic fetchRemoteCommonData(ref) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref("$config/$env/$common/$ref");
    DatabaseEvent event = await databaseReference.once();
    return event.snapshot.value;
  }

  dynamic fetchRemoteUserData(ref) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref("$config/$env/$subRef/$ref");
    DatabaseEvent event = await databaseReference.once();
    return event.snapshot.value;
  }

  dynamic fetchRemoteLatestVersion() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref("$config/$env/$subRef/latestVersion");
    DatabaseEvent event = await databaseReference.once();
    return event.snapshot.value;
  }

  Future fetchBranchTransaction() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref("$config/$env/$transactions");
    DatabaseEvent event = await databaseReference.once();
    return event.snapshot.value;
  }

  dynamic fetchPrompt(ref) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref("$config/$env/prompt/$ref");
    DatabaseEvent event = await databaseReference.once();
    return event.snapshot.value;
  }

  void fetchRemoteSSLCertificate(ref) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref("$config/$env/$subRef/sslPin");
    DatabaseEvent event = await databaseReference.once();
  }
}

// to use it in your code, you can use it like this:
// var minVersion = await getIt<RealTimeDatabaseService>().fetchRemoteUserData("minVersion");
