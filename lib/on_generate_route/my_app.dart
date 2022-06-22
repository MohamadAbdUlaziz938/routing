import 'package:routing/on_generate_route/unknon_page.dart';
import 'detail_screen.dart';
import 'home_screen.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Handle '/'

        if (settings.name == null) {
          return MaterialPageRoute(builder: (context) => const UnknownScreen());
        }
        if (settings.name!.trim().isEmpty) {
          return MaterialPageRoute(builder: (context) => const UnknownScreen());
        }
        var uri = Uri.parse(settings.name!);
        if (uri.pathSegments.first == '/') {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }

        // Handle '/details/:id'
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'details') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
        }

        return MaterialPageRoute(builder: (context) => UnknownScreen());
      },
    );
  }
}
