class Quiz {
  String title;
  List<String> candidates;
  int answer;

  Quiz({required this.title, required this.candidates, required this.answer});

  Quiz.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        candidates = map['candidates'].cast<String>(),
        answer = map['answer'];
}
