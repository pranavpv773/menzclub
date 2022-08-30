// import 'package:flutter/material.dart';
// import 'package:menz_cart_app/app/constants/colors.dart';
// import 'package:menz_cart_app/app/global/view_model/global_provider.dart';
// import 'package:provider/provider.dart';

// class BottomNavItems extends StatelessWidget {
//   const BottomNavItems({
//     Key? key,
//     required this.index,
//     required this.section,
//     required this.icon1,
//     required this.icon2,
//     required this.check,
//   }) : super(key: key);
//   final int index;
//   final String section;
//   final IconData icon1;
//   final IconData icon2;
//   final bool check;
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<GlobalProvider>(
//       builder: (context, value, _) {
//         return IconButton(
//           enableFeedback: false,
//           onPressed: () {
//             value.onTabIndexChange(index);
//             context.read<GlobalProvider>().onTabAppbarCheck(check);
//           },
//           icon: value.pageIndex == index
//               ? BottomNavIcon(
//                   icon: icon1,
//                 )
//               : NonBottomNavIcon(
//                   icon: icon2,
//                 ),
//         );
//       },
//     );
//   }
// }

// class NonBottomNavIcon extends StatelessWidget {
//   const NonBottomNavIcon({
//     Key? key,
//     required this.icon,
//   }) : super(key: key);
//   final IconData icon;
//   @override
//   Widget build(BuildContext context) {
//     return Icon(
//       icon,
//       color: const Color.fromARGB(255, 114, 108, 108),
//       size: 23,
//     );
//   }
// }

// class BottomNavIcon extends StatelessWidget {
//   const BottomNavIcon({
//     Key? key,
//     required this.icon,
//   }) : super(key: key);
//   final IconData icon;
//   @override
//   Widget build(BuildContext context) {
//     return Icon(
//       icon,
//       color: primary,
//       size: 25,
//     );
//   }
// }
