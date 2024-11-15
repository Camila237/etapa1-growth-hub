import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:etapa1/config/exports.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setPreferredOrientations();
  runApp(const MyApp());
}
void _setPreferredOrientations() => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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