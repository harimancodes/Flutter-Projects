import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/model/theme__chooser.dart';
import 'package:personal_expenses/model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;

  TransactionList(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transaction added yet!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).backgroundColor,
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: ListTile(
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: () =>
                            _deleteTransaction(transactions[index].id),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text("\$${transactions[index].amount}")),
                        ),
                      ),
                      title: Text(
                        "${transactions[index].title}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMEd().format(transactions[index].time),
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline5.color),
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
