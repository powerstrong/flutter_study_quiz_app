import 'package:flutter/material.dart';
import 'package:flutter_quiz_app_test/model/model_quiz.dart';
import 'package:flutter_quiz_app_test/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 퀴즈 페이지로 넘어갈 때 랜덤으로 퀴즈데이터를 가져옴. 더미 데이터
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': '#1. What is the capital of France?',
      'candidates': ['Paris', 'Lyon', 'Lille', 'Marseille'],
      'answer': 0,
    }),
    Quiz.fromMap({
      'title': '#2. What is the capital of France?',
      'candidates': ['Paris', 'Lyon', 'Lille', 'Marseille'],
      'answer': 0,
    }),
    Quiz.fromMap({
      'title': '#3. What is the capital of France?',
      'candidates': ['Paris', 'Lyon', 'Lille', 'Marseille'],
      'answer': 0,
    }),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        // 기기의 상단 노티바 부분, 하단 영역을 침범하지 않음
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Quiz App'),
            backgroundColor: Colors.deepPurple,
            leading: Container(), // 앱바의 왼쪽버튼 (뒤로가기) 등을 지워줌
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Image.asset(
                'images/quiz.jpeg',
                width: width * 0.8,
              )),
              Padding(padding: EdgeInsets.all(width * 0.024)),
              Text(
                'Flutter 퀴즈 앱',
                style: TextStyle(
                  fontSize: width * 0.065,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '퀴즈를 풀기 저 안내사항입니다.\n꼼꼼히 읽고 퀴즈 풀기를 눌러주세요.',
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(width * 0.048)),
              _buildStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
              _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤\n다음 문제 버튼을 눌러주세요.'),
              _buildStep(width, '3. 만점을 향해 도전해보세요!'),
              Padding(padding: EdgeInsets.all(width * 0.048)),
              Container(
                padding: EdgeInsets.only(bottom: width * 0.036),
                child: Center(
                    child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: Size(280, height * 0.07),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            quizs: quizs,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      '지금 퀴즈 풀기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        width * 0.048,
        width * 0.024,
        width * 0.048,
        width * 0.024,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(padding: EdgeInsets.all(width * 0.024)),
          Text(title),
        ],
      ),
    );
  }
}
