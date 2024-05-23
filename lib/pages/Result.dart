import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Text("1st Year"),
            Text("1st Semester"),
            DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    'Name',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Age',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Role',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('John Doe')),
                    DataCell(Text('25')),
                    DataCell(Text('Developer')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Jane Smith')),
                    DataCell(Text('30')),
                    DataCell(Text('Designer')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('Mike Johnson')),
                    DataCell(Text('35')),
                    DataCell(Text('Manager')),
                  ],
                ),
              ],
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.blue),
              dataRowColor: MaterialStateColor.resolveWith(
                (states) => states.contains(MaterialState.selected)
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.blue.withOpacity(0.1),
              ),
            ),
          ],
        ));
  }
}
