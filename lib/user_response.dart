///Class for capturing user response
class UserResponse {
  ///variable to store user responses
  Map<String, dynamic> answers = <String, dynamic>{};

  ///Function to add answer
  void add(Map<String, dynamic> toUpdate) {
    for (String key in toUpdate.keys) {
      answers[key] = toUpdate[key];
    }
  }

  ///Function to get answer of dataKey
  dynamic get(String dataKey) {
    if (dataKey == null) {
      return answers;
    }
    return answers[dataKey];
  }
}
