import 'package:flutter/material.dart';
import 'package:etapa1/core/exports.dart';
import 'router_constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kSplashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case kHomeScreen:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
            settings: settings);
      case kCreateScreen:
        return MaterialPageRoute(
            builder: (_) => const CreateScreen(), settings: settings);
      case kDetailScreen:
        final product = settings.arguments as ProductModel?;
        return MaterialPageRoute(
          builder: (_) => DetailScreen(product: product),
          settings: settings,
        );
      case kEditScreen:
        final product = settings.arguments as ProductModel?;
        return MaterialPageRoute(
          builder: (_) => EditScreen(product: product),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
