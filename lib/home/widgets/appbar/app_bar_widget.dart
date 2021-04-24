import 'package:DevQuiz/Shared/Models/user_model.dart';
import 'package:DevQuiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;


  AppBarWidget({required this.user}) : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,      
      child: Stack(        
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppGradients.linear
            ),
            height: 161,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                    text: "Olá,", 
                    style: AppTextStyles.title, 
                    children:[
                      TextSpan(
                        text: user.name, 
                        style: AppTextStyles.titleBold
                      )
                    ] 
                  )),
                  Container(
                    width: 58,
                    height: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: NetworkImage(user.photoUrl))
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.2),
            child: ScoreCardWidget(score: (user.score / 100),)
          )
        ],
      ),
    )
  );
  
}