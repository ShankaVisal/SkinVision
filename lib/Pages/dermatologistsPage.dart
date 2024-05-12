import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DermatologistsPage extends StatefulWidget {
  const DermatologistsPage({super.key});

  @override
  State<DermatologistsPage> createState() => _DermatologistsPageState();
}

class _DermatologistsPageState extends State<DermatologistsPage> {
  final TextEditingController name = TextEditingController();
  List<dynamic> doctors = [];

  @override
  void initState() {
    super.initState();
    loadDoctors();
  }

  Future<void> loadDoctors() async {
    String doctorsJson = await rootBundle.loadString('assets/doctors.json');
    setState(() {
      doctors = json.decode(doctorsJson);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text(
          'Dermatologists',
          style: TextStyle(fontSize: 24),
        )),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 254, 238, 232),
              Color.fromARGB(255, 240, 228, 252)
            ],
          ),
        ),
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                width: width * 0.9,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'Find Your Doctor',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey),
                    ),
                    // filled: true,
                    // fillColor: Colors.grey[200],
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: height / 100,
              ),
              SizedBox(
                height: height * 0.75,
                child: ListView.builder(
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> doctor = doctors[index];

                    return Card(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: width / 3,
                              height: height / 5,
                              child: Image.network(
                                doctor['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width / 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: height / 100,
                                ),
                                Text(
                                  doctor['description'],
                                  style: const TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: height / 100,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Color(0xffEFA885)),
                                        Text('${doctor['rating']}'),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Book',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        backgroundColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 50,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
