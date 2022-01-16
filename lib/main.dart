import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'signIn.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  await AndroidAlarmManager.initialize();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => InAppNotification(
      safeAreaPadding: MediaQuery.of(context).viewPadding,
      minAlertHeight: 60.0,
      child: child,
    ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.yellow[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(), 
    );
  }
}