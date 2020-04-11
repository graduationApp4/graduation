import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'payment.dart';

class timer extends StatefulWidget {
  @override
  _timerState createState() => _timerState();
}

class _timerState extends State<timer> with TickerProviderStateMixin {

  AnimationController controller;

  String get timeString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
          title: Center(
            child: Text("Timer"),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.timer), onPressed: () {})
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: FractionalOffset.center,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: AnimatedBuilder(
                            animation: controller,
                            builder: (BuildContext context, Widget child) {
                              return new CustomPaint(
                                painter: TimerPainter(
                                  animation: controller,
                                  backgroundColor: Colors.white,
                                  color: Colors.orangeAccent,
                                ),
                              );
                            },
                          ),), Align
                          (alignment: FractionalOffset.center,
                          child: Column(
                            children: <Widget>[
                              AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: new Text (
                                      timeString,
                                      style: themeData.textTheme.display4,
                                    ),
                                  );
                                },
                              ),
                              Text(
                                "time remaining for your order",
                                style: themeData.textTheme.subhead,
                                textAlign: TextAlign.center,

                              )
                            ],
                          ),

                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(

                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (BuildContext context, Widget child) {
                          return new Icon (controller.isAnimating
                              ? Icons.local_dining
                              : Icons.done,color: Colors.white,);
                        },
                      ),
                      backgroundColor: Colors.orange,
                      onPressed: () {
                          controller.reverse(
                              from: controller.value == 0.0 ? 1.0 : controller
                                  .value);

                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){

                          return PaymentPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    child: Center(
                      child: Text('Proceed To Payment',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ));
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,


  }) :super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}