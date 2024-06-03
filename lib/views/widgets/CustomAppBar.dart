import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Wallpaper",
                  style: TextStyle(
                    color: Color.fromARGB(255, 165, 155, 17),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: "Nova",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8), 
          Image.asset(
            'assets/images/Okayu_Movement.png', 
            height: 24, 
            width: 24, 
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
