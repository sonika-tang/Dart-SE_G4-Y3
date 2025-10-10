void main() {
  print(checkBalanced("{what is (42)}?"));
  print(checkBalanced("[text}"));
  print(checkBalanced("{[[(a)b]c]d}"));
}

String checkBalanced(String input) {
  final stack = <String>[];
  final pairs = {')': '(', ']': '[', '}': '{'};

  for (var ch in input.split('')) {
    if (pairs.values.contains(ch)) {
      stack.add(ch);
    } else if (pairs.keys.contains(ch)) {
      if (stack.isEmpty || stack.removeLast() != pairs[ch]) {
        return "Not balanced";
      }
    }
  }
  return stack.isEmpty ? "Balanced" : "Not balanced";

}
