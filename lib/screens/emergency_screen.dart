import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergencia'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red[100]!,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                // Botón de pánico
                ElevatedButton(
                  onPressed: () {
                    _showEmergencyDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.warning_rounded, size: 50),
                      SizedBox(height: 10),
                      Text(
                        'BOTÓN DE PÁNICO',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Contactos de emergencia
                const Text(
                  'Contactos de Emergencia',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 15),
                _buildEmergencyContact(
                  context,
                  'Policía',
                  '911',
                  Icons.local_police,
                ),
                _buildEmergencyContact(
                  context,
                  'Contacto de Confianza 1',
                  'Llamar',
                  Icons.phone,
                ),
                _buildEmergencyContact(
                  context,
                  'Contacto de Confianza 2',
                  'Llamar',
                  Icons.phone,
                ),
                const SizedBox(height: 20),
                // Información adicional
                const Card(
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'En caso de emergencia:',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '1. Presiona el botón de pánico\n'
                          '2. Se notificará a tus contactos de confianza\n'
                          '3. Se compartirá tu ubicación en tiempo real\n'
                          '4. Se contactará a las autoridades si es necesario',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmergencyContact(
    BuildContext context,
    String title,
    String action,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.red),
        title: Text(title),
        trailing: TextButton(
          onPressed: () {
            // TODO: Implementar llamada
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Llamando a $title...'),
                backgroundColor: Colors.red,
              ),
            );
          },
          child: Text(
            action,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Estás segura?'),
          content: const Text(
            'Al presionar el botón de pánico:\n'
            '1. Se notificará a tus contactos de confianza\n'
            '2. Se compartirá tu ubicación\n'
            '3. Se contactará a las autoridades',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Implementar lógica de emergencia
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Activando protocolo de emergencia...'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: const Text(
                'Activar',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
} 