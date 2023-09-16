import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemote {
  getGo() async {
    try{
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.fetchAndActivate();
      return remoteConfig.getString("url");
    }catch (e){
      return null;
    }
  }
}