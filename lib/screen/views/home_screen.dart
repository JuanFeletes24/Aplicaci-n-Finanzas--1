import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happybills_branch_juanrojas/screen/add_expense/views/anadir_gastos.dart';
import 'package:happybills_branch_juanrojas/screen/stats/stats.dart';
import 'package:happybills_branch_juanrojas/screen/views/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int index = 0;
  late Color itemSelected = Colors.blue;
  Color itemUnSelected = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10)
        ),
        child: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 3,
        backgroundColor: Colors.grey[200],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              //estamos usando un operador ternario
              //si el indice es 0 entonces la pestaña de inicio está seleccionada 
              color: index == 0 ? itemSelected : itemUnSelected,
              ),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.graph_circle_fill,
              color: index == 1 ? itemSelected : itemUnSelected,
              ),
            label: 'Estadisticas'
            ),
        ]
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const AddExpense(), //esta es la funcionalidad de navegacion del boton de añadir gastos.
              )
          );

        }, 
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue[700]
          ),
          child: const Icon(CupertinoIcons.add)
          )
        ),
        body: index == 0 
        ? MainScreen()
        : StatScreen()
    );
  }
}