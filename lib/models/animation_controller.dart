import 'dart:math';

import 'package:flutter/material.dart';

import 'bag_item.dart';

class Controller extends StatefulWidget {
  final BagItem bagItem;
  const Controller({super.key, required this.bagItem});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _animation;

  AnimationStatus _status = AnimationStatus.dismissed;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_status == AnimationStatus.dismissed) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0015)
            ..rotateY(pi * _animation.value),
          child: _animation.value <= 0.5
              ? Image.network(
                  widget.bagItem.image,
                  height: 250,
                  width: 250,
                )
              : Image.network(
                  widget.bagItem.image,
                  height: 250,
                  width: 250,
                )),
    );
  }
}
