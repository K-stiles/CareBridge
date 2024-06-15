String capitalizeWordsAndSplit(String input) {
  if (input.contains("_")) {
    List<String> words = input.split("_");
    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        words[i] = word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
    }
    return words.join(" ");
  } else {
    String word = input[0].toUpperCase() + input.substring(1).toLowerCase();
    return word;
  }
}
