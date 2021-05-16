import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_expenses/widget/chart.dart';
import 'package:personal_expenses/widget/new%20_transaction.dart';
import 'package:personal_expenses/widget/transaction_list.dart';

import 'model/theme__chooser.dart';
import 'model/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Personal Expenses",
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme.darkTheme(),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
//    Transaction(id: 'E301', title: 'Shoes', amount: 599, time: DateTime.now()),
//    Transaction(
//        id: 'E302', title: 'Black Shirt', amount: 550, time: DateTime.now()),
//    Transaction(
//        id: 'E301', title: 'CAT Mask', amount: 30, time: DateTime.now()),
  ];

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            child: SingleChildScrollView(
              child: NewTransaction(_addNewTransaction),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      backgroundColor: Colors.blue,
      title: Text("Personal Expenses"),
      actions: [
        IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              _startAddNewTransaction(context);
            })
      ],
    );
    final mainAppHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: mainAppHeight * 0.3,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: mainAppHeight * 0.7,
              child: TransactionList(_userTransactions, _deleteTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.time.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime dateTime) {
    final newTrans = Transaction(
        id: DateTime.now().toString(),
        amount: amount,
        time: dateTime,
        title: title);
    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }
}
