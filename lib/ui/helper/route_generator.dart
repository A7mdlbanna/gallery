import 'package:flutter/material.dart';
import 'package:gallery/ui/screens/gallery/gallery_screen.dart';
import 'package:gallery/ui/screens/login_screen.dart';
import 'package:gallery/ui/widgets/network_error.dart';

import '../resources/app_routes.dart';

class RouteGenerator{
  static Route? generateRoute(RouteSettings settings){
    final dynamic args = settings.arguments;

    switch (settings.name){

      case AppRoutes.logInScreen:
        return _screenRedirect(LoginScreen(), text: 'login');

      case AppRoutes.galleryScreen:
        return _screenRedirect(GalleryScreen(), text: 'gallery');

      case AppRoutes.networkError:
        return _screenRedirect(NetworkErrorScreen(), text: 'network error');

      default:
        return _errorRoute();

    }
  }

  static MaterialPageRoute<dynamic> _screenRedirect(Widget screen, {text}) {
    print('I\'m a fucking stupid Navigator to: $text');
    return MaterialPageRoute<dynamic>(builder: (_) => screen);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      );
    });
  }
}
