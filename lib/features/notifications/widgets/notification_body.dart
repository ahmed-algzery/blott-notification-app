import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newstask/features/news/presentation/pages/home/news.dart'; // Import your News screen

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0), // Optional padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50), // Optional space from the top
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Centered image
                SvgPicture.asset(
                  'assets/images/Icon-chat.svg', // Replace with your image path
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),

                // Bold text
                const Text(
                  'Get the most out of Blott ✅',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                // Medium text under the bold text
                const Text(
                  'Allow notifications to stay in the loop with your payments, requests and groups.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            // Button at the bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Show iOS-style dialog when "Continue" is pressed
                    _showIOSDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: const Color(0xff523AE4), // Button color
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Method to show iOS-style dialog with two horizontal buttons and a vertical separator
void _showIOSDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text(
          '“Blott” Would Like to Send You Notifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Dismiss dialog
                  },
                  child: const Text(
                    'Don’t Allow',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              // Vertical grey divider between the buttons
              Container(
                width: 1,
                height: 40, // Height of the divider
                color: Colors.grey,
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Dismiss dialog
                    _navigateToNewsScreen(context); // Navigate to News screen
                  },
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

// Method to navigate to the News screen
void _navigateToNewsScreen(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const News()),
  );
}


}
