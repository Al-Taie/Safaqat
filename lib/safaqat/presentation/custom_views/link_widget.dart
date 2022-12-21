import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkWidget extends StatelessWidget {
  LinkWidget({
    super.key,
    required this.url,
  });
  String? url;
  @override
  Widget build(BuildContext context) {
    if (url?.startsWith(RegExp(r'(https|http)')) == false) {
      url = 'https://$url';
    }
    return SelectableText.rich(
      TextSpan(children: [
        LinkableSpan(
            url: url,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                ),
            onPressed: (uri) async {
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            })
      ]),
    );
  }
}

class LinkableSpan extends WidgetSpan {
  LinkableSpan({
    MouseCursor mouseCursor = SystemMouseCursors.click,
    required String? url,
    required TextStyle style,
    required ValueChanged<Uri> onPressed,
  }) : super(
          child: MouseRegion(
            cursor: mouseCursor,
            child: Text.rich(
              TextSpan(
                text: url,
                style: style,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => onPressed(Uri.parse(url.toString())),
              ),
            ),
          ),
        );
}
