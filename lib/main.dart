import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Torch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFlashOn = false;
  var controller = TorchController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.deepPurple,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text(
              'Flashlight',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          isFlashOn
                              ? 'assets/images/torch_on.png'
                              : 'assets/images/torch_off.png',
                          height: 240,
                          width: 240,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15),
                        CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          minRadius: 40,
                          maxRadius: 55,
                          child: GestureDetector(
                            onTap: () {
                              controller.toggle();
                              isFlashOn = !isFlashOn;
                              setState(() {});
                            },
                            child: Image.asset(
                              isFlashOn
                                  ? 'assets/images/switch_on.png'
                                  : 'assets/images/switch_off.png',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Text('Developed by Samandar',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              )
            ],
          )),
    );
  }
}
