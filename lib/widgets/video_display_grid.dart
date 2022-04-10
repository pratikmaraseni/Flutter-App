// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../model/display_item.dart';
//
// class VideoDisplayGrid extends StatelessWidget {
//   const VideoDisplayGrid({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<DisplayItem> displayItems = [
//       DisplayItem(
//         name: "lorem",
//         image: "assets/ball.svg",
//         callback: () {},
//       ),
//       DisplayItem(
//         name: "lorem",
//         image: "assets/ball.svg",
//         callback: () {},
//       ),
//       DisplayItem(
//         name: "lorem",
//         image: "assets/ball.svg",
//         callback: () {},
//       ),
//       DisplayItem(
//         name: "lorem",
//         image: "assets/ball.svg",
//         callback: () {},
//       ),
//       DisplayItem(
//         name: "lorem",
//         image: "assets/ball.svg",
//         callback: () {},
//       ),
//       DisplayItem(
//         name: "lorem",
//         image: "assets/ball.svg",
//         callback: () {},
//       ),
//     ];
//
//     @override
//     Widget build(BuildContext context) {
//       return GridView.builder(
//         shrinkWrap: true,
//         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             childAspectRatio: 6.5 / 4,
//             maxCrossAxisExtent: 200,
//             mainAxisSpacing: 20.0,
//             crossAxisSpacing: 24.0),
//         itemCount: displayItems.length,
//         itemBuilder: (context, index) {
//           return Stack(
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 right: 0,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(32.0),
//                   child: SvgPicture.asset(
//                     displayItems
//                         .elementAt(index)
//                         .image,
//                     width: 80.0,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Text(
//                   displayItems
//                       .elementAt(index)
//                       .name,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//
