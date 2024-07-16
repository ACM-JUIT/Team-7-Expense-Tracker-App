import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'AllExpenses.dart'; // Import the AllExpenses widget
import 'Expense.dart'; // Import the Expense widget
import 'Notification.dart'; // Import the Notify widget
import 'firestore.dart' as fs; // Import FirestoreService with alias

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background painter
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: CurvedRectanglePainter(),
          ),
          // Positioned container
          Positioned(
            top: 200,
            bottom: 480,
            left: 20,
            right: 20,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Color.fromRGBO(42, 124, 118, 1),
              ),
              height: 50,
              width: 100,
            ),
          ),
          // Column with transaction history
          Column(
            children: <Widget>[
              const SizedBox(height: 460),
              Row(
                children: <Widget>[
                  const SizedBox(width: 30),
                  const Text(
                    'Transaction History',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
                  ),
                  const SizedBox(width: 100),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllExpenses()),
                      );
                    },
                    child: const Text('See all'),
                  ),
                ],
              ),
            ],
          ),
          // Floating action button for notifications
          Positioned(
            top: 70,
            left: 360,
            child: FloatingActionButton(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(42, 124, 118, 1),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Notify(),
                  ),
                );
              },
              child: const Icon(Icons.notification_add),
            ),
          ),
          // StreamBuilder for displaying latest expenses
          Positioned(
            top: 480,
            left: 20,
            right: 20,
            bottom: 100,
            child: StreamBuilder<QuerySnapshot>(
              stream: fs.FirestoreService.getLatestExpensesStream(), // Use alias with prefix 'fs'
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> expenseList = snapshot.data!.docs;

                  if (expenseList.isEmpty) {
                    return const Center(
                      child: Text('No expenses added'),
                    );
                  }

                  return ListView.builder(
                    itemCount: expenseList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = expenseList[index];
                      Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

                      if (data == null) {
                        return const ListTile(
                          title: Text('No data'),
                        );
                      }

                      String? expenseName = data['name'] as String?;
                      double? expenseAmount = data['amount'] as double?;

                      if (expenseName == null || expenseAmount == null) {
                        return const ListTile(
                          title: Text('Invalid data'),
                        );
                      }

                      return ListTile(
                        title: Text(expenseName),
                        subtitle: Text('Amount: \$${expenseAmount.toStringAsFixed(2)}'),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          // Positioned IconButton for adding new expense
          Positioned(
            bottom: 5,
            right: 185,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Expense()),
                );
              },
              icon: const Icon(Icons.add_circle_rounded),
              color: const Color.fromRGBO(42, 124, 118, 1),
              iconSize: 60,
            ),
          ),
          const Positioned(
            top: 80,
            left: 20,

          child: 
          Text('Hi There', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24,),)),
        ],
      ),
    );
  }
}

// Custom painter for the curved background
class CurvedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(66, 150, 144, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    double curveHeight = size.height * 0.3;

    path.moveTo(0, 0);
    path.lineTo(0, curveHeight);
    path.quadraticBezierTo(size.width / 2, curveHeight + size.height * 0.1, size.width, curveHeight);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}