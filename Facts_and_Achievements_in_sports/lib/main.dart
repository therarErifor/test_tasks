import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:facts_and_achievements_in_sports/src/features/emulator_check.dart';
import 'package:facts_and_achievements_in_sports/src/features/file_client.dart';
import 'package:facts_and_achievements_in_sports/src/features/firebase_remote.dart';
import 'package:facts_and_achievements_in_sports/src/plug_app.dart';
import 'package:facts_and_achievements_in_sports/src/presentation/network_error_page.dart';
import 'package:facts_and_achievements_in_sports/src/presentation/webview_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final FirebaseRemote firebaseRemote = FirebaseRemote();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final connectivityResult = await (Connectivity().checkConnectivity());
  EmulatorCheck emu = EmulatorCheck();
  FileClient fileClient = FileClient();

  String localUrl = await fileClient.readLocalUrl();
  bool isEmu = await emu.checkIsEmu();

  if (connectivityResult == ConnectivityResult.none) {
  runApp(NetworkErrorPage());
  }else
  if (localUrl == "") {
    String? localUrl = await firebaseRemote.getGo();
    if (localUrl == null) {
      runApp(NetworkErrorPage());
    } else if (localUrl == "" || isEmu) {
      runApp(PlugApp());
    } else {
      fileClient.writeLocalUrl(localUrl);
      runApp(WebViewPage(localUrl: localUrl));
    }
  } else {
    runApp(WebViewPage(localUrl: localUrl));
  }
}
