import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:untitled/src/presentations/third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String textField = "0";
  String lastOperation = "";
  int operationCount = 0;
  List<String> lastOperations = [""];

  final _key = GlobalKey<AnimatedListState>();

  _buttonClick(String symbol) {
    setState(() {
      if (symbol == "C") {
        textField = "0";
      } else if (symbol == "⌫") {
        textField = textField.substring(0, textField.length - 1);
        if (textField == "") {
          textField = "0";
        }
      } else if (symbol == "=") {
        try {
          operationCount++;
          Parser paprs = Parser();
          Expression exp = paprs.parse(textField);
          ContextModel cm = ContextModel();
          textField = '${exp.evaluate(EvaluationType.REAL, cm)}';
          lastOperations.insert(0, '${exp.evaluate(EvaluationType.REAL, cm)}');
          _key.currentState!.insertItem(0, duration: const Duration(microseconds: 250));
        } catch (e) {
          textField = "Error";
        }
      } else {
        if (textField == "0") {
          textField = symbol;
        } else {
          textField = textField + symbol;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap:(){Navigator.pop(context);}, child: Icon(Icons.navigate_before_rounded, size: 35, ),),
        centerTitle: true,
        title: Text("Вторая страница"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              alignment: Alignment.bottomRight,
              child: Scrollbar(
                child: _buildLastOperations(),
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment.bottomRight,
              child: Text(
                textField,
                maxLines: 2,
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          _buildNumberTab(context),
          SizedBox(height: 20)
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> ThirdPage()));},
          child: Icon(Icons.navigate_next_rounded)),
    );
  }

  Widget _buildLastOperations() {
    return AnimatedList(
      key: _key,
      scrollDirection: Axis.vertical,
      initialItemCount: lastOperations.length,
      itemBuilder: (BuildContext context, index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          key: UniqueKey(),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              lastOperations[index],
              style: TextStyle(color: Colors.black45, fontSize: 25),
            ),
          ),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context, String value, Color color) {
    return InkWell(
      onTap: () => _buttonClick(value),
      child: Container(
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),
          height: MediaQuery.of(context).size.height * 0.1,
          child: Center(
              child: Text(value,
                  style: TextStyle(fontSize: 30, color: Colors.white)))),
    );
  }

  Widget _buildNumberTab(BuildContext context) {
    List<TableRow> rows = [];
    for (int rowIndex = 12; rowIndex > -3; rowIndex--) {
      var firstCol = (rowIndex--).toString();
      var secondCol = (rowIndex--).toString();
      var thirdCol = (rowIndex--).toString();
      var symbol = "+";
      var color = Colors.green;
      if (rowIndex == 9) {
        symbol = "C";
        thirdCol = "(";
        secondCol = ")";
        firstCol = "⌫";
        color = Colors.blueGrey;
      }
      if (rowIndex == 6) {
        symbol = "/";
      }
      if (rowIndex == 3) {
        symbol = "*";
      }
      if (rowIndex == 0) {
        symbol = "-";
      }
      if (rowIndex == -3) {
        thirdCol = ".";
        secondCol = "0";
        firstCol = "=";
      }
      rows.add(
        TableRow(
          children: [
            _buildButton(context, thirdCol, color),
            _buildButton(context, secondCol, color),
            _buildButton(context, firstCol, color),
            _buildButton(context, symbol, Colors.blueGrey),
          ],
        ),
      );
      rowIndex++;
    }

    return Container(
      alignment: Alignment.bottomCenter,
      child: Table(
        children: rows,
      ),
    );
  }
}
