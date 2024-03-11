import 'package:crisp_chat/crisp_chat.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:untitled3/bottom_navigation_bar.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
runApp(
  MaterialApp(home:   BottomNamvigae(),)


);
}

