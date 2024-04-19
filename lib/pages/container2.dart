import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomeCard extends StatelessWidget {
  final String title, title2, title3, image;

  const HomeCard(
      {super.key,
      required this.title,
      required this.title2,
      required this.title3,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title3,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title2,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Colors.green),
                ),
                SizedBox(
                  height: 10,
                ),
                Image(image: AssetImage(image))
              ],
            ),
          ],
        ));
  }
}

class Skelton extends StatelessWidget {
  const Skelton({super.key, this.height, this.width});
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}

class HomeCardLoad extends StatefulWidget {
  const HomeCardLoad(
      {super.key, this.title, this.title2, this.title3, this.image});
  final String? title, title2, title3, image;

  @override
  State<HomeCardLoad> createState() => _HomeCardLoadState();
}

class _HomeCardLoadState extends State<HomeCardLoad> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SkeletonAnimation(
                    shimmerColor: Colors.grey[300]!,
                    shimmerDuration: 1200,
                    child: Skelton(
                      width: 50,
                      height: 10,
                    )),
                SizedBox(
                  height: 10,
                ),
                SkeletonAnimation(
                    shimmerColor: Colors.grey[300]!,
                    shimmerDuration: 1200,
                    child: Skelton(
                      width: 20,
                      height: 10,
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SkeletonAnimation(
                    shimmerDuration: 1200,
                    shimmerColor: Colors.grey[300]!,
                    // curve: Curves.bounceOut,
                    // shimmerDuration: ,
                    child: Skelton(
                      width: 50,
                      height: 10,
                    )),
                SizedBox(
                  height: 10,
                ),
                SkeletonAnimation(
                    shimmerDuration: 1200,
                    shimmerColor: Colors.grey[300]!,
                    child: Skelton(
                      width: 20,
                      height: 10,
                    ))
              ],
            ),
          ],
        ));
  }
}
