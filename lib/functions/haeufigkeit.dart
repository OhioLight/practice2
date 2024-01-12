int buchstabenZaehler(String text, String targetLetter) {
  int count = 0;
  for (int i = 0; i < text.length; i++) {
    if (text[i].toLowerCase() == targetLetter.toLowerCase()) {
      count++;
    }
  }
  return count;
}
