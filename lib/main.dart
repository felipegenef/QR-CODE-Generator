import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  String qrdata = '';
  @override
  Widget build(BuildContext context) {
    var qrWidth = MediaQuery.of(context).size.width * 0.5;
    var inputWidth = MediaQuery.of(context).size.width * 0.75;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            QrImage(
              data: qrdata,
              version: QrVersions.auto,
              size: qrWidth,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: inputWidth),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter your QR Code',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: Colors.black12,
                ),
                onChanged: (newValue) {
                  setState(() {
                    qrdata = newValue;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
