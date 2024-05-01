import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LiveScoreScreen extends StatefulWidget {
  const LiveScoreScreen({super.key});

  @override
  State<LiveScoreScreen> createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoreScreen> {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.youtube.com/'));

  // ..loadRequest(Uri.dataFromString(
  //     '<html><body><iframe src="https://www.scorebat.com/embed/livescore/?token=NTQ2ODBfMTcwMjg5ODc1M181MDViOTRjYmUxNjkwYjQ1N2IwNGVmZjU0ZWFmZGQ3Y2VmYzVhNWNh" frameborder="0" width="600" height="760" allowfullscreen allow="autoplay; fullscreen" style="width:100%;height:760px;overflow:hidden;display:block;" class="_scorebatEmbeddedPlayer_"></iframe><script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = "https://www.scorebat.com/embed/embed.js?v=arrv"; fjs.parentNode.insertBefore(js, fjs); }(document, "script", "scorebat-jssdk"));</script></body></html>',
  //     mimeType: 'text/html'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
