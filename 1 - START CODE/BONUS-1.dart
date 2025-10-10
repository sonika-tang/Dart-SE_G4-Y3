enum Direction { north, east, south, west }

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  for (var cmd in instructions.split('')) {
    if (cmd == 'R') {
      direction = turnRight(direction);
    } else if (cmd == 'L') {
      direction = turnLeft(direction);
    } else if (cmd == 'A') {
      var pos = advance(x, y, direction);
      x = pos[0];
      y = pos[1];
    }
  }

  // Print the final position and direction
  print("Final position: {$x, $y}");
  print("Facing: $direction");

}

Direction turnRight(Direction d) {
  switch (d) {
    case Direction.north:
      return Direction.east;
    case Direction.east:
      return Direction.south;
    case Direction.south:
      return Direction.west;
    case Direction.west:
      return Direction.north;
  }
}

Direction turnLeft(Direction d) {
  switch (d) {
    case Direction.north:
      return Direction.west;
    case Direction.west:
      return Direction.south;
    case Direction.south:
      return Direction.east;
    case Direction.east:
      return Direction.north;
  }
}

List<int> advance(int x, int y, Direction d) {
  switch (d) {
    case Direction.north:
      return [x, y + 1];
    case Direction.east:
      return [x + 1, y];
    case Direction.south:
      return [x, y - 1];
    case Direction.west:
      return [x - 1, y];
  }
}
