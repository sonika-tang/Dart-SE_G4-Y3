import 'package:flutter/material.dart';
// import 'package:flutter_practice/W8%20-%20PRACTICE/EXERCISE-3/model/profile_tile_model.dart';
import 'package:flutter_practice/W8 - PRACTICE/EXERCISE-3/data/profile_data.dart';

import 'ui/screens/profile.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileApp(profileData: ronanProfile),
    ),
  );
}
