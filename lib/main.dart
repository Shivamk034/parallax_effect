import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> str = [
    'This is',
    'Parallax Effect',
    'Did you find ',
    'This Intresting',
    'Let me Know',
  ];

  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
      controller: controller,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          child: Stack(children: [
            Container(
              transform: Matrix4.identity()..translate(0.0, controller.hasClients ? (-(index * MediaQuery.of(context).size.height) + controller.position.pixels) : 0.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/${index + 1}.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                str[index],
                style: GoogleFonts.kaushanScript(
                  color: Colors.white,
                  fontSize: 100,
                ),
              ),
            )
          ]),
        );
      },
    ));
  }
}
