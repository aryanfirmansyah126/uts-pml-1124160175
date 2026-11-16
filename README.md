# Aplikasi Profil Mahasiswa (`soal2-profil-app`)

Proyek ini dibuat untuk memenuhi **Soal 2 Ujian Tengah Semester (UTS)** mata kuliah **Pemrograman Mobile Lanjut**.

## Identitas Mahasiswa
- **Nama:** Aryan Firmansyah
- **NIM:** 1124160175
- **Program Studi:** Teknik Informatika - Software Engineering
- **Kampus:** Global Institute
- **Mata Kuliah:** Pemrograman Mobile Lanjut

## Tautan Penting
- **Video Demo Aplikasi (YouTube):** [Tonton Video Demo di Sini](https://youtu.be/Mi9wS4BnLso)
- **Download APK Rilis (`v1.0.0`):** [Unduh app-release.apk](https://github.com/aryanfirmansyah126/uts-pml-1124160175/releases/tag/v1.0.0)

## Fitur Utama Aplikasi
1. **Halaman Login:** Dilengkapi validasi format email dan panjang password minimal 6 karakter, fitur lihat/sembunyikan password, serta indikator *loading* sebelum berpindah ke halaman utama.
2. **Halaman Profil Utama:** Menampilkan foto profil, biodata akademik, dan informasi kontak menggunakan *custom reusable widget* (`InfoTile`), navigasi melalui `Drawer` dan `BottomNavigationBar`, serta pergantian **Mode Terang & Mode Gelap (Light/Dark Mode)**.
3. **Halaman Edit Profil:** Formulir tervalidasi untuk memperbarui data profil secara interaktif, mengirim pembaruan kembali ke halaman utama, serta menampilkan notifikasi `SnackBar`.
4. **Halaman Tentang Saya:** Menampilkan deskripsi aplikasi, daftar keahlian dan hobi (**Desain UI/UX**, **Berenang**, **Main Badminton**, dan **Bermain Game Mobile Legends**), serta riwayat pendidikan.

## Struktur Folder Proyek
```text
uts_mobile/
├── screenshots/
│   ├── login.png
│   ├── profile.png
│   └── edit_profile.png
├── soal2-profil-app/
│   ├── assets/
│   │   └── images/
│   │       └── profil.jpeg
│   └── lib/
│       ├── models/
│       │   └── profile.dart
│       ├── screens/
│       │   ├── about_page.dart
│       │   ├── edit_profile_page.dart
│       │   ├── login_page.dart
│       │   └── profile_page.dart
│       ├── widgets/
│       │   └── info_tile.dart
│       └── main.dart
└── README.md