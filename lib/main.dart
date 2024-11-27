import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:etapa1/domain/constants/app_constants.dart';
import 'package:etapa1/domain/router/app_providers.dart';
import 'package:etapa1/domain/router/app_routes.dart';
import 'package:etapa1/domain/router/router_constants.dart';

void main() {
  /// * Set the preferred orientations of the app.
  WidgetsFlutterBinding.ensureInitialized();
  _setPreferredOrientations();
  runApp(const MyApp());
}

/// * Set the preferred orientations of the app.
void _setPreferredOrientations() => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// * MultiProvider that provides all the providers of the app.
    return MultiProvider(
      providers: appProviders ,
      child: const MaterialApp(
        title: kNameApp,
        initialRoute: kSplashScreen,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: kEnv == 'dev' ? true : false,
      ),
    );
  }
}