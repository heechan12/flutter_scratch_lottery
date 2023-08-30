import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratchBox extends StatefulWidget {
  ScratchBox({
    required this.image,
    this.onScratch,
    this.animation,
    required this.isDone,
  });

  final String image;
  final VoidCallback? onScratch;
  final Animation<double>? animation;

  final Function(bool result) isDone;

  @override
  _ScratchBoxState createState() => _ScratchBoxState();
}

class _ScratchBoxState extends State<ScratchBox> {
  bool isScratched = false;
  double opacity = 0.5;
  final key = GlobalKey<ScratcherState>();

  @override
  Widget build(BuildContext context) {
    var icon = AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 750),
      child: Image.asset(
        widget.image,
        width: 70,
        height: 70,
        fit: BoxFit.contain,
      ),
    );

    var boxSize =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width * 0.5
            : MediaQuery.of(context).size.height * 0.5;

    return Column(
      children: [
        Container(
          width: boxSize,
          height: boxSize,
          margin: const EdgeInsets.all(10),
          child: Scratcher(
            key: key,
            accuracy: ScratchAccuracy.low,
            color: Colors.blueGrey,
            image: Image.asset('assets/scratch.png'),
            brushSize: kIsWeb ? 80 : 40,
            threshold: 50,
            onThreshold: () {
              print('threshold reached');
              setState(() {
                opacity = 1;
                isScratched = true;
                key.currentState
                    ?.reveal(duration: const Duration(milliseconds: 3000));
              });
              widget.onScratch?.call();
              widget.isDone(true);
            },
            onScratchStart: () {
              print('Scratch Start');
            },
            child: Container(
              // height: 300,
              // width: 300,
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: widget.animation == null
                  ? icon
                  : ScaleTransition(
                      scale: widget.animation!,
                      child: icon,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
