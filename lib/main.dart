import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AU Utils',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> links = const [
    {
      'title': 'Annamalai University',
      'url': 'https://annamalaiuniversity.ac.in'
    },
    {
      'title': 'Student Portal',
      'url': 'https://annamalaiuniversity.ac.in/studport/'
    },
    {
      'title': 'Tuition Fee',
      'url':
          'https://annamalaiuniversity.ac.in/studport/tf_general_pharmacy.php?fee=tf'
    },
    {
      'title': 'Exam Fee',
      'url': 'https://annamalaiuniversity.ac.in/aucoe/exam_fee_oncamp.php'
    },
    {
      'title': 'Halticket',
      'url': 'https://annamalaiuniversity.ac.in/aucoe/onc_hallticket.php'
    },
  ];

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalNonBrowserApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "ANNAMALAI ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset(
              'assets/logo.png', // <-- Your crest image here
              height: 30,
            ),
            const Text(
              " UNIVERSITY",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: links.length,
        itemBuilder: (context, index) {
          final item = links[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            child: ListTile(
              title: Text(item['title']!),
              trailing: const Icon(Icons.open_in_browser),
              onTap: () => _openLink(item['url']!),
            ),
          );
        },
      ),
    );
  }
}
