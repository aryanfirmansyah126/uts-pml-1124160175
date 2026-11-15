import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile _profile = Profile.initial();

  Future<void> _bukaEditProfil() async {
    final hasilEdit = await Navigator.pushNamed(
      context,
      '/edit-profile',
      arguments: _profile,
    );

    if (hasilEdit != null && hasilEdit is Profile) {
      setState(() {
        _profile = hasilEdit;
      });
    }
  }

  void _bukaTentangSaya() {
    Navigator.pushNamed(context, '/about');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: widget.isDarkMode ? 'Mode Terang' : 'Mode Gelap',
            icon: Icon(
              widget.isDarkMode
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
            onPressed: () => widget.onThemeChanged(!widget.isDarkMode),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: colorScheme.primary),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(_profile.fotoAsset),
              ),
              accountName: Text(
                _profile.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(_profile.email),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profil Saya'),
              selected: true,
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.pop(context);
                _bukaEditProfil();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                _bukaTentangSaya();
              },
            ),
            const Divider(),
            SwitchListTile(
              secondary: Icon(
                widget.isDarkMode
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
              title: const Text('Mode Gelap'),
              value: widget.isDarkMode,
              onChanged: widget.onThemeChanged,
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout_rounded, color: colorScheme.error),
              title: Text(
                'Keluar',
                style: TextStyle(color: colorScheme.error),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.primary, width: 3),
                ),
                child: CircleAvatar(
                  radius: 56,
                  backgroundImage: AssetImage(_profile.fotoAsset),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _profile.nama,
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'NIM: ${_profile.nim}',
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${_profile.prodi} • ${_profile.kelas}',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.description_outlined,
                          size: 20,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Bio Singkat',
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _profile.bio,
                      style: textTheme.bodyMedium?.copyWith(height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Informasi Kontak',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 1,
              child: Column(
                children: [
                  InfoTile(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: _profile.email,
                  ),
                  const Divider(height: 1),
                  InfoTile(
                    icon: Icons.phone_outlined,
                    label: 'Nomor HP',
                    value: _profile.hp,
                  ),
                  const Divider(height: 1),
                  InfoTile(
                    icon: Icons.code_rounded,
                    label: 'Akun GitHub',
                    value: _profile.github,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaEditProfil,
        icon: const Icon(Icons.edit_rounded),
        label: const Text('Edit Profil'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            _bukaTentangSaya();
          } else if (index == 2) {
            _bukaEditProfil();
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'Tentang Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_rounded),
            label: 'Edit',
          ),
        ],
      ),
    );
  }
}