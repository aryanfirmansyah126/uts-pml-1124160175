import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Head Profil (Tahap 2)
              const CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
              const SizedBox(height: 16),
              Text(
                'Aryan Firmansyah',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 4),
              Text(
                'NIM: 1124160175',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'Program Studi: Teknik Informatika',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),

              // Card 1: Informasi Kontak - Minimal 4 Item (Tahap 3)
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'aryan@gmail.com',
                      ),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'Nomor HP',
                        value: '0812718275',
                      ),
                      InfoTile(
                        icon: Icons.class_,
                        label: 'Kelas',
                        value: 'TI-2024-A',
                      ),
                      InfoTile(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: 'github.com/aryanfirmansyah126',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Card 2: Keahlian & Hobi - Minimal 3 Item (Tahap 3)
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: const [
                      InfoTile(
                        icon: Icons.developer_mode,
                        label: 'Keahlian Utama',
                        value: 'Flutter & Dart Development',
                      ),
                      InfoTile(
                        icon: Icons.storage,
                        label: 'Database',
                        value: 'MySQL & Firebase',
                      ),
                      InfoTile(
                        icon: Icons.sports_esports,
                        label: 'Hobi',
                        value: 'Coding & Gaming',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Terima kasih telah melihat profil saya'),
            ),
          );
        },
        child: const Icon(Icons.thumb_up),
      ),
    );
  }
}

// Widget Reusable InfoTile (Tahap 3)
class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}