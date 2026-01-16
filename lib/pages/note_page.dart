import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/widgets/daily_cost.dart';
import '../widgets/seperator_line.dart';
import '../widgets/title_value.dart';

class NotePage extends StatelessWidget {
  final List<DailyCost> myBalance;

  const NotePage({
    super.key,
    required this.myBalance
  });

  double get totalIncome => myBalance
      .where((item) => item.isIncome)
      .fold(0.0, (sum , item) => sum + item.price);

  double get totalExpense => myBalance
      .where((item) => !item.isIncome)
      .fold(0.0, (sum , item) => sum + item.price);

 double get totalBalance => totalIncome - totalExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18 , vertical: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              children: [
              TitleValue(name: 'Income',),
              SizedBox(height: 5,),
              Text('RS ${totalIncome}',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),
              ),],),
            SeperatorLine(),
            Column(children: [
              TitleValue(name: 'Expense',),SizedBox(height: 5,),
              Text('RS ${totalExpense}',style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),),],),
              SeperatorLine(),
              Column(children: [
              TitleValue(name: 'Balance',),SizedBox(height: 5,),
              Text('RS ${totalBalance}',style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange
              ),),],)
          ],
          ),
  Divider(thickness: 2,),
          Expanded(
            child: ListView.builder(
                itemCount: myBalance.length,
                itemBuilder: (context , index){
                  final item = myBalance[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: ListTile(
                  leading: Icon(Icons.attach_money),
                  title: Text("${item.name}",style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Text("${DateFormat('hh:mm a').format(item.date)}",style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade500
                  ),),
                  trailing: Text('${item.price}',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: item.isIncome ? Colors.green : Colors.red,
                  ),),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

