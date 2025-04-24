import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(context, String? url) async {
  if (url != null) {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    ScaffoldMessenger(
        child: SnackBar(
          shape: Border.all(color:Colors.white),
          backgroundColor: Colors.white,
      content: Text('Cannot Launch This $url'),
    ));
  }
}
}
