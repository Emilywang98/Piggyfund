import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piggy_fund/new_transaction.dart';
import 'package:piggy_fund/transaction_list.dart';
import 'model/child.dart';
import 'edit_child.dart';

const oxfordBlue = const Color(0xFF040027);
const mikadoYellow = const Color(0xffffc600);
const pictorialCarmine = const Color(0xFFca054d);
const mediumPurple = const Color(0xFF5005CA);

class ChildSummary extends StatefulWidget{
  Child item;
  ChildSummary({Key key, this.item}) : super(key: key);
  @override
  _ChildSummaryState createState() => _ChildSummaryState();
}

class _ChildSummaryState extends State<ChildSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.item.firstName.toString()} ${widget.item.lastName.toString()}"),
        backgroundColor: oxfordBlue,
        centerTitle: true,
        actions: <Widget>[],
        leading: new Container()
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                color: oxfordBlue
            ),
          ),
          SingleChildScrollView(
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
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("interest rate", style: Theme.of(context).textTheme.headline2),
                                          Text("${widget.item.interestRate.toString()}% / year", style: Theme.of(context).textTheme.headline3),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("weekly allowance", style: Theme.of(context).textTheme.headline2),
                                          Text("\$ ${widget.item.allowanceAmt.toString()}/${widget.item.allowanceRate.toString()} days", style: Theme.of(context).textTheme.headline3),
                                        ],
                                      ),
                                    ),
                                  ]
                              ),
                            ]
                          )
                      ),
                    Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: mediumPurple,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children:<Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("balance"),
                                Text("\$ ${widget.item.balance.toString()}", style: Theme.of(context).textTheme.headline4),
                              ],
                            )
                          ]
                        )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
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
                    Text("Monthly Summary", style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Money in:        \$100.00", style: Theme.of(context).textTheme.headline3),
                          Text("Money out:      \$20.00", style: Theme.of(context).textTheme.headline3),
                          Text("Interest gain:   \$5.00", style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                    ),
                    Text("All Time Summary", style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Money in:        \$100.00", style: Theme.of(context).textTheme.headline3),
                          Text("Money out:      \$20.00", style: Theme.of(context).textTheme.headline3),
                          Text("Interest gain:   \$5.00", style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                    ),


                    Text(
                      "Transactions",
                      style: TextStyle(
                        color: mikadoYellow,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    TransactionList(items: widget.item.transactions)
                ]
            ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_balance_wallet),
        backgroundColor: pictorialCarmine,
        onPressed: (){
          _awaitAddTransaction(context);
        },
      ),
    );
  }
  void _awaitAddTransaction(BuildContext context) async{
    final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> NewTransaction(item: widget.item))
    );
    setState((){
      widget.item = result;
    });
  }
}

List<LineChartBarData> linesBarData1() {
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
    barWidth: 3,
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
    barWidth: 3,
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
    lineChartBarData2,
    lineChartBarData3,
  ];
}
