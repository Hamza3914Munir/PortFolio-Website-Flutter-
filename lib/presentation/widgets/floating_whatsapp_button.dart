import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nimbus/values/values.dart';

class FloatingWhatsAppButton extends StatelessWidget {
  final String phoneNumber;
  final String message;

  const FloatingWhatsAppButton({
    Key? key,
    required this.phoneNumber,
    required this.message,
  }) : super(key: key);

  Future<void> _launchWhatsApp() async {
    try {
      // Remove any special characters from phone number except + and digits
      String cleanPhone = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

      // Ensure phone number starts with country code (+ sign)
      if (!cleanPhone. startsWith('+')) {
        cleanPhone = '+$cleanPhone';
      }

      String encodedMessage = Uri.encodeComponent(message);

      // Unified URL that works across all platforms (mobile, desktop, web)
      final String whatsappUrl = "https://wa.me/$cleanPhone?text=$encodedMessage";

      // Convert to Uri for proper handling
      final Uri url = Uri.parse(whatsappUrl);

      // Check if the URL can be launched
      if (await canLaunchUrl(url)) {
        // Launch with mode that works on all platforms
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication, // Opens in WhatsApp app or web
        );
      } else {
        // Fallback: Try without mode parameter
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          throw 'Could not launch WhatsApp';
        }
      }
    } catch (e) {
      print('Error launching WhatsApp: $e');
      _showErrorDialog('Unable to open WhatsApp.  Please try again.');
    }
  }

  void _showErrorDialog(String message) {
    // Show error message to user (you can customize this)
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 90,
      right: 15,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: _launchWhatsApp,
          backgroundColor: const Color(0xFF25D366), // WhatsApp green color
          child: const Icon(
            FontAwesomeIcons.whatsapp,
            color: Colors. white,
            size: 28,
          ),
          heroTag: 'whatsapp_fab',
          tooltip: 'Chat on WhatsApp',
        ),
      ),
    );
  }
}