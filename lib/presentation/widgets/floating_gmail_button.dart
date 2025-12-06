import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingGmailButton extends StatelessWidget {
  final String gmailAddress;
  final String?  subject;
  final String? body;

  const FloatingGmailButton({
    Key? key,
    required this.gmailAddress,
    this.subject,
    this.body,
  }) : super(key: key);

  Future<void> _launchGmail() async {
    try {
      // Encode subject and body for URL
      String encodedSubject = Uri.encodeComponent(subject ?? '');
      String encodedBody = Uri. encodeComponent(body ?? '');

      // Create mailto URL
      final String mailtoUrl =
          "mailto:$gmailAddress?subject=$encodedSubject&body=$encodedBody";

      final Uri url = Uri.parse(mailtoUrl);

      // Check if the URL can be launched
      if (await canLaunchUrl(url)) {
        // For Web: Opens default email client or Gmail web
        if (kIsWeb) {
          await launchUrl(url, webOnlyWindowName: '_blank');
        } else {
          // For Mobile/Desktop: Opens default email app or Gmail app
          await launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        }
      } else {
        throw 'Could not launch Gmail';
      }
    } catch (e) {
      print('Error launching Gmail: $e');
      _showErrorSnackBar('Unable to open Gmail.  Please try again.');
    }
  }

  void _showErrorSnackBar(String message) {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 160,
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
          onPressed: _launchGmail,
          backgroundColor: const Color(0xFFEA4335), // Gmail red color
          child: const Icon(
            FontAwesomeIcons. envelope,
            color: Colors. white,
            size: 28,
          ),
          heroTag: 'gmail_fab',
          tooltip: 'Send Email',
        ),
      ),
    );
  }
}