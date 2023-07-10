import 'package:expense_tracker/Tabs_Section/tabs.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) => {
      options.dsn =
          'https://f67869e3983d4e1698f1c092bd880fb9@o1418292.ingest.sentry.io/4504078280556544',
      options.tracesSampleRate = 1.0,
      options.attachScreenshot = true,
    },
    appRunner: () => runApp(
      const SentryScreenshotWidget(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CashTrack',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: MyAppState(),
    );
  }
}
