// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          const Text(
            "1st Year",
            style: TextStyle(fontSize: 30),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 35,
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
                  'Practiacal',
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
            rows: const [
              DataRow(
                cells: [
                  DataCell(Center(child: Text('IT1262'))),
                  DataCell(Center(child: Text('A'))),
                  DataCell(Center(child: Text('A+'))),
                  DataCell(Center(child: Text('A+'))),
                ],
              ),
            ],
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
            dataRowColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? Colors.blue.withOpacity(0.2)
                  : Colors.blue.withOpacity(0.0),
            ),
            border: TableBorder.all(
                color: Color.fromARGB(255, 255, 255, 255), width: 1.5),
          ),
        ],
      ),
    );
  }
}
