import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backGroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;

  NextButtonWidget({ 
    required this.label, 
    required this.backGroundColor, 
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
  });

  NextButtonWidget.green({required String label, required VoidCallback onTap}) : this.backGroundColor = AppColors.darkGreen, 
                                          this.fontColor = AppColors.white, 
                                          this.borderColor = AppColors.green,
                                          this.onTap = onTap,
                                          this.label = label;

  NextButtonWidget.white({required String label, required VoidCallback onTap}) : this.backGroundColor = AppColors.white, 
                                          this.fontColor = AppColors.grey, 
                                          this.borderColor = AppColors.border,
                                          this.label = label,
                                          this.onTap = onTap;

  NextButtonWidget.purple({required String label, required VoidCallback onTap}) : this.backGroundColor = AppColors.purple, 
                                          this.fontColor = AppColors.white, 
                                          this.borderColor = AppColors.purple,
                                          this.onTap = onTap,
                                          this.label = label;

  NextButtonWidget.transparente({required String label, required VoidCallback onTap}) : this.backGroundColor = Colors.transparent, 
                                          this.fontColor = AppColors.grey, 
                                          this.borderColor = Colors.transparent,
                                          this.onTap = onTap,
                                          this.label = label;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backGroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: borderColor)
          )
        ),
        onPressed: onTap, 
        child: Text(label, 
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor
          ),
        )
      ),
    );
  }
}