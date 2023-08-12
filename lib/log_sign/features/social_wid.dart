import 'package:flutter/material.dart';
class social_wid extends StatelessWidget {
  const social_wid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 300,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child:
        Row(
          children: [
            SizedBox(width: 10),
            CircleAvatar(
              radius: 28.0,
              backgroundImage: NetworkImage(
                  "https://e7.pngegg.com/pngimages/507/998/png-clipart-apple-icon-format-computer-icons-graphics-ericsson-heart-logo.png"),
              backgroundColor: Colors.transparent,

            ),
            SizedBox(width: 20),
            CircleAvatar(
              radius: 28.0,
              backgroundImage: NetworkImage(
                  "https://e7.pngegg.com/pngimages/262/226/png-clipart-computer-icons-white-google-black-google-logo-google-white-color.png"),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 20),
            CircleAvatar(
              radius: 28.0,
              backgroundImage: NetworkImage(
                  "https://khtooty.com/wp-content/uploads/2021/12/598.jpg"),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 23),
            CircleAvatar(
              radius: 28.0,
              backgroundImage: NetworkImage(
                  "https://khtooty.com/wp-content/uploads/2021/12/591.jpg"),
              backgroundColor: Colors.transparent,
            ),

          ],
        ),


      );
  }
}
