import 'package:basecode/Account.dart';
import 'package:basecode/Data.dart';
import 'package:basecode/Friends.dart';
import 'package:basecode/Message.dart';
import 'package:basecode/security.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          Positioned(
              top: 100,
              left: 10,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: const Color.fromRGBO(66, 150, 144, 1),
                foregroundColor: Colors.white,
                elevation: 1000,
                child: const Icon(Icons.arrow_back_ios),
              )),
          const Positioned(
              top: 112,
              left: 185,
              child: Text(
                'Profile',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              )),
          Positioned(
              top: 250,
              left: 170,
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(90)),
                    color: Colors.red),
                child: ClipOval(
                  child: Image.asset(
                    'assets/hulk.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Column(
            children: <Widget>[
              const SizedBox(
                height: 450,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 30,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Friend(),
                          ));
                    },
                    icon: const Icon(Icons.diamond),
                    color: Colors.green,
                    iconSize: 34,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Friend(),
                            ));
                      },
                      child: const Text(
                        'Invite Friends',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.4,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 27,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Account(),
                          ));
                    },
                    icon: const Icon(Icons.man_3),
                    iconSize: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Account(),));
                      },
                      child:const Text(
                        'Account Info',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ) )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 27,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Message(),
                          ));
                    },
                    icon: const Icon(Icons.message_sharp),
                    iconSize: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Message(),));
                      },
                      child:const Text(
                        'Message Centre',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ) ),
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 27,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Security(),
                          ));
                    },
                    icon: const Icon(Icons.security),
                    iconSize: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Security(),));
                      },
                      child:const Text(
                        'Login and Security',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ) )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 27,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Data(),
                          ));
                    },
                    icon: const Icon(Icons.privacy_tip),
                    iconSize: 40,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Data(),));
                      },
                      child:const Text(
                        'Data and Privacy',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ) )
                ],
              )
            ],
          )
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
