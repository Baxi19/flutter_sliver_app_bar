import 'package:flutter/material.dart';
import 'package:flutter_sliver_app_bar/pages/networking_content.dart';
import 'package:flutter_sliver_app_bar/widgets/networking_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: NetworkingHeader(maxExtent: 350.0, minExtent: 0.0),
          ),
          const NetworkingPageContent(),
        ]
      ),
    );
  }
}