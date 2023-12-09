import 'package:dog_breeds/constants/theme/theme.dart';
import 'package:dog_breeds/injection/provider.dart' as di;
import 'package:dog_breeds/presentation/homepage/bloc/homepage_bloc.dart';
import 'package:dog_breeds/presentation/homepage/homepage.dart';
import 'package:dog_breeds/presentation/templates/page_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load the env var
  await dotenv.load(fileName: ".env");
  await di.initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dog api test',
        theme: appTheme,
        themeMode: ThemeMode.system,
        home: BlocProvider(
          create: (context) =>
              GetIt.instance.get<HomepageBloc>()..add(LoadBreeds()),
          child: const PageTemplate(child: HomePage()),
        ));
  }
}
