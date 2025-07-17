import 'package:flutter/material.dart';
import 'use_cases/use_cases.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff6750a4),
        contrastLevel: MediaQuery.highContrastOf(context) ? 1.0 : 0.0,
      ),
    );
    final ThemeData darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xff6750a4),
        contrastLevel: MediaQuery.highContrastOf(context) ? 1.0 : 0.0,
      ),
    );

    return MaterialApp(
      title: 'Accessibility Assessments Home Page',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text(
          '📚 Bookmark’d',
          style: TextStyle(fontFamily: 'Georgia', fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: useCases.length,
        itemBuilder: (context, index) {
          final useCase = useCases[index];
          return ListTile(
            title: Text(
              useCase.route,
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: useCase.buildWithContext),
              );
            },
          );
        },
      ),
    );
  }
}
