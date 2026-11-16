import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _namaController;
  late TextEditingController _nimController;
  late TextEditingController _prodiController;
  late TextEditingController _kelasController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;
  late TextEditingController _hpController;
  late TextEditingController _githubController;

  late Profile _profileAwal;
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      final args = ModalRoute.of(context)?.settings.arguments;
      _profileAwal = args is Profile ? args : Profile.initial();

      _namaController = TextEditingController(text: _profileAwal.nama);
      _nimController = TextEditingController(text: _profileAwal.nim);
      _prodiController = TextEditingController(text: _profileAwal.prodi);
      _kelasController = TextEditingController(text: _profileAwal.kelas);
      _bioController = TextEditingController(text: _profileAwal.bio);
      _emailController = TextEditingController(text: _profileAwal.email);
      _hpController = TextEditingController(text: _profileAwal.hp);
      _githubController = TextEditingController(text: _profileAwal.github);

      _isInit = true;
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  void _simpanPerubahan() {
    if (!_formKey.currentState!.validate()) return;

    final dataBaru = Profile(
      nama: _namaController.text.trim(),
      nim: _nimController.text.trim(),
      prodi: _prodiController.text.trim(),
      kelas: _kelasController.text.trim(),
      bio: _bioController.text.trim(),
      email: _emailController.text.trim(),
      hp: _hpController.text.trim(),
      github: _githubController.text.trim(),
      fotoAsset: _profileAwal.fotoAsset,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profil berhasil diperbarui')),
    );

    Navigator.pop(context, dataBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama lengkap wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  prefixIcon: Icon(Icons.badge_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'NIM wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _prodiController,
                decoration: const InputDecoration(
                  labelText: 'Program Studi',
                  prefixIcon: Icon(Icons.school_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Program studi wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _kelasController,
                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  prefixIcon: Icon(Icons.class_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Kelas wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bioController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Bio Singkat',
                  prefixIcon: Icon(Icons.description_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Bio singkat wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email wajib diisi';
                  }
                  final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Nomor HP',
                  hintText: 'Contoh: 081234567890',
                  prefixIcon: Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nomor HP wajib diisi';
                  }
                  final hpRegex = RegExp(r'^[0-9]{10,13}$');
                  if (!hpRegex.hasMatch(value.trim())) {
                    return 'Nomor HP harus angka 10 sampai 13 digit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _githubController,
                decoration: const InputDecoration(
                  labelText: 'Akun GitHub',
                  prefixIcon: Icon(Icons.code_rounded),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Akun GitHub wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: FilledButton.icon(
                  onPressed: _simpanPerubahan,
                  icon: const Icon(Icons.save_rounded),
                  label: const Text(
                    'Simpan Perubahan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}