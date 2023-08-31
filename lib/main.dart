import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Initialize the binding for the Flutter app
  await Firebase.initializeApp(); // Initialize the Firebase application

  // get the phone token and copy the token to safety_detect app
  // insert the token to safety_detect app to give a method
  // send notification method need this token to find the receive notification phone
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $fcmToken');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

// Those code under this is all about awesome notification, if change to use awesome notification, it maybe will helpful-----------

// Get an instance of FirebaseDatabase and create a DatabaseReference object
// DatabaseReference databaseReference = FirebaseDatabase.instance.reference();
//
// // Listen for changes in the realtime database value of the 'Phone A' key
// databaseReference.child('Phone A').onValue.listen((event) {
//   // Get the value of the 'Phone A' node (picture URL) from the snapshot
//   String pictureUrl = event.snapshot.value as String;
//   showNotification1(pictureUrl);
// });
//
// databaseReference.child('returnA').onValue.listen((event) {
//   databaseReference.child('Phone A').get().then((DataSnapshot snapshot) {
//       String pictureUrl = snapshot.value as String;
//       showNotification2(pictureUrl);
//   });
// });

// AwesomeNotifications().initialize(
//   'resource://drawable/chillaxcarelogo',
//   [
//     NotificationChannel(
//       channelKey: 'high_importance_channel',
//       channelName: 'Basic Notifications',
//       channelDescription: 'Notification channel for basic notifications',
//       defaultColor: Color(0xFF9D50DD),
//       ledColor: Colors.white,
//       playSound: true,
//       soundSource: 'resource://raw/warning',
//     ),
//   ],
// );

// void showNotification1(String pictureUrl) {
//   final notification = NotificationContent(
//     id: 0,
//     channelKey: 'high_importance_channel',
//     title: 'You baby is danger!!!!!!!!!!!!!!!!!!',
//     body: 'You baby can\'t breath now!!!!!!!!!!!!',
//     payload: {'customData': 'your_custom_data'},
//     bigPicture: pictureUrl,
//     notificationLayout: NotificationLayout.BigPicture,
//     displayOnForeground: true,
//     displayOnBackground: true,
//     customSound: 'resource://raw/warning',
//     largeIcon: pictureUrl,
//     wakeUpScreen: true,
//     roundedLargeIcon: true,
//   );
//
//   AwesomeNotifications().createNotification(
//     content: notification,
//   );
// }
//
// void showNotification2(String pictureUrl) {
//   final notification = NotificationContent(
//     id: 0,
//     channelKey: 'high_importance_channel',
//     title: 'Sorry it was fake news~',
//     body: 'you were fooled :）',
//     payload: {'customData': 'your_custom_data'},
//     bigPicture: pictureUrl,
//     notificationLayout: NotificationLayout.BigPicture,
//     displayOnForeground: true,
//     displayOnBackground: true,
//     customSound: 'resource://raw/warning',
//     largeIcon: pictureUrl,
//     wakeUpScreen: true,
//     roundedLargeIcon: true,
//   );
//
//   AwesomeNotifications().createNotification(
//     content: notification,
//   );
// }
