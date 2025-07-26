import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Métodos de Pago'),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPaymentMethodCard(
            context,
            'Tarjeta de Crédito',
            'Visa terminada en 4242',
            Icons.credit_card,
            Colors.blue,
            true,
          ),
          _buildPaymentMethodCard(
            context,
            'Tarjeta de Débito',
            'Mastercard terminada en 8888',
            Icons.credit_card,
            Colors.orange,
            false,
          ),
          _buildPaymentMethodCard(
            context,
            'PayPal',
            'usuario@ejemplo.com',
            Icons.payment,
            Colors.indigo,
            false,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Implementar agregar método de pago
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Próximamente: Agregar método de pago'),
                  backgroundColor: Colors.pink,
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Agregar Método de Pago'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Card(
            color: Colors.pink,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Información de Pago',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '• Todos los pagos son procesados de forma segura\n'
                    '• Puedes cambiar tu método de pago en cualquier momento\n'
                    '• Los reembolsos se procesan en 3-5 días hábiles\n'
                    '• No se almacenan datos de tarjetas en nuestros servidores',
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
    );
  }

  Widget _buildPaymentMethodCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    bool isDefault,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Row(
          children: [
            Text(title),
            if (isDefault) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Predeterminado',
                  style: TextStyle(
                    color: Colors.pink[900],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(subtitle),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Text('Editar'),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('Eliminar'),
            ),
            if (!isDefault)
              const PopupMenuItem(
                value: 'default',
                child: Text('Establecer como predeterminado'),
              ),
          ],
          onSelected: (value) {
            // TODO: Implementar acciones del menú
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Próximamente: $value'),
                backgroundColor: Colors.pink,
              ),
            );
          },
        ),
      ),
    );
  }
} 