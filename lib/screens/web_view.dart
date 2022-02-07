import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';

class WebViewModel extends StatelessWidget {
  const WebViewModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteSettings args = ModalRoute.of(context)!.settings;
    String alias = args.arguments as String;
    
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
          alias != "null" ? WebView(
          initialUrl: Mixin().getWebUrl(alias),
          javascriptMode: JavascriptMode.unrestricted,
          ): Text("Oops"),
            SafeArea(
              child: Container(
                alignment: const Alignment(-1, -1),
                child: Card(
                  color: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
