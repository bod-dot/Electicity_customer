import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications
{
  final _firebaseMessage=FirebaseMessaging.instance;
  Future<void> requestNotificationPermission() async {
  await _firebaseMessage.requestPermission();
  String ? token = await _firebaseMessage.getToken();
  print('Firebase Token: $token');
    
  }
}