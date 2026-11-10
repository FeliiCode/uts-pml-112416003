import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Profil'),
        actions: [
          // Switch Mode Gelap / Terang Sinkron dengan ThemeNotifier
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeModeNotifier,
            builder: (context, currentMode, child) {
              return Switch(
                value: currentMode == ThemeMode.dark,
                onChanged: (isDark) {
                  themeModeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light;
                },
              );
            },
          ),
        ],
      ),
      // Elemen 1: Drawer (Menu Navigasi Samping)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(currentProfile.name),
              accountEmail: Text(currentProfile.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                foregroundImage: const AssetImage('assets/images/profile.png'),
                child: const Icon(Icons.person, size: 40),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Saya'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer terlebih dahulu
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context); // Tutup drawer sebelum navigasi
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      // Elemen 2: Body (Konten Utama Profil)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Foto Avatar dengan Fallback Icon
            CircleAvatar(
              radius: 55,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundImage: const AssetImage('assets/images/profile.png'),
              child: Icon(
                Icons.person,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              currentProfile.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text('${currentProfile.nim} | ${currentProfile.prodi} (${currentProfile.kelas})'),
            const SizedBox(height: 8),
            Text(
              currentProfile.bio,
              textAlign: TextAlign.center,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const Divider(height: 30),
            
            // Reusable Info Tiles
            InfoTile(icon: Icons.email, title: 'Email', value: currentProfile.email),
            InfoTile(icon: Icons.phone, title: 'Nomor HP', value: currentProfile.phone),
            InfoTile(icon: Icons.code, title: 'GitHub', value: currentProfile.github),
          ],
        ),
      ),
      // Elemen 3: FloatingActionButton untuk Edit Profil
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/edit_profile');
          if (result == true) {
            setState(() {}); // Memperbarui UI jika data profil di-update
          }
        },
      ),
      // Elemen 4: BottomNavigationBar (Navigasi Tab Bawah)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) async {
          if (index == 1) {
            await Navigator.pushNamed(context, '/about');
            setState(() => _currentIndex = 0); // Reset tab aktif kembali ke Profil
          } else {
            setState(() => _currentIndex = index);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }
}