import 'package:basecode/Expense.dart';
import 'package:flutter/material.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
            painter: CurvedRectanglePainter(),
          ),
          Column(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 1000,
                    backgroundColor: const Color.fromRGBO(66, 150, 144, 1),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(width: 85),
                  const Text(
                    'Add Expense',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                ],
              )
            ],
          ),
          Positioned(
              top: 200,
              bottom: 200,
              left: 30,
              right: 30,
              child: Container(
                  height: 300,
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(1),
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Expense(),
                                  ));
                            },
                            child: const Text(
                              'Expense',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w900),
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          const Text(
                            'Income',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w900),
                          )
                        ],
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}

class CurvedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(66, 150, 144, 1)
      ..style = PaintingStyle.fill;

    Path path = Path();
    double curveHeight =
        size.height * 0.3; // Adjust this value to reduce the height

    path.moveTo(0, 0);
    path.lineTo(0, curveHeight);
    path.quadraticBezierTo(size.width / 2, curveHeight + size.height * 0.1,
        size.width, curveHeight);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}