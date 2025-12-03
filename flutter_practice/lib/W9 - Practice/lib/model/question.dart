class Question {
  final String id;
  String title;
  List<String> options;
  int correctAnswerIndex;

  Question({
    required this.id,
    required this.title,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      title: json['title'],
      options: List<String>.from(json['options']),
      correctAnswerIndex: json['correctAnswerIndex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
    };
  }
}