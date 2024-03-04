import 'package:flutter/material.dart';

class VotacionesScreen extends StatefulWidget {
  const VotacionesScreen({super.key});

  @override
  State<VotacionesScreen> createState() => _VotacionesScreenState();
}

int contador1 = 0;
int contador2 = 0;
int contador3 = 0;
int totalVotos = 0;
double porcentaje1 = 0;
double porcentaje2 = 0;
double porcentaje3 = 0;
double porcentajeG = 0;
String ganador = "";
String url = "";

votarEric() {
  contador1++;
  totalVotos++;
  porcentaje1 = (contador1 / totalVotos) * 100;
}

votarGoku() {
  contador2++;
  totalVotos++;
  porcentaje2 = (contador2 / totalVotos) * 100;
}

votarRandy() {
  contador3++;
  totalVotos++;
  porcentaje3 = (contador3 / totalVotos) * 100;
}

actualizarPorcentajes() {
  totalVotos = contador1 + contador2 + contador3;
  porcentaje1 = (contador1 / totalVotos) * 100;
  porcentaje2 = (contador2 / totalVotos) * 100;
  porcentaje3 = (contador3 / totalVotos) * 100;
}

seleccionarGanador() {
  if (contador1 > contador2 && contador1 > contador3) {
    ganador = "Eric Cartman";
    url =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL693ywPahFBa2hNBW5XHsRHoGdYWBc9qu-g&usqp=CAU";
    porcentajeG = porcentaje1;
  } else if (contador2 > contador1 && contador2 > contador3) {
    ganador = "Gokú";
    url =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvQ4EfPrVh9P81B7EuRUOZcOXbggXn7Mwm8CCuSoJBKNz34wzOdDhzRBVD_5KtgrBOtVA&usqp=CAU";
    porcentajeG = porcentaje2;
  } else if (contador3 > contador1 && contador3 > contador2) {
    ganador = "Randy Marsh";
    url =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzmvM2OH53-Su3JlWBxqNbriEqR5gKF7JTJA&usqp=CAU";
    porcentajeG = porcentaje3;
  }
}

class _VotacionesScreenState extends State<VotacionesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Votación a Personero',
          style: TextStyle(color: Colors.amber),
        )),
        backgroundColor: Colors.black,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL693ywPahFBa2hNBW5XHsRHoGdYWBc9qu-g&usqp=CAU'),
              ),
              Text("Votos por Eric: $contador1"),
              Text("${porcentaje1.toStringAsFixed(2)}% de los votos totales"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    votarEric();
                    actualizarPorcentajes();
                    seleccionarGanador();
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text("Votar por Eric"),
              ),
            ],
          )),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvQ4EfPrVh9P81B7EuRUOZcOXbggXn7Mwm8CCuSoJBKNz34wzOdDhzRBVD_5KtgrBOtVA&usqp=CAU'),
                ),
                Text("Votos por Gokú: $contador2"),
                Text("${porcentaje2.toStringAsFixed(2)}% de los votos totales"),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      votarGoku();
                      actualizarPorcentajes();
                      seleccionarGanador();
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  child: const Text("Votar por Gokú"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzmvM2OH53-Su3JlWBxqNbriEqR5gKF7JTJA&usqp=CAU'),
              ),
              Text("Votos por Randy: $contador3"),
              Text("${porcentaje3.toStringAsFixed(2)}% de los votos totales"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    votarRandy();
                    actualizarPorcentajes();
                    seleccionarGanador();
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                child: const Text("Votar por Randy"),
              ),
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: Image.network(url),
              ),
              Text("El ganador es: $ganador"),
              Text("Con un total de $totalVotos votos (${porcentajeG.toStringAsFixed(2)}%)")
            ],
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 245, 237, 213),
    );
  }
}
