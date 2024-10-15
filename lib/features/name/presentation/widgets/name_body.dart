import 'package:flutter/material.dart';
import 'package:newstask/core/util/responsive_utils.dart';

class NameBody extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const NameBody({
    required this.firstNameController,
    required this.lastNameController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Add padding for better layout
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align items to the start
        children: [
          SizedBox(height: h(context, .06)),
          const Text(
            'Your legal name',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: h(context, .02)),
          const Text(
            'We need to know a bit about you so that we can create your account.',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          SizedBox(height: h(context, .02)),
          const SizedBox(height: 8),
          TextField(
            controller: firstNameController,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
              hintText: 'First Name',
            ),
          ),
          SizedBox(height: h(context, .04)),
          TextField(
            controller: lastNameController,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
              hintText: 'Last Name',
            ),
          ),
        ],
      ),
    );
  }
}
