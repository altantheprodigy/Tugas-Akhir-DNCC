import 'package:flutter/material.dart';
import 'package:ta_dncc/reuse_widget/reuse_title.dart';
import 'package:with_space_between/with_space_between.dart';

import '../ui/colors.dart';
import '../ui/typography.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notif = [
      {
        'isActive': true,
        'message': "Exciting news! There's a fresh freelance opportunity waiting for you. Don't miss out on this chance to showcase your skills and take your freelance career to new heights. Grab it now!",
        'time': '10h ago',
      },
      {
        'isActive': false,
        'message': "Hey there! You've got a new message waiting for you. Open it now to stay connected with your clients and collaborators. Don't keep them waiting—respond promptly to maintain strong professional relationships and keep your projects on track.",
        'time': '1h ago',
      },
      {
        'isActive': true,
        'message': "Great news! We've just added new freelance opportunities that match your skills and expertise. Take a look and seize these exciting opportunities to showcase your talent and grow your freelance career.",
        'time': 'yesterday',
      },
      {
        'isActive': false,
        'message': "Great news! We've just added new freelance opportunities that match your skills and expertise. Take a look and seize these exciting opportunities to showcase your talent and grow your freelance career.",
        'time': 'yesterday',
      },
      {
        'isActive': true,
        'message': "Great news! We've just added new freelance opportunities that match your skills and expertise. Take a look and seize these exciting opportunities to showcase your talent and grow your freelance career.",
        'time': 'yesterday',
      },
      {
        'isActive': false,
        'message': "Great news! We've just added new freelance opportunities that match your skills and expertise. Take a look and seize these exciting opportunities to showcase your talent and grow your freelance career.",
        'time': 'yesterday',
      },
      {
        'isActive': false,
        'message': "Great news! We've just added new freelance opportunities that match your skills and expertise. Take a look and seize these exciting opportunities to showcase your talent and grow your freelance career.",
        'time': 'yesterday',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Notification",
                      style: smSemiBold.copyWith(color: dark),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Today",
                  style: smSemiBold.copyWith(color: dark),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notif.length,
                  itemBuilder: (context, index) {
                    final item = notif[index];
                    return reuseCardNotification(
                      item['isActive'],
                      item['message'],
                      item['time'],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget reuseCardNotification(bool isActive, String message, String time) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: borderGrey, width: 1)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: cardProduct,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Icon(
                isActive ? Icons.email : Icons.email_outlined,
                size: 24,
                color: Colors.black,
              ),
            ),

            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: isActive ? hijau : dark25,
                  shape: BoxShape.circle,
                  border: Border.all(color: dark, width: 2),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                message,
                style: xsSemiBold.copyWith(color: textDark),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(time, style: xsSemiBold.copyWith(color: textGray)),
            ].withSpaceBetween(height: 15),
          ),
        ),
      ].withSpaceBetween(width: 10),
    ),
  );
}
