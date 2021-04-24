import 'dart:convert';

import 'package:DevQuiz/Shared/Models/quiz_model.dart';
import 'package:DevQuiz/Shared/Models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/DataBase/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString("assets/DataBase/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}