class Question {
  late String brand;
  late List<String> options;
  late String correct;

  Question({required this.brand, required this.options, required this.correct});

  Question.fromJson(Map<String, dynamic> json) {
    brand = json['brand'];
    options = json['options'].cast<String>();
    correct = json['correct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['options'] = this.options;
    data['correct'] = this.correct;
    return data;
  }
}
