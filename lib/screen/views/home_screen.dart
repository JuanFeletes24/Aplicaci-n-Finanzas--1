import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        onPressed: () {}, 
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary
              ]
            )
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