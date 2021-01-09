import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piggy_fund/transaction_list.dart';

import 'model/child.dart';
import 'model/transaction.dart';

Transaction t1 = Transaction(0, 0, new DateTime.utc(2020, 1, 1), 215.00, 15.00, transactionType.allowance);
Transaction t2 = Transaction(0, 0, new DateTime.utc(2020, 1, 1), 200.00, 15.00, transactionType.withdrawal);
List<Transaction> transactionList = [t1, t2];

class ChildDetails extends StatelessWidget {
  ChildDetails({Key key, this.item}) : super(key: key);
  final Child item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.item.firstName.toString()} ${this.item.lastName.toString()}"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          physics: ScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                  Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget> [
                                  Text("${this.item.interestRate.toString()}% Interest"),
                                  Text("\$ ${this.item.allowanceAmt.toString()}/${this.item.allowanceRate.toString()} days"),
                                ]
                            ),
                          ]
                        )
                    ),
                  Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.blueGrey,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                        children:<Widget>[
                          Column(
                            children: [
                              Text("Balance"),
                              Text("\$ ${this.item.balance.toString()}"),
                            ],
                          )
                        ]
                      )
                  ),
                  Container(
                      child: LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                              show: true,
                              leftTitles: SideTitles(
                                  reservedSize: 6,
                                  showTitles: true
                              )
                            ),
                            borderData: FlBorderData(
                              show: false
                            ),
                            lineBarsData: linesBarData1(),
                          )
                      ),
                  ),
                  Text("Summary"),
                  Column(
                    children: [
                      Text("Balance"),
                      Text("\$ ${this.item.balance.toString()}"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Balance"),
                      Text("\$ ${this.item.balance.toString()}"),
                    ],
                  ),

                  Text("Transactions"),
                  TransactionList(items: transactionList)
                //   Container(
                //       padding: EdgeInsets.all(5),
                //       child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: <Widget>[
                //
                //             Expanded(child:TransactionList(items: transactionList))
                //           ])
                // ),
              ]
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

List<LineChartBarData> linesBarData1() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(1, 1),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
    isCurved: true,
    colors: [
      const Color(0xff4af699),
    ],
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
    ),
  );
  final LineChartBarData lineChartBarData2 = LineChartBarData(
    spots: [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
    isCurved: true,
    colors: [
      const Color(0xffaa4cfc),
    ],
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x00aa4cfc),
    ]),
  );
  final LineChartBarData lineChartBarData3 = LineChartBarData(
    spots: [
      FlSpot(1, 2.8),
      FlSpot(3, 1.9),
      FlSpot(6, 3),
      FlSpot(10, 1.3),
      FlSpot(13, 2.5),
    ],
    isCurved: true,
    colors: const [
      Color(0xff27b6fc),
    ],
    barWidth: 8,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
    ),
    dashArray: [5,10]
  );
  return [
    lineChartBarData1,
    lineChartBarData2,
    lineChartBarData3,
  ];
}
