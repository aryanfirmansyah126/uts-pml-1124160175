class Profile {
  String nama;
  String nim;
  String prodi;
  String kelas;
  String bio;
  String email;
  String hp;
  String github;
  String fotoAsset;

  Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.hp,
    required this.github,
    this.fotoAsset = 'assets/images/profil.jpeg',
  });

  factory Profile.initial() {
    return Profile(
      nama: 'Aryan Firmansyah',
      nim: '1124160175',
      prodi: 'Teknik Informatika',
      kelas: 'TI-24',
      bio: 'Mahasiswa global',
      email: 'aryanfebruari01@gmail.com',
      hp: '083195451667',
      github: 'github.com/aryanfirmansyah126',
    );
  }
}