import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'firebase_auth.dart';

class Skip extends StatefulWidget {
  const Skip({Key? key}) : super(key: key);

  @override
  State<Skip> createState() => _SkipState();
}

class _SkipState extends State<Skip> {
  List<PageViewModel> getpages() {
    return [
      PageViewModel(
        title: '',
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/doc.png',
              height: 300,
            ),
            SizedBox(height: 30),
            Text(
              'Search Doctors',
              style:
                  GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            Text(
              'Find popular doctors nearby you',
              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
      PageViewModel(
        title: '',
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 23),
            Image.asset(
              'assets/disease.png',
              height: 300,
              //fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Text(
              'Search Disease',
              style:
                  GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            Text(
              'Find information about disease',
              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.lightBlue[100],
        pages: getpages(),
        showNextButton: false,
        done: SizedBox(
          height: 48,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.blue[300],
            shadowColor: Colors.blueGrey[200],
            elevation: 5,
            child: Center(
              child: Text(
                'Continue',
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        onDone: () => _pushPage(context, const FireBaseAuth()),
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}
