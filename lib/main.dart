import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/pages/note_page.dart';
import 'package:noteapp/widgets/daily_cost.dart';
import 'package:noteapp/widgets/date_new.dart';
import 'package:noteapp/widgets/user_dp.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  final List<DailyCost> _myBalance = [];


  bool _isDark = false;
  DateTime now = DateTime.now();
  late String date = DateFormat('yMMMd').format(now);

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  bool _isIncomes = false;

  void _addNewTransaction() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_priceController.text) ?? 0.0;

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    setState(() {
      _myBalance.add(DailyCost(
        name: enteredTitle,
        price: enteredAmount,
        isIncome: _isIncomes,
        date: DateTime.now(),
      ));
    });

    _titleController.clear();
    _priceController.clear();
    Navigator.of(context).pop();
  }

  void _addTransaction (BuildContext ctx){
    showModalBottomSheet(
      isScrollControlled: true,
        context: ctx,
        builder: (bCtx){
      return Padding(padding: EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        bottom: MediaQuery.of(ctx).viewInsets.bottom + 15,
      ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Title",
              ),
            ),SizedBox(height: 30,),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                hintText: "Amount",
              ),
            ),SizedBox(height: 30,),
            SwitchListTile(
              title: Text(_isIncomes ? "Income" : "Expense"),
                value: _isIncomes,
                onChanged: (val) {
              setState(() {
                _isIncomes = val;
              });
            }),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: _addNewTransaction,
              child: Text("Add"),
            )
          ],
        ),
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
             margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
              Row(children: [DateWidget(date: date),
                SizedBox(width: 140,),
              Row(children: [
                  IconButton(onPressed: (){setState(() {_isDark = !_isDark;});},
                  icon: Icon(_isDark ? Icons.dark_mode : Icons.light_mode_outlined)),
                UserDp(),
              ],
              )
              ]),
                    ] ),
            ),
      ],
        ),
        body: NotePage(myBalance: _myBalance,),floatingActionButton: Builder(
          builder: (context) { // This context now knows about the MaterialApp/Navigator
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () => _addTransaction(context),
              child: const Icon(Icons.add, size: 30),
            );
          }
      ),
      ),
    );
  }
}
