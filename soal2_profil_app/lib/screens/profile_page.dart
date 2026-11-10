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
          // Switch Mode Gelap
          Switch(
            value: themeModeNotifier.value == ThemeMode.dark,
            onChanged: (value) {
              setState(() {
                themeModeNotifier.value = value ? ThemeMode.dark : ThemeMode.light;
              });
            },
          ),
        ],
      ),
      // Drawer (Elemen Scaffold tambahan 1)
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text('Menu Navigasi', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Foto diri dari assets
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 12),
            Text(currentProfile.name, style: Theme.of(context).textTheme.headlineSmall),
            Text('${currentProfile.nim} | ${currentProfile.prodi} (${currentProfile.kelas})'),
            const SizedBox(height: 8),
            Text(currentProfile.bio, textAlign: TextAlign.center),
            const Divider(height: 30),
            
            // Reusable Widget InfoTile
            InfoTile(icon: Icons.email, title: 'Email', value: currentProfile.email),
            InfoTile(icon: Icons.phone, title: 'Nomor HP', value: currentProfile.hp),
            InfoTile(icon: Icons.code, title: 'GitHub', value: currentProfile.github),
          ],
        ),
      ),
      // FloatingActionButton untuk Edit Profil
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/edit_profile');
          if (result == true) {
            setState(() {}); // Memperbarui tampilan profil secara langsung
          }
        },
      ),
      // BottomNavigationBar (Elemen Scaffold tambahan 2)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 1) Navigator.pushNamed(context, '/about');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }
}