// import 'package:flame/flame.dart';
// import 'package:flame/game.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:pixel_adventure/pixel_adventure.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Flame.device.fullScreen();
//   await Flame.device.setLandscape();

//   PixelAdventure game = PixelAdventure();
//   runApp(
//     GameWidget(game: kDebugMode ? PixelAdventure() : game),
//   );
// }
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    PixelAdventure game = PixelAdventure();
    runApp(
      GameWidget(game: kDebugMode ? PixelAdventure() : game),
    );
  } catch (error, stackTrace) {
    // Handle the exception here, you can log it or show an error message
    print('Error during app initialization: $error');
    print(stackTrace);
  }

  // Catch unhandled Flutter errors
  FlutterError.onError = (FlutterErrorDetails details) {
    print('Unhandled Flutter error: ${details.exception}');
    print(details.stack);
    // You can log the error or show a user-friendly error message
  };
}
