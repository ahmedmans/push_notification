import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:test_push_notification/service/nitification_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    NotificationService.initialize(context);

    //  for background and terminated
    setState(() {
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {
          final routeFromNotifiction = message.data['route'];
          Navigator.of(context).pushNamed(routeFromNotifiction);
        }
      });
    });

    setState(() {
      // it's working forgrounde
      FirebaseMessaging.onMessage.listen((message) {
        if (message.notification != null) {
          print(message.notification!.body);
          print(message.notification!.title);
        }
        NotificationService.display(message);
      });
    });

    setState(() {
      // it's working when app is background but opened and user taps
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        final routeFromNotifiction = message.data["route"];
        // print(routeFromNotifiction);
        Navigator.of(context).pushNamed(routeFromNotifiction);
      });
    });

    //
    FirebaseMessaging.instance.getToken().then((token) {
      print('Token : $token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Hello !\n',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: 'En: Mohamed Gawdat \n',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: 'Task: ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: 'push notification using Firebase',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
