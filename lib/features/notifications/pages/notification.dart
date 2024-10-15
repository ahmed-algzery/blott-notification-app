import 'package:flutter/material.dart';
import 'package:newstask/features/notifications/widgets/notification_body.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotificationBody(),
    );
  }
}
