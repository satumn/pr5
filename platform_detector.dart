import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformTypeApp extends StatefulWidget {
  final Function feedFish;
  final Function feedMilk;

  const PlatformTypeApp({required this.feedFish, required this.feedMilk, super.key});

  @override
  State<PlatformTypeApp> createState() => _MyPlatformTypeApp();
}

class _MyPlatformTypeApp extends State<PlatformTypeApp> {
  @override
  Widget build(BuildContext context) {
    if(kIsWeb) return WebApp(feedFish: widget.feedFish, feedMilk: widget.feedMilk);
    if(Platform.isAndroid) return AndroidApp(feedFish: widget.feedFish, feedMilk: widget.feedMilk);
    if(Platform.isWindows) return WinApp(feedFish: widget.feedFish, feedMilk: widget.feedMilk);
    return const Text('Undefined!', style: null);
  }
}

class WebApp extends StatefulWidget {
  final Function feedFish;
  final Function feedMilk;

  const WebApp({required this.feedFish, required this.feedMilk, super.key});

  @override
  State<WebApp> createState() => _MyWebAppState();
}

class _MyWebAppState extends State<WebApp>{
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [const Text('Web!'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(onPressed:(){widget.feedFish();},
                  tooltip: '+1', icon: Image.network("https://cdn-icons-png.freepik.com/256/3829/3829599.png?semt=ais_hybrid", width: 50, height: 50,)),
              IconButton(onPressed: (){widget.feedMilk();},
                  tooltip: '+0.5', icon: Image.network("https://cdn-icons-png.flaticon.com/512/869/869655.png", width: 60, height: 60,)),
            ],
          ),
        ]
    );
  }
}

class AndroidApp extends StatefulWidget {
  final Function feedFish;
  final Function feedMilk;

  const AndroidApp({required this.feedFish, required this.feedMilk, super.key});

  @override
  State<AndroidApp> createState() => _MyAndroidAppState();
}

class _MyAndroidAppState extends State<AndroidApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(onPressed:(){widget.feedFish();},
                  icon: Image.network("https://cdn-icons-png.freepik.com/256/3829/3829599.png?semt=ais_hybrid", width: 70, height: 70,)),
              IconButton(onPressed: (){widget.feedMilk();},
                  icon: Image.network("https://cdn-icons-png.flaticon.com/512/869/869655.png", width: 70, height: 70,)),
            ],
          ),
          const Text('Android!')
        ]
    );
  }
}

class WinApp extends StatefulWidget {
  final Function feedFish;
  final Function feedMilk;

  const WinApp({required this.feedFish, required this.feedMilk, super.key});

  @override
  State<WinApp> createState() => _MyWinAppState();
}

class _MyWinAppState extends State<WinApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(onPressed:(){widget.feedFish();},
                  tooltip: '+1', icon: Image.network("https://cdn-icons-png.freepik.com/256/3829/3829599.png?semt=ais_hybrid", width: 50, height: 50,)),
              IconButton(onPressed: (){widget.feedMilk();},
                  tooltip: '+0.5', icon: Image.network("https://cdn-icons-png.flaticon.com/512/869/869655.png", width: 60, height: 60,)),
            ],
          ),
          const Text('Windows!')
        ]
    );
  }
}
