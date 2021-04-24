import 'package:DevQuiz/Shared/Models/awnser_model.dart';
import 'package:DevQuiz/Shared/Models/question_model.dart';
import 'package:DevQuiz/Shared/Models/quiz_model.dart';
import 'package:DevQuiz/Shared/Models/user_model.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_repository.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final ValueNotifier<HomeState> stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));
    
    user = await repository.getUser();

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = await repository.getQuizzes();
  
    state = HomeState.success;
  }
}