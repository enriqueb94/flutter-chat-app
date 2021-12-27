import 'package:flutter/material.dart';

class Labels extends StatefulWidget {
  const Labels(
      {Key? key,
      required this.ruta,
      required this.titulo,
      required this.subTitulo})
      : super(key: key);
  final String ruta;
  final String titulo;
  final String subTitulo;

  @override
  __LabelsState createState() => __LabelsState();
}

class __LabelsState extends State<Labels> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.titulo,
          style: const TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w300)),
      const SizedBox(height: 10),
      GestureDetector(
        child: Text(widget.subTitulo,
            style: TextStyle(
                color: Colors.blue[600], fontWeight: FontWeight.bold)),
        onTap: () {
          Navigator.pushReplacementNamed(context, widget.ruta);
        },
      )
    ]);
  }
}
