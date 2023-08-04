import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message)async{
  await Firebase.initializeApp();
  print("Title::::::>${message.notification?.title}");
  print("Title::::::>${message.notification?.body}");
  print("Title::::::>${message.data}");

}

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();
    print("Token::::${fcmToken}");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
