import 'package:flutter/material.dart';

class TripHistoryScreen extends StatelessWidget {
  const TripHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Viajes'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTripCard(
            context,
            'Viaje a la Universidad',
            '15 de Marzo, 2024',
            '8:30 AM',
            '45 min',
            '\$120.00',
            'María González',
            '4.9',
          ),
          _buildTripCard(
            context,
            'Viaje al Centro Comercial',
            '14 de Marzo, 2024',
            '2:15 PM',
            '25 min',
            '\$85.00',
            'Ana Martínez',
            '5.0',
          ),
          _buildTripCard(
            context,
            'Viaje al Aeropuerto',
            '12 de Marzo, 2024',
            '6:00 AM',
            '1h 15min',
            '\$250.00',
            'Laura Sánchez',
            '4.8',
          ),
          _buildTripCard(
            context,
            'Viaje al Hospital',
            '10 de Marzo, 2024',
            '9:45 AM',
            '35 min',
            '\$95.00',
            'Carmen López',
            '5.0',
          ),
        ],
      ),
    );
  }

  Widget _buildTripCard(
    BuildContext context,
    String destination,
    String date,
    String time,
    String duration,
    String price,
    String driverName,
    String rating,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    destination,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    price,
                    style: TextStyle(
                      color: Colors.pink[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.timer, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  duration,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      driverName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // TODO: Implementar detalles del viaje
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Próximamente: Detalles del viaje'),
                        backgroundColor: Colors.pink,
                      ),
                    );
                  },
                  child: const Text('Ver Detalles'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 