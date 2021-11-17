import 'package:flutter/material.dart';

class NetworkingPageContent extends StatefulWidget {
  const NetworkingPageContent({Key? key}) : super(key: key);

  @override
  _NetworkingPageContentState createState() => _NetworkingPageContentState();
}

class _NetworkingPageContentState extends State<NetworkingPageContent> {
  late Future<String> _loader;
  bool _shouldFail = false;

  // mock function to load some data or fail after some delay
  Future<String> getData() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    return 'Hello 👋 \nmy name is Randald.\nI have knowledge of\nprogramming languages like:\n\tJavascript \n\tPython \n\tC# \n\tJava \n\tTypescript \n\tPostgreSQL \n\tDart \nSpecialist in web, mobile 📱 \nand desktop applications. \n💻 I work with different frameworks and libraries like: \n\tReact \n\tRedux \n\tAngular \n\tFlutter. ❤️‍🔥';
  }

  void _retry() {
    _loader = getData();
    setState(() => _shouldFail = !_shouldFail);
  }

  @override
  void initState() {
    super.initState();
    _loader = getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loader,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return SliverFillRemaining(
            child: TextAndButton(
              content: 'An error occurred',
              buttonText: 'Retry',
              onPressed: _retry,
            ),
          );
        }
        if (snapshot.hasData) {
          return SliverToBoxAdapter(
            child: TextAndButton(
              content: snapshot.data.toString(),
              buttonText: 'Reload',
              onPressed: _retry,
            ),
          );
        }
        return const SliverFillRemaining(
          child: Center(child: Text('No Content')),
        );
      },
    );
  }
}

class TextAndButton extends StatelessWidget {
  final String content;
  final String buttonText;
  final VoidCallback onPressed;
  const TextAndButton({
    Key? key, 
    required this.content,
    required this.buttonText,
    required this.onPressed
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            content,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}