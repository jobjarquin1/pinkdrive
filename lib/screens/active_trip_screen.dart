import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages


class ActiveTripScreen extends StatefulWidget {
  const ActiveTripScreen({super.key});

  @override
  State<ActiveTripScreen> createState() => _ActiveTripScreenState();
}

class _ActiveTripScreenState extends State<ActiveTripScreen> {
  bool _showChat = false;
  final List<Map<String, String>> _messages = [
    {
      'sender': 'driver',
      'message': 'Hola, estoy en camino. Llego en 5 minutos.',
      'time': '14:30'
    },
    {
      'sender': 'user',
      'message': 'Ok, te espero en la entrada principal.',
      'time': '14:31'
    },
  ];

  // Estado del viaje (simulado)
  final String _status = 'En camino al destino';
  final double _progress = 0.45; // 45% del viaje completado
  final String _timeRemaining = '15 min';
  final String _distance = '2.5 km';
  final String _origin = 'Av. Insurgentes Sur 1234';
  final String _destination = 'Plaza Universidad';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Mapa
          FlutterMap(
            options: MapOptions(
              center: const LatLng(19.4326, -99.1332),
              zoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.pinkdrive.app',
              ),
              // Marcadores de origen y destino
              MarkerLayer(
                markers: [
                  Marker(
                    point: const LatLng(19.4326, -99.1332),
                    child: Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Panel de información del viaje
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Estado del viaje
                  Text(
                    _status,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Barra de progreso
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: _progress,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Información del conductor
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Text(
                          'AG',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ana García',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber[600],
                                ),
                                const Text(' 4.8'),
                                const Text(' • Toyota Corolla Rosa'),
                                const Text(' • ABC-123'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => _showChat = !_showChat);
                        },
                        icon: const Icon(Icons.chat_bubble_outline),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  // Detalles del viaje
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTripDetail(
                        Icons.access_time,
                        _timeRemaining,
                        'Tiempo restante',
                      ),
                      _buildTripDetail(
                        Icons.straighten,
                        _distance,
                        'Distancia',
                      ),
                      _buildTripDetail(
                        Icons.payments_outlined,
                        '\$85.00',
                        'Tarifa',
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  // Origen y destino
                  _buildLocationInfo(
                    Icons.my_location,
                    'Origen',
                    _origin,
                    Colors.blue,
                  ),
                  const SizedBox(height: 8),
                  _buildLocationInfo(
                    Icons.location_on,
                    'Destino',
                    _destination,
                    Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          // Panel de acciones
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Botón de pánico
                ElevatedButton.icon(
                  onPressed: () {
                    _showPanicDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.emergency),
                  label: const Text(
                    'BOTÓN DE PÁNICO',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                // Fila de acciones
                Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        Icons.share,
                        'Compartir',
                        () => _showShareTripDialog(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildActionButton(
                        Icons.cancel_outlined,
                        'Cancelar',
                        () => _showCancelDialog(context),
                        isDestructive: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Panel de chat
          if (_showChat)
            Positioned(
              top: 280,
              bottom: 100,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Text(
                            'Chat con conductora',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() => _showChat = false);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[index];
                          final isDriver = message['sender'] == 'driver';
                          return Align(
                            alignment: isDriver
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isDriver
                                    ? Colors.grey[200]
                                    : Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: isDriver
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    message['message']!,
                                    style: TextStyle(
                                      color: isDriver ? Colors.black : Colors.white,
                                    ),
                                  ),
                                  Text(
                                    message['time']!,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: isDriver
                                          ? Colors.grey[600]
                                          : Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Escribe un mensaje...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // TODO: Implementar envío de mensaje
                            },
                            icon: Icon(
                              Icons.send,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTripDetail(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationInfo(
    IconData icon,
    String label,
    String address,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              Text(
                address,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String label,
    VoidCallback onPressed, {
    bool isDestructive = false,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDestructive ? Colors.red[50] : Colors.white,
        foregroundColor: isDestructive ? Colors.red : Theme.of(context).primaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: Icon(icon),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  void _showPanicDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning, color: Colors.red),
            SizedBox(width: 8),
            Text('¿Activar botón de pánico?'),
          ],
        ),
        content: const Text(
          'Se notificará a las autoridades y contactos de emergencia. '
          'También se compartirá tu ubicación en tiempo real.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar llamada de emergencia
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Activar'),
          ),
        ],
      ),
    );
  }

  void _showShareTripDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Compartir viaje',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Comparte los detalles de tu viaje con tus contactos de confianza:',
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildShareOption(
                  FontAwesomeIcons.whatsapp,
                  'WhatsApp',
                  Colors.green,
                ),
                _buildShareOption(
                  Icons.message,
                  'SMS',
                  Colors.blue,
                ),
                _buildShareOption(
                  Icons.copy,
                  'Copiar',
                  Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Cancelar viaje?'),
        content: const Text(
          'Si cancelas el viaje, podrías recibir una penalización. '
          '¿Estás segura de que deseas cancelar?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No, continuar viaje'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar cancelación
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Sí, cancelar'),
          ),
        ],
      ),
    );
  }

  Widget _buildShareOption(
    IconData icon,
    String label,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        // TODO: Implementar compartir por cada método
        Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
} 