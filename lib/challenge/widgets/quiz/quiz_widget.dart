import 'package:DevQuiz/Shared/Models/awnser_model.dart';
import 'package:DevQuiz/Shared/Models/question_model.dart';
import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelect;
  

  const QuizWidget({
    Key? key, 
    required this.question,
    required this.onSelect,
  }): super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelect = -1;

  AwnserModel awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64,),
          Text(widget.question.title, style: AppTextStyles.heading,),
          SizedBox(height: 24,),
          for(var i = 0; i < widget.question.awnsers.length; i++)          
            AwnserWidget(
              awnser: awnser(i),
              disabled: indexSelect != -1,
              onTap: (value) { 
                indexSelect = i;
                setState(() { });
                Future.delayed(Duration(seconds: 1))
                .then((_) => widget.onSelect(value));
              },
              isSelected: indexSelect == i,
            )
        ],
      ),      
    );
  }
}