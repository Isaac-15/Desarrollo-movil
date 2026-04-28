import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil')),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 60, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text('Usuario Demo', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                Text('Miembro desde 2024', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.email, color: Colors.blue),
                  title: Text('Correo electrónico'),
                  subtitle: Text('usuario@example.com'),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.blue),
                  title: Text('Teléfono'),
                  subtitle: Text('+123 456 7890'),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.cake, color: Colors.blue),
                  title: Text('Fecha de nacimiento'),
                  subtitle: Text('01/01/1990'),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.blue),
                  title: Text('Dirección'),
                  subtitle: Text('Calle Principal 123, Ciudad'),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}