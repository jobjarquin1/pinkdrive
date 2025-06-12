import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Mi Perfil',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              // Avatar y nombre
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Usuario',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'usuario@email.com',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Opciones del perfil
              _buildProfileOption(
                icon: Icons.person_outline,
                title: 'Editar Perfil',
                onTap: () {
                  // TODO: Implementar edición de perfil
                },
              ),
              _buildProfileOption(
                icon: Icons.history,
                title: 'Historial de Viajes',
                onTap: () {
                  // TODO: Implementar historial de viajes
                },
              ),
              _buildProfileOption(
                icon: Icons.payment,
                title: 'Métodos de Pago',
                onTap: () {
                  // TODO: Implementar métodos de pago
                },
              ),
              _buildProfileOption(
                icon: Icons.notifications_outlined,
                title: 'Notificaciones',
                onTap: () {
                  // TODO: Implementar configuración de notificaciones
                },
              ),
              _buildProfileOption(
                icon: Icons.security,
                title: 'Seguridad',
                onTap: () {
                  // TODO: Implementar configuración de seguridad
                },
              ),
              _buildProfileOption(
                icon: Icons.help_outline,
                title: 'Ayuda',
                onTap: () {
                  // TODO: Implementar sección de ayuda
                },
              ),
              const SizedBox(height: 24),
              // Botón de cerrar sesión
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Cerrar Sesión',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
} 