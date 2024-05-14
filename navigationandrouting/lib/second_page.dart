import 'package:flutter/material.dart';
import 'package:navigationandrouting/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definisi rute-rute aplikasi
      routes: {
        '/': (context) => const HomePage(),
        '/second_page': (context) => const SecondPage(),
      },
      initialRoute: '/', // Rute awal aplikasi
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(data: 'Data dari Home Page'),
                  ),
                );
              },
              child: const Text('Menuju halaman kedua'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second_page', arguments: 'Menggunakan route');
              },
              child: const Text('Menuju halaman kedua dengan route'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String? data;
  const SecondPage({super.key, this.data});
  
  @override
  Widget build(BuildContext context) {
    final data2 = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data ?? '', style: const TextStyle(fontSize: 20.0)),
            Text(
              data2.toString() ?? '',
              style: const TextStyle(fontSize: 20.0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
