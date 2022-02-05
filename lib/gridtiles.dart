import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:simplyweather/fetchdata.dart';

class CreateGrid extends StatefulWidget {
  const CreateGrid({Key? key}) : super(key: key);

  @override
  _CreateGridState createState() => _CreateGridState();
}

class _CreateGridState extends State<CreateGrid> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Weather>>(
        future: fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return buildGrid(snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  static styleTextTime() => GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      );

  static styleTextDescription() => GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      );

  static styleTextContent() => GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      );

  static gridDecoration() => BoxDecoration(
        color: Colors.black.withOpacity(0.54),
        borderRadius: BorderRadius.circular(20.0),
      );

  Widget buildGrid(weatherList) => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2,
        crossAxisSpacing: 50,
        mainAxisSpacing: 12,
      ),
      padding: EdgeInsets.only(top: 44, left: 20, right: 20),
      itemCount: 8,
      itemBuilder: (context, index) {
        return buildGridTile(weatherList[index]);
      });

  Widget buildGridTile(Weather weatherListElement) => Container(
        decoration: gridDecoration(),
        padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        child: Row(children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "${(DateTime.fromMillisecondsSinceEpoch(int.parse(weatherListElement.dt) * 1000)).hour}:00",
                    style: styleTextTime(),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(
                        'lib/images/${weatherListElement.icon.substring(0, 2)}.png'),
                  )
                ]),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "real",
                                      style: styleTextContent(),
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "feel",
                                      style: styleTextContent(),
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "wind",
                                      style: styleTextContent(),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${weatherListElement.real}°C",
                                      style: styleTextContent(),
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${weatherListElement.feel}°C",
                                      style: styleTextContent(),
                                    ),
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${weatherListElement.wind} km/h",
                                      style: styleTextContent(),
                                    ),
                                  ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${weatherListElement.desc}",
                          style: styleTextDescription(),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ]),
      );
}
