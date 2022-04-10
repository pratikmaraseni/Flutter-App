import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../home/components/top_bar.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TopBar(
            title: 'ホーム',
          )),
      body: SafeArea(
        child: WebView(
          backgroundColor: Colors.blue[200],
          initialUrl: 'http://18.183.224.16/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
