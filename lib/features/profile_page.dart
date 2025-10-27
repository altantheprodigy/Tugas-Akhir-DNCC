import 'package:flutter/material.dart';
import 'package:ta_dncc/authentication/login_page.dart';
import 'package:with_space_between/with_space_between.dart';

import '../ui/colors.dart';
import '../ui/typography.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Align(
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      "Profile",
                      style: smSemiBold.copyWith(color: dark),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: dark),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: iconPurple,
                          borderRadius: BorderRadius.circular(9999),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profiles.jpg',
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Super Papaww",
                                  style: smRegular.copyWith(color: dark),
                                ),
                                Text(
                                  "Flutter Developer",
                                  style: sRegular.copyWith(color: textGray),
                                ),
                              ].withSpaceBetween(height: 5),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: dark,
                              ),
                              child: Icon(
                                Icons.arrow_forward_outlined,
                                size: 15,
                                color: textWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].withSpaceBetween(width: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      reuseProfile(
                        'assets/icons/edit_profile.png',
                        'Edit Profile',
                      ),
                      reuseProfile(
                        'assets/icons/order_delivered.png',
                        'Order Delivered',
                      ),
                      reuseProfile('assets/icons/settings_icons.png', 'Settings'),
                      reuseProfile('assets/icons/faq_icons.png', 'Faq'),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15.0, right: 15, left: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Keluar', style: sRegular.copyWith(color: dark)),
                              Icon(Icons.login_outlined, size: 20, color: buttonFav,),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ].withSpaceBetween(height: 20),
            ),
          ),
        ),
      ),
    );
  }
}

Widget reuseProfile(String image, String title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(image, width: 16, height: 16),
      Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: borderGrey, width: 1)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: sRegular.copyWith(color: dark)),
              Icon(Icons.arrow_forward_ios, size: 15, color: dark),
            ],
          ),
        ),
      ),
    ],
  );
}
