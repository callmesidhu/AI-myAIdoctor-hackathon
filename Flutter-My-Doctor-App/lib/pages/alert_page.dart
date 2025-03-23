import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  bool _isReminderOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Health Alerts and\n',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),


                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.20),
                        child: Text(
                          'Notifications',
                          style: GoogleFonts.robotoSlab(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),

extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(100, 149, 237, 0.9), // custom blue tone
                    Color.fromRGBO(211, 211, 211, 0.9), // light grey
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SafeArea(
          child:Padding(padding:
          const EdgeInsets.fromLTRB(16, 18, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Medicine Reminders',
                      style: GoogleFonts.roboto(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Switch(
                      value: _isReminderOn,
                      onChanged: (bool newValue) {
                        setState(() {
                          _isReminderOn = newValue;
                        });
                      },
                      activeColor: Colors.blue[800],
                    ),
  ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                      'Appointment Reminders',
                      style: GoogleFonts.roboto(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Switch(
                      value: _isReminderOn,
                      onChanged: (bool newValue) {
                        setState(() {
                          _isReminderOn = newValue;
                        });
                      },
                      activeColor: Colors.blue[800],
                    ),
                  ],
                ),
              ],
            ),
          ),
    ),
    ],
      ),

    );
  }
}