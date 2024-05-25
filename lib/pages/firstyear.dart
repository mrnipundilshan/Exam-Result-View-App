// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_result/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class firstyear extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  firstyear({super.key});

  Future<Map<String, Map<String, String>>> fetchData() async {
    // Fetch data from IT1262 collection
    var querySnapshotIT1262 = await _firestore
        .collection('IT1262')
        .where('username', isEqualTo: userservice.username)
        .get();

    // Fetch data from IT1262 collection
    var querySnapshotIT1214 = await _firestore
        .collection('IT1214')
        .where('username', isEqualTo: userservice.username)
        .get();

    // Fetch data from IT1223 collection
    var querySnapshotIT1223 = await _firestore
        .collection('IT1223')
        .where('username', isEqualTo: userservice.username)
        .get();

    Map<String, Map<String, String>> combinedData = {};

    if (querySnapshotIT1214.docs.isNotEmpty) {
      var doc = querySnapshotIT1262.docs.first;
      combinedData['IT1262'] = {
        'Theory': doc['Theory'],
        'Practical': doc['Practical'],
        'Overall': doc['Overall'],
      };
    }

    if (querySnapshotIT1262.docs.isNotEmpty) {
      var doc = querySnapshotIT1262.docs.first;
      combinedData['IT1262'] = {
        'Theory': doc['Theory'],
        'Practical': doc['Practical'],
        'Overall': doc['Overall'],
      };
    }

    if (querySnapshotIT1223.docs.isNotEmpty) {
      var doc = querySnapshotIT1223.docs.first;
      combinedData['IT1223'] = {
        'Theory': doc['Theory'],
        'Practical': doc['Practical'],
        'Overall': doc['Overall'],
      };
    }

    return combinedData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<Map<String, Map<String, String>>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Data Available'));
                  }
                  var combinedData = snapshot.data!;

                  var it1214Data = combinedData['IT1214'] ??
                      {'Theory': '-', 'Practical': '-', 'Overall': '-'};
                  var it1262Data = combinedData['IT1262'] ??
                      {'Theory': '-', 'Practical': '-', 'Overall': '-'};
                  var it1223Data = combinedData['IT1223'] ??
                      {'Theory': '-', 'Practical': '-', 'Overall': '-'};

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
                            DataCell(
                                Center(child: Text(it1214Data['Theory']!))),
                            DataCell(
                                Center(child: Text(it1214Data['Practical']!))),
                            DataCell(
                                Center(child: Text(it1214Data['Overall']!))),
                          ]),
                          DataRow(cells: [
                            const DataCell(Center(child: Text('IT1223'))),
                            DataCell(
                                Center(child: Text(it1223Data['Theory']!))),
                            DataCell(
                                Center(child: Text(it1223Data['Practical']!))),
                            DataCell(
                                Center(child: Text(it1223Data['Overall']!))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1232'))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                            DataCell(Center(child: Text("-"))),
                          ]),
                          DataRow(cells: [
                            DataCell(Center(child: Text('IT1262'))),
                            DataCell(
                                Center(child: Text(it1262Data['Theory']!))),
                            DataCell(
                                Center(child: Text(it1262Data['Practical']!))),
                            DataCell(
                                Center(child: Text(it1262Data['Overall']!))),
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
