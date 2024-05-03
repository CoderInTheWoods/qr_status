// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'QR Scanner',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: QRScannerScreen(),
//     );
//   }
// }

// class QRScannerScreen extends StatefulWidget {
//   @override
//   _QRScannerScreenState createState() => _QRScannerScreenState();
// }

// class _QRScannerScreenState extends State<QRScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   String qrId = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scan QR Code'),
//       ),
//       body: Stack(
//         children: [
//           QRView(
//             key: qrKey,
//             onQRViewCreated: _onQRViewCreated,
//           ),
//           Positioned(
//             top: 20,
//             left: 20,
//             child: IconButton(
//               icon: const Icon(Icons.refresh),
//               onPressed: () {
//                 controller?.toggleFlash();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         qrId = scanData.code!;
//         _fetchQRStatus(qrId);
//       });
//     });
//   }

//   void _fetchQRStatus(String qrId) async {
//     // final response = await http.get(Uri.parse('YOUR_API_ENDPOINT/$qrId'));
//     if (true) {
//       final qrStatus = json
//           .decode('{"qr_id": "ABC123", "qr_status": "Sold"}')['qr_status'];
//       // final qrStatus = json.decode(response.body)['qr_status'];
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => QRStatusScreen(qrStatus)),
//       );
//     } else {
//       throw Exception('Failed to load QR status');
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }

// class QRStatusScreen extends StatelessWidget {
//   final String qrStatus;

//   QRStatusScreen(this.qrStatus);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('QR Status'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Material(
//             borderRadius: const BorderRadius.all(Radius.circular(90)),
//             elevation: 6,
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(90)),
//                   color: qrStatus == "Available"
//                               ? Colors.blue
//                               : qrStatus == "Sold"
//                                   ? Colors.green
//                                   : Colors.red,),
//               padding: const EdgeInsets.all(15),
//               child: const Icon(
//                 Icons.check,
//                 size: 45,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             qrStatus.toUpperCase(),
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
//           ),
//           // Text(
//           //   _getStatusSubtitle(),
//           //   style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
//           // ),
//           const SizedBox(
//             height: 70,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: qrStatus == "Available"
//                               ? Colors.green
//                               : qrStatus == "Sold"
//                                   ? Colors.red
//                                   : Colors.blue,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Text(
//                             _getButtonText(),
//                             style: const TextStyle(
//                                 color: Colors.white, fontSize: 18),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _getButtonText() {
//     switch (qrStatus) {
//       case 'Available':
//         return 'Mark as SOLD';
//       case 'Sold':
//         return 'Mark as RETURNED';
//       case 'Returned':
//         return 'Mark as AVAILABLE';
//       default:
//         return '';
//     }
//   }

//   String _getStatusSubtitle() {
//     switch (qrStatus) {
//       case 'Available':
//         return 'In Inventory.';
//       case 'Sold':
//         return 'In Order';
//       case 'Returned':
//         return 'In Cancellation.';
//       default:
//         return '';
//     }
//   }
// }