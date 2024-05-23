// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_result/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('IT1262')
                    .where('username', isEqualTo: userservice.username)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No Data Available'));
                  }
                  final userDocument = snapshot.data!.docs.first;
                  String Theory = userDocument['Theory'];
                  String Practical = userDocument['Practical'];
                  String Overall = userDocument['Overall'];

                  print(Overall);
                  return Column(
                    children: [
                      const SizedBox(height: 5.0),
                      const Text(
                        "1st Year",
                        style: TextStyle(fontSize: 30),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "1st Semester",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      DataTable(
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Subject',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Theory',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Practical',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Overall',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1113'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1122'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1134'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1144'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('ACU1113'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                        ],
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue),
                        dataRowColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.selected)
                              ? Colors.blue.withOpacity(0.2)
                              : Colors.blue.withOpacity(0.0),
                        ),
                        border: TableBorder.all(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1.5),
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            "2nd Semester",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      DataTable(
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Subject',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Theory',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Practical',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Overall',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1214'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1223'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1232'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1242'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1252'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1262'))),
                            DataCell(Center(child: Text(Theory))),
                            DataCell(Center(child: Text(Practical))),
                            DataCell(Center(child: Text(Overall))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('ACU1212'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                        ],
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue),
                        dataRowColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.selected)
                              ? Colors.blue.withOpacity(0.2)
                              : Colors.blue.withOpacity(0.0),
                        ),
                        border: TableBorder.all(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 1.5),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
