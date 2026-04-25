import 'package:flutter/material.dart';
import 'package:space/core/constants/app_colors.dart';
import 'package:space/core/constants/app_text_style.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.Title, required this.icon, required this.onPressed});

  final String Title;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.whitecolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
          ),
          fixedSize: Size(double.infinity, 60),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Text(Title, style: AppTextStyle.buttontext),
            Spacer(),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
