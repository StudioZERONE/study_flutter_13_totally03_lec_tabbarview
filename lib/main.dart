import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List tabUrlList = [
    'https://flutter.dev/multi-platform/mobile',
    'https://flutter.dev/multi-platform/web',
    'https://flutter.dev/multi-platform/desktop',
  ];

  var verticalGestures = Factory<VerticalDragGestureRecognizer>(
      () => VerticalDragGestureRecognizer());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'TabBarView Sample',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black87,
          centerTitle: true,
          bottom: const TabBar(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
              width: 5,
              color: Colors.blue,
            )),
            labelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.phone_iphone)),
              Tab(icon: Icon(Icons.web)),
              Tab(icon: Icon(Icons.desktop_mac)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(tabUrlList[0])),
              gestureRecognizers: {verticalGestures},
            ),
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(tabUrlList[1])),
              gestureRecognizers: {verticalGestures},
            ),
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(tabUrlList[2])),
              gestureRecognizers: {verticalGestures},
            ),
          ],
        ),
      ),
    );
  }
}
