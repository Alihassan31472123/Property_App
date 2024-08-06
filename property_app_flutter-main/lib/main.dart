import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apni_property_app/configs/routes/routes_config.dart';
import 'package:apni_property_app/features/core/providers/providers.dart';
import 'package:apni_property_app/configs/res/resource/src/strings.dart';
import 'package:apni_property_app/configs/res/style/style.dart';

final containerProvider = ProviderContainer();

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const StylrApp()));
}

class StylrApp extends StatelessWidget{
  const StylrApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: Themes.lightTheme(context),
      darkTheme: Themes.darkTheme(context),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
