import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final items = const [
    {
      'title': 'Keahlian: Flutter Development',
      'subtitle': 'Pemrograman Aplikasi Mobile Cross-Platform',
    },
    {
      'title': 'Keahlian: UI/UX Design',
      'subtitle': 'Figma, Wireframing, & Prototyping',
    },
    {
      'title': 'Hobi: Open Source Contributing',
      'subtitle': 'Aktif di GitHub & Komunitas',
    },
    {
      'title': 'Pendidikan: S1 Teknik Informatika',
      'subtitle': 'Global Institute (2024 - Sekarang)',
    },
    {
      'title': 'Pendidikan: SMK Negeri 1 KAB TANGERANG',
      'subtitle': 'Desain Komunikasi Visual / Multimedia (2021 - 2024)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: Text(items[index]['title']!),
              subtitle: Text(items[index]['subtitle']!),
            ),
          );
        },
      ),
    );
  }
}
