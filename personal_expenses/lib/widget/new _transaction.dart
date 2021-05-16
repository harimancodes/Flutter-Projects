import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/model/theme__chooser.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransaction;

  NewTransaction(this.newTransaction);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  DateTime _dateTime = DateTime.now();
  String titleInput, amountInput;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        color: Theme.of(context).backgroundColor,
        height: 400,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              style:
                  TextStyle(color: Theme.of(context).textTheme.headline6.color),
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.headline6.color),
              ),
              onChanged: (val) {
                titleInput = val;
              },
            ),
            TextField(
              style:
                  TextStyle(color: Theme.of(context).textTheme.headline6.color),
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.headline6.color),
              ),
              onChanged: (val) {
                amountInput = val;
              },
              keyboardType: TextInputType.number,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    DateFormat.yMMMEd().format(_dateTime).toString(),
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline6.color),
                  ),
                  FlatButton(
                    child: Text(
                      'Choose date',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                print("Title : $titleInput  Amount : $amountInput");
                if (amountInput == null || titleInput == '') return;
                if (double.parse(amountInput) < 0) return;
                widget.newTransaction(
                  titleInput,
                  double.parse(amountInput),
                  _dateTime,
                );
                Navigator.of(context).pop();
              },
              color: Colors.blue,
              child: Text(
                'Add transaction',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dateTime = pickedDate;
      });
    });
  }
}
