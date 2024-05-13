import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> transactionData = [
  {
    'icon': const Icon(Icons.food_bank),
    'name': 'Comida',
    'color': Colors.yellow[700],
    'totalAmount': '-\$12000.00',
    'date' : 'Hoy',
    'color-icon': Colors.yellow
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bagShopping),
    'name': 'Shopping',
    'totalAmount': '-\$70000.00',
    'color': Colors.pink[300],
    'date' : 'Ayer',
    'color-icon': Colors.pink[500]
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.moneyBill),
    'name': 'Impuestos',
    'totalAmount': '-\$250000.00',
    'color': Colors.grey[400],
    'date' : 'Ayer',
    'color-icon': Colors.grey[500]
  },
  {
    'icon': const FaIcon(FontAwesomeIcons.bus),
    'name': 'Transporte',
    'totalAmount': '-\$8000.00',
    'color': Colors.blue[400],
    'date' : 'Hoy',
    'color-icon': Colors.blue[500]
  }
  
];