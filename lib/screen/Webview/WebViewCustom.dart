import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:practice1/CustomRouter/Router_Constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewCustom extends StatefulWidget {
  final url;
  WebViewCustom(this.url);
  @override
  WebViewCustomState createState() => WebViewCustomState(this.url);
}

class WebViewCustomState extends State<WebViewCustom> {
  @override
  void initState() {
    super.initState();
  }

  void handleMessage(var url) {
    print("[Debug] handleMessage $url");
  }

  final _url;
  final _key = UniqueKey();
  String username = "USERNAME";
  String password = "PASSWORD";
  WebViewCustomState(this._url);
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("InAppWebView"),
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if (webViewController != Null) {
                  webViewController!.evaluateJavascript(source: "logout()");
                }
                // To close the Drawer
                Navigator.pop(context);
                // Navigating to About Page
                Navigator.pushNamed(context, homeRoute);
              }),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
            child: Container(
              child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse(_url)),
                  initialOptions: options,
                  onWebViewCreated: (InAppWebViewController controller) {
                    print("[Debug] onWebViewCreated $_url");
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    print("[Debug] onLoadStart");
                  },
                  onLoadStop: (controller, url) {
                    print("[Debug] onLoadStop");
                  },
                  onReceivedHttpAuthRequest: (InAppWebViewController controller,
                      URLAuthenticationChallenge challenge) async {
                    print("[Debug] URLAuthenticationChallenge");
                    return HttpAuthResponse(
                        username: "A",
                        password: "A",
                        action: HttpAuthResponseAction.PROCEED);
                  },
                  shouldOverrideUrlLoading:
                      (controller, shouldOverrideUrlLoadingRequest) async {
                    print("[Debug] shouldOverrideUrlLoading");
                    var url = shouldOverrideUrlLoadingRequest.request.url;
                    // var uri = Uri.parse(url);
                    this.handleMessage(url);
                  }),
            ),
          ),
        ])));
  }
}
