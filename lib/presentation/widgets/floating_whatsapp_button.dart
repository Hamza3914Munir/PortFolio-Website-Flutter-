import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'dart:io';

class FloatingWhatsAppButton extends StatelessWidget {
  final String phoneNumber;
  final String message;

  const FloatingWhatsAppButton({
    Key? key,
    required this.phoneNumber,
    required this.message,
  }) : super(key: key);

  void _launchWhatsApp() async {
    String url;
    
    // Remove any special characters from phone number for WhatsApp format
    String cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');
    String encodedMessage = Uri.encodeComponent(message);
    
    if (Platform.isAndroid) {
      // For Android: Use WhatsApp scheme
      url = "https://wa.me/$cleanPhone?text=$encodedMessage";
    } else if (Platform.isIOS) {
      // For iOS: Use WhatsApp scheme
      url = "https://wa.me/$cleanPhone?text=$encodedMessage";
    } else {
      // For web
      url = "https://wa.me/$cleanPhone?text=$encodedMessage";
    }

    try {
      await openUrlLink(url);
    } catch (e) {
      print('Error launching WhatsApp: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 30,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: _launchWhatsApp,
          backgroundColor: Color(0xFF25D366), // WhatsApp green color
          child: Icon(
            FontAwesomeIcons.whatsapp,
            color: Colors.white,
            size: 28,
          ),
          heroTag: 'whatsapp_fab',
          tooltip: 'Chat on WhatsApp',
        ),
      ),
    );
  }
}
