// AppRouter class in `lib/config/router/app_router.dart`
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
        final listProducts = settings.arguments as Future<List<ProductModel>>?;
        return MaterialPageRoute(
            builder: (_) => HomeScreen(data: listProducts,),
            settings: settings);
      case kCreateScreen:
        return MaterialPageRoute(
            builder: (_) => const CreateScreen(),
            settings: settings);
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
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
