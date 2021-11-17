import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NetworkingHeader implements SliverPersistentHeaderDelegate  {
  @override
  final double minExtent;
  @override
  final double maxExtent;
  
  NetworkingHeader({
    required this.minExtent,
    required this.maxExtent
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
       fit: StackFit.expand,
       
       children: [
         Container(
           decoration: const BoxDecoration(
             gradient: LinearGradient(
               //colors: [Colors.transparent, Colors.black54],
               colors: [
                 Color(0xff6058e8), 
                 Colors.black,
               ],
               stops: [0.5, 1.0],
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               tileMode: TileMode.repeated,
            ),
           ),
         ),
         Image.asset("assets/images/image.png", fit: BoxFit.cover, ),
         const Positioned(
           left: 16.0,
           right: 16.0,
           bottom: 16.0,
           child: Text(
             "Randald VB", 
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
               color: Colors.grey,
             ),
           ),
         ),
       ],
    );
  }

  double titleOpacity(double shrinkOffset){
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate){
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
