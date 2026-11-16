import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final keahlianDanHobi = [
      {
        'judul': 'Desain UI/UX',
        'deskripsi': 'Merancang tampilan antarmuka aplikasi yang modern, rapi, dan nyaman digunakan.',
        'ikon': Icons.design_services_rounded,
      },
      {
        'judul': 'Berenang',
        'deskripsi': 'Olahraga rutin untuk menjaga kebugaran fisik dan ketahanan tubuh.',
        'ikon': Icons.pool_rounded,
      },
      {
        'judul': 'Main Badminton',
        'deskripsi': 'Bermain bulu tangkis di waktu luang untuk melatih kelincahan dan fokus.',
        'ikon': Icons.sports_tennis_rounded,
      },
      {
        'judul': 'Bermain Game Mobile Legends',
        'deskripsi': 'Mengisi waktu luang dengan bermain game strategi tim dan melatih kerja sama.',
        'ikon': Icons.sports_esports_rounded,
      },
    ];

    final riwayatPendidikan = [
      {
        'institusi': 'Global institute — S1 Teknik Informatika',
        'tahun': '2024 – Sekarang',
        'keterangan': 'Fokus pada Pemrograman Mobile Lanjut dan Rekayasa Perangkat Lunak.',
      },
      {
        'institusi': 'SMK Jurusan Mesin Pesawat',
        'tahun': '2021 – 2024',
        'keterangan': 'Aktif dalam kegiatan ekstrakurikuler .',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tentang Aplikasi & Pengembang',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Aplikasi Profil Mahasiswa ini dibuat menggunakan Flutter untuk menampilkan identitas akademik, pengelolaan biodata secara interaktif, serta dukungan tema terang dan gelap.',
                    style: textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Keahlian & Hobi',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...keahlianDanHobi.map(
            (item) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: colorScheme.primaryContainer,
                  child: Icon(
                    item['ikon'] as IconData,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                title: Text(
                  item['judul'] as String,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(item['deskripsi'] as String),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Riwayat Pendidikan',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...riwayatPendidikan.map(
            (edu) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: colorScheme.secondaryContainer,
                  child: Icon(
                    Icons.school_rounded,
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
                title: Text(
                  edu['institusi']!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
                    Text(
                      edu['tahun']!,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(edu['keterangan']!),
                  ],
                ),
                isThreeLine: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}