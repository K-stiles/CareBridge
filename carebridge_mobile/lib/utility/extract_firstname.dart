String extractFirstName(String input) {
  List<String> words = input.trim().split(' ');
  return words.isNotEmpty ? words[0] : '';
}
