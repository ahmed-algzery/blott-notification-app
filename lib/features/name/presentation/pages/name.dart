import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:newstask/features/notifications/pages/notification.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import for local storage
import 'package:newstask/features/name/presentation/widgets/name_body.dart';
import 'package:newstask/features/name/presentation/widgets/custom_floating_action_button.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool _isButtonActive = false;

  // Method to check if both fields have values and enable the button
  void _checkFields() {
    setState(() {
      _isButtonActive = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty;
    });
  }

  // Method to store the name in local storage and navigate to News screen
  Future<void> _storeName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('first_name', _firstNameController.text);
    await prefs.setString('last_name', _lastNameController.text);

    // Logging the stored name for confirmation
    log('Name saved: ${_firstNameController.text} ${_lastNameController.text}');

    // Navigate to the News screen after storing the name
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Notifications()),
    );
  }

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_checkFields);
    _lastNameController.addListener(_checkFields);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NameBody(
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
      ),
      floatingActionButton: _isButtonActive
          ? CustomFloatingActionButton(
              onPressed: _storeName, // Enable storing and navigation
              color: const Color(0xff523AE4),
            )
          : CustomFloatingActionButton(
              onPressed: () {},
              color: const Color(0xff523AE4).withOpacity(.5),
            ), // Disable button if not active
    );
  }
}
