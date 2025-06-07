class Validator {
  static String? validateTodoInput(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "Title can't be empty";
    }
    return null;
  }
}
