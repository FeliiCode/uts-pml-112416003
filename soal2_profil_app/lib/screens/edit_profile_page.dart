import 'package:flutter/material.dart';
import '../main.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _hpController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: currentProfile.name);
    _emailController = TextEditingController(text: currentProfile.email);
    _hpController = TextEditingController(text: currentProfile.phone);
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        currentProfile.name = _nameController.text;
        currentProfile.email = _emailController.text;
        currentProfile.phone = _hpController.text;
      });
      // Pop dan kirimkan sinyal berhasil
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                validator: (val) => (val == null || val.isEmpty) ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Email wajib diisi';
                  if (!val.contains('@')) return 'Format email tidak valid';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _hpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Nomor HP (10-13 digit)'),
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Nomor HP wajib diisi';
                  if (!RegExp(r'^[0-9]{10,13}$').hasMatch(val)) {
                    return 'Nomor HP harus berupa angka 10-13 digit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Simpan Data Baru'),
              )
            ],
          ),
        ),
      ),
    );
  }
}