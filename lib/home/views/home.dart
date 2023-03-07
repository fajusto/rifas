import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> _list = List<Map<String, dynamic>>.generate(100, (index) => {
    'index': index.toString(),
    'status': 'Vendido'
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: Container(),
      appBar: AppBar(
        title: const Text('Rifas'),
        backgroundColor: const Color(0xff08196D),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/images/ieaderp_mini.png',
              height: 20,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(13))
                ),
                child: ExpansionTile(
                    title: Text('Rifa de Páscoa',
                      style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(),
                          Wrap(
                            children: _list.map( (e) {
                              return Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: const Color(0xff08196D),
                                    border: const Border(
                                      bottom: BorderSide(
                                        color: Colors.white,
                                      ),
                                      left: BorderSide(
                                        color: Colors.white,
                                      ),
                                      right: BorderSide(
                                        color: Colors.white,
                                      ),
                                      top: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    boxShadow: kElevationToShadow[4]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4, left: 4),
                                      child: Text(e['index'],
                                        style: GoogleFonts.lobster(
                                          color: Colors.white,
                                          fontSize: 16
                                        ),
                                      ),
                                    ),
                                    Text(e['status'],
                                      style: GoogleFonts.ebGaramond(
                                          color: Colors.white,
                                          fontSize: 10,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
