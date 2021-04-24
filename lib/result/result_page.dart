import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int lenght;
  final int result;

  const ResultPage({Key? key, required this.title, required this.lenght, required this.result}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.illustration),
            Column(children: [
              Text("Parabens!!", style: AppTextStyles.heading40,),
              SizedBox(height: 16,),
              Text.rich(
                TextSpan(
                  text: "Voce Concluiu",
                  style: AppTextStyles.body,
                  children: [
                    TextSpan(text: "\n$title", style: AppTextStyles.bodyBold),
                    TextSpan(text: "\n$result de $lenght acertos", style: AppTextStyles.body)
                  ]
                ),
                textAlign: TextAlign.center,
              ),
            ],),
            Column(children: [
              Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: NextButtonWidget.purple(label: "Compartilhar", onTap: () { 
                    Share.share('Dev Quiz NLW5 - Flutter: resultado do Quiz: $title ($result / $lenght)');
                  },),
                )),
              ],
              ), 
              SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: NextButtonWidget.transparente(label: "Voltar ao Inicio", onTap: (){ Navigator.pop(context);},),
                  )),
                ],
              ),
            ],),
            
          ],
        ),
      ),
    );
  }
}