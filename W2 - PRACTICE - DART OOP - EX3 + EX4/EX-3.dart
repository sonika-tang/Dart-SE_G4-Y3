class CustomDuration {
  final int _milliseconds;

  // Public generative constructor
  CustomDuration(this._milliseconds)
      : assert(_milliseconds >= 0, "Duration must be >= 0");

  // Named generative constructors
  CustomDuration.fromHours(int hours)
      : _milliseconds = hours * 60 * 60 * 1000,
        assert(hours >= 0);

  CustomDuration.fromMinutes(int minutes)
      : _milliseconds = minutes * 60 * 1000,
        assert(minutes >= 0);

  CustomDuration.fromSeconds(int seconds)
      : _milliseconds = seconds * 1000,
        assert(seconds >= 0);

  // Getter
  int get intMiliseconds => _milliseconds;

  // Operator overload
  bool operator >(CustomDuration other) {
    return _milliseconds > other._milliseconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration(_milliseconds + other._milliseconds);
  }

  CustomDuration operator -(CustomDuration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception("Result duration cannot be negativr");
    }
    return CustomDuration(result);
  }

  @override
  String toString() {
    return "${_milliseconds}ms";
  }
}

void main() {
  var d1 = CustomDuration.fromHours(15);
  var d2 = CustomDuration.fromMinutes(100);

  print("d1: $d1");
  print("d2: $d2");
  
  print("d1 > d2 ? ${d1 > d2}");
  print("d1 + d2 = ${d1 + d2}");
  print("d1 - d2 = ${d1 - d2}");
}
