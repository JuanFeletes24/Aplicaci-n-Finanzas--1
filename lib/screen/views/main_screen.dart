//Mainscreen 
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happybills_branch_juanrojas/data/data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  //devuelve una interfaz
  Widget build(BuildContext context) {
    //safearea hace que los componentes no choquen con la barra de estado
    return SafeArea(
      //añadir relleno
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Column(
          children: [
            Row(
              //añade espacio entre los hijos
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue[600]
                          ),
                        ),
                        Icon(CupertinoIcons.person_fill, color: Colors.blue[900],)
                      ],
                    ),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bienvenido", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),),
                        Text("Username", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onBackground)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              //mediaquery obtiene el ancho de la pantalla
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.tertiary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary
                  ],
                  transform: const GradientRotation(pi / 4)
                ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade400,
                      offset: const Offset(5, 5)
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Balance Total", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                  const SizedBox(height: 20,),
                  Text("\$2000.00", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white))
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transacciones", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onBackground),),
                GestureDetector(
                  child: Text("Ver más", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.outline),),
                  onTap: () {},
                  )
              ],
            ),
            const SizedBox(height: 20,),
            Expanded(
              //crea la lista scroleable de los gastos, estos gastos están en la lista de stats.dart
              child: ListView.builder(
                itemCount: transactionData.length,
                itemBuilder: (context, int i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: transactionData[i]['color-icon'],
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: transactionData[i]['color'],
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  transactionData[i]['icon']
                                  ],
                                 ),
                                 const SizedBox(width: 10,),
                                 Text(transactionData[i]['name'], style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.w500))
                                ],
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(transactionData[i]['totalAmount'], style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.w500)),
                                    Text(transactionData[i]['date'], style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onBackground, fontWeight: FontWeight.w400)),
                                  ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}