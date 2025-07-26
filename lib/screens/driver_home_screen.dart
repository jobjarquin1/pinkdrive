import 'package:flutter/material.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool _isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PinkDrive - Conductora'),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tarjeta de estado
            Card(
              color: _isAvailable ? Colors.green[50] : Colors.pink[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(
                      _isAvailable ? Icons.directions_car : Icons.directions_car_filled,
                      size: 48,
                      color: _isAvailable ? Colors.green : Colors.pink,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _isAvailable ? 'Disponible para viajes' : 'No disponible',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _isAvailable ? Colors.green : Colors.pink,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isAvailable ? 'Estás lista para recibir solicitudes' : 'Activa tu disponibilidad para recibir viajes',
                      style: TextStyle(
                        fontSize: 16,
                        color: _isAvailable ? Colors.green : Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Botón para cambiar disponibilidad
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isAvailable = !_isAvailable;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_isAvailable ? 'Ahora estás disponible' : 'Ya no estás disponible'),
                    backgroundColor: _isAvailable ? Colors.green : Colors.pink,
                  ),
                );
              },
              icon: Icon(_isAvailable ? Icons.toggle_on : Icons.toggle_off),
              label: Text(_isAvailable ? 'Desactivar Disponibilidad' : 'Activar Disponibilidad'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isAvailable ? Colors.green : Colors.pink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Botón para ver solicitudes
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implementar vista de solicitudes
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Próximamente: Solicitudes de viaje'),
                    backgroundColor: Colors.pink,
                  ),
                );
              },
              icon: const Icon(Icons.list_alt),
              label: const Text('Solicitudes de Viaje'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[100],
                foregroundColor: Colors.pink[900],
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Botón para historial de viajes
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/trip-history');
              },
              icon: const Icon(Icons.history),
              label: const Text('Historial de Viajes'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[100],
                foregroundColor: Colors.pink[900],
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Botón para ganancias
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/payment-methods');
              },
              icon: const Icon(Icons.attach_money),
              label: const Text('Ganancias'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink[100],
                foregroundColor: Colors.pink[900],
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 