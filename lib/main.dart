import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(counterStateProvider);
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(child: Text("$counter")),
      const SizedBox(
        height: 20.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                ref.read(counterStateProvider.notifier).state++;
              },
              child: const Text("+")),
          const SizedBox(
            width: 12,
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(counterStateProvider.notifier).state--;
              },
              child: const Text("-"))
        ],
      )
    ]));
  }
}

//provider controller
final counterStateProvider = StateProvider((ref) {
  return 0;
});

// "wsl --update" 