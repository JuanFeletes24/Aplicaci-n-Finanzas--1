import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseControler = TextEditingController();
  TextEditingController categoryControler = TextEditingController();
  TextEditingController dateControler = TextEditingController();
  DateTime dateInitial = DateTime.now();

  List<String>categoriaIconos = [
    'casa',
    'comida',
    'compras',
    'entretenimiento',
    'mascotas',
    'tecno',
    'viaje',
    'impuestos',
  ];

  String iconSelected = '';
  late Color categoriaColor;

  @override
  void initState() {
    dateControler.text = DateFormat('dd/MM/yyyy').format(DateTime.now()); //para poder simplificar la fecha utilizamos una dependencia
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //el gesturedetector permite deseleccionar los labels si le das fuera de estos.
      onTap: () => FocusScope.of(context).unfocus(), //funcion que permite deseleccionar
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background, //definimos los colores del fondo como los del background
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Añadir gastos",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, //permite que el textfromfield sea menos ancho.
                child: TextFormField( //nos permite escribir texto
                  controller: expenseControler,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200], //el color de fondo del label
                    prefixIcon: const Icon(
                      FontAwesomeIcons.dollarSign, 
                      size: 17,
                      color: Colors.black54,
                      ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none //para que no hayan bordes
                    )
                  ),
                ),
              ), 
              const SizedBox(height: 24),
              TextFormField(
                controller: categoryControler,
                readOnly: true,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200], //el color de fondo del label
                    prefixIcon: const Icon(
                      FontAwesomeIcons.list, 
                      size: 17,
                      color: Colors.black54,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              bool expandido = false;
                              return StatefulBuilder(
                                builder: (context, setState){
                                  return AlertDialog(
                                    title: const Text("Crea una categoria"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          textAlignVertical: TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            isDense: true, //Para reducir el espacio verticial
                                            filled: true,
                                            fillColor: Colors.white, 
                                            label: Text("Nombre", style: TextStyle(color: Colors.black54),), //deje el label en cambio del hinttext porque la animacion que tiene es muy bacana
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: BorderSide.none 
                                            )
                                          )
                                        ),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          onTap: (){
                                            setState(() {
                                              expandido = !expandido;
                                            });
                                          },
                                          textAlignVertical: TextAlignVertical.center,
                                          readOnly: true, //solo para leer
                                          decoration: InputDecoration(
                                            isDense: true, //Para reducir el espacio verticial, daba problemas para ver  los iconos
                                            filled: true,
                                            suffixIcon: Icon(CupertinoIcons.chevron_down, size: 12), //añade un icono al final del campo de texto para ver los diferentes iconos
                                            fillColor: Colors.white, 
                                            label: Text("Icono", style: TextStyle(color: Colors.black54),), //deje el label en cambio del hinttext porque la animacion que tiene es muy bacana
                                            border: OutlineInputBorder(
                                              borderRadius: expandido
                                                  ? BorderRadius.vertical(top: Radius.circular(12))
                                                  : BorderRadius.circular(20),
                                              borderSide: BorderSide.none 
                                            )
                                          )
                                        ),
                                        expandido //si se presiona el boton de iconos, se despliega el container 
                                          ? Container( //contenedor de los iconos
                                              width: MediaQuery.of(context).size.width,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)) 
                                              ),
                                              //el gridview.builder sirve para hacerlos scroleables
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: GridView.builder(
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    
                                                    //cantidad de iconos mostrados en el grid
                                                    crossAxisCount: 4,
                                                    //espacio entre los iconos, aún no de a cuantos alinearlos
                                                    mainAxisSpacing: 5,
                                                    crossAxisSpacing: 5,
                                                  
                                                    ),
                                                
                                                  //se define por la cantidad de iconos de la lista
                                                  itemCount: categoriaIconos.length,
                                                itemBuilder: (context, int i){
                                                  return GestureDetector( // permite anadir funcionalidades para que cambie el color de los iconos
                                                    onTap: () {
                                                      setState(() {
                                                        iconSelected = categoriaIconos[i]; //al momento de darle al boton el color cambia
                                                      });
                                                    },
                                                    child: Container(               
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 3,
                                                          color: iconSelected == categoriaIconos[i]
                                                                ? Colors.blue
                                                                : Colors.grey,
                                                        ),
                                                        borderRadius: BorderRadius.circular(12),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'iconos/${categoriaIconos[i]}.png'
                                                          )
                                                        )                                                  
                                                      ),
                                                    ),
                                                  );                                      
                                                }
                                                ),
                                              )
                                            )
                                          : Container(),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          textAlignVertical: TextAlignVertical.center,
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (ctx2) {
                                                return AlertDialog(
                                                  content: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      ColorPicker( //widget que nos permite elegir un color
                                                        pickerColor: Colors.blue, //color escogido por default
                                                        onColorChanged: (value) {}, //este sera el valor que el usuario escoga dentro de la aplicacion
                                                      ),
                                                      SizedBox(
                                                        width: double.infinity,
                                                        height: 50,
                                                        child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                        style: TextButton.styleFrom(
                                                          backgroundColor: Theme.of(context).colorScheme.primary,
                                                        ),
                                                        child: const Text(
                                                          "Añadir",
                                                          style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                                        )
                                                      )
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                          },
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            isDense: true, //Para reducir el espacio verticial
                                            filled: true,
                                            fillColor: Colors.white, 
                                            label: Text("Color", style: TextStyle(color: Colors.black54),), //deje el label en cambio del hinttext porque la animacion que tiene es muy bacana
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: BorderSide.none 
                                            )
                                          )
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              );
                            });
                        },
                        icon: const Icon(
                          FontAwesomeIcons.plus,
                          size: 17,
                          color: Colors.black54
                        )
                      ),
                    label: Text("Categoria", style: TextStyle(color: Colors.black54),), //deje el label en cambio del hinttext porque la animacion que tiene es muy bacana
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none //para que no hayan bordes
                    )
                  )
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: dateControler,
                textAlignVertical: TextAlignVertical.center,
                readOnly: true, //como solo se inserta la fecha el usuario no deberia de escribir
                onTap: () async{
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: dateInitial,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365))
                  ); //para que pueda escoger una fecha en el calendario

                  if (newDate != null) { //esto permite modificar la fecha dentro del label
                    setState(() {
                      dateControler.text = DateFormat('dd/MM/yyyy').format(newDate);
                      dateInitial = newDate;
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200], //el color de fondo del label
                  prefixIcon: const Icon(
                    FontAwesomeIcons.calendar, 
                    size: 17,
                    color: Colors.black54,
                  ),
                  label: Text("Fecha", style: TextStyle(color: Colors.black54),), //deje el label en cambio del hinttext porque la animacion que tiene es muy bacana
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none //para que no hayan bordes
                  )
                )
              ),
              const SizedBox(height: 16),  
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const Text(
                    "Añadir",
                    style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

