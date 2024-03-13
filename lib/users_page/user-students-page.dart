import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:servisify/utils2.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 1440;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // userstudentspagepjW (27:2)
        padding: EdgeInsets.fromLTRB(21 * fem, 11 * fem, 39 * fem, 11 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff000000),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupmx7e8VJ (HX4HdWjwzfvB57RwzZMx7e)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 77 * fem, 43 * fem),
              padding:
                  EdgeInsets.fromLTRB(17 * fem, 21 * fem, 20 * fem, 21 * fem),
              height: 959 * fem,
              decoration: BoxDecoration(
                color: Color(0xff565656),
                borderRadius: BorderRadius.circular(11 * fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // autogroupds2pRUQ (HX4Hpg622AMeaS6fhUDS2p)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 13 * fem, 869 * fem),
                    padding: EdgeInsets.fromLTRB(
                        23 * fem, 17 * fem, 23 * fem, 12 * fem),
                    width: 241 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff7a7a7a),
                      borderRadius: BorderRadius.circular(9 * fem),
                    ),
                    child: Text(
                      'Search a Service',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  Container(
                    // autogroup2bacgv8 (HX4HtfyMeBtR4FUL1b2bAc)
                    width: 55 * fem,
                    height: 48 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff209dc3),
                      borderRadius: BorderRadius.circular(11 * fem),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          // go1xQ (28:8)
                          left: 17.5 * fem,
                          top: 12.5 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 24 * fem,
                                height: 21 * fem,
                                child: Text(
                                  'Go',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 17 * ffem,
                                    fontWeight: FontWeight.w800,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // goVsa (34:11)
                          left: 17.5 * fem,
                          top: 12.5 * fem,
                          child: Center(
                            child: Align(
                              child: SizedBox(
                                width: 24 * fem,
                                height: 21 * fem,
                                child: Text(
                                  'Go',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 17 * ffem,
                                    fontWeight: FontWeight.w800,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupwfkxBkQ (HX4J7LGvmwQBF19vLHwFkx)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 7 * fem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // autogroupvgravhz (HX4JR5GNDgSacwVuyBvGRA)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 43.5 * fem),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          // services4JQ (28:9)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 78 * fem, 9 * fem),
                            child: Text(
                              'Services',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w800,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          // aboutusZW4 (33:2)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 72.5 * fem, 10 * fem),
                            child: Text(
                              'About us',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w800,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          // contactusrzx (33:3)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 102 * fem, 12 * fem),
                            child: Text(
                              'Contact us',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w800,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupk9zkyJt (HX4JbV8gh3LunYfCNCk9zk)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 71 * fem, 3 * fem),
                          width: 63 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group268c (28:13)
                                margin: EdgeInsets.fromLTRB(
                                    7 * fem, 0 * fem, 8 * fem, 5.12 * fem),
                                width: double.infinity,
                                height: 44.38 * fem,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/page-1/images/ellipse-1.png',
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Center(
                                    child: Text(
                                      'A',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                // profileKGG (29:14)
                                child: Text(
                                  'Profile',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupisa4epL (HX4JjytXdr6YJf5UXhisA4)
                          width: 113 * fem,
                          height: 75.5 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // notificationnvY (31:19)
                                left: 0 * fem,
                                top: 50.5 * fem,
                                child: Center(
                                  child: Align(
                                    child: SizedBox(
                                      width: 113 * fem,
                                      height: 25 * fem,
                                      child: Text(
                                        'Notification',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 20 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2125 * ffem / fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // notf1sSC (30:15)
                                left: 37 * fem,
                                top: 5 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 52 * fem,
                                    height: 46 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/notf-1.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // group3zFv (31:18)
                                left: 69 * fem,
                                top: 0 * fem,
                                child: Container(
                                  width: 20 * fem,
                                  height: 20 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xfffe0000),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                  ),
                                  child: Center(
                                    child: Center(
                                      child: Text(
                                        '5',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 10 * ffem,
                                          fontWeight: FontWeight.w800,
                                          height: 1.2125 * ffem / fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupktaxfN4 (HX4K2UR3phuhnQF5KSKtax)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 76 * fem, 0 * fem),
                    padding: EdgeInsets.fromLTRB(
                        74 * fem, 90 * fem, 74 * fem, 565 * fem),
                    width: 881 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * fem),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/page-1/images/rectangle-10-bg.png',
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          // welcomeabeljsi (33:6)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 39.5 * fem),
                            width: double.infinity,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: SafeGoogleFont(
                                  'Lao Muang Don',
                                  fontSize: 40 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2569999695 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Welcome ',
                                    style: SafeGoogleFont(
                                      'Baloo Tammudu',
                                      fontSize: 40 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2575 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Abel',
                                    style: SafeGoogleFont(
                                      'Baloo Tammudu',
                                      fontSize: 40 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2575 * ffem / fem,
                                      color: Color(0xff209dc3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupdqjqvqi (HX4KAigJv8pHXGpsiJdQJQ)
                          margin: EdgeInsets.fromLTRB(
                              24 * fem, 0 * fem, 195.5 * fem, 10.5 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                // youhaveorederedFsz (33:7)
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 86.5 * fem, 0 * fem),
                                  child: Text(
                                    'You have oredered',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Baloo Tammudu',
                                      fontSize: 30 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2575 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                // pendingordersAzx (33:9)
                                child: Text(
                                  'Pending Orders',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Baloo Tammudu',
                                    fontSize: 30 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2575 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupwlxkK7A (HX4KG8gxMxof67GaifwLxk)
                          margin: EdgeInsets.fromLTRB(
                              35 * fem, 0 * fem, 212 * fem, 0 * fem),
                          width: double.infinity,
                          height: 48 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroupttjnpZi (HX4KM3iS736w6U3LBmttjN)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 124 * fem, 0 * fem),
                                width: 181 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff209dc3),
                                  borderRadius: BorderRadius.circular(11 * fem),
                                ),
                                child: Center(
                                  child: Center(
                                    child: Text(
                                      '30',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 25 * ffem,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // autogroupmeysg68 (HX4KQYcc2Jwc1ok2xdMeyS)
                                width: 181 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff209dc3),
                                  borderRadius: BorderRadius.circular(11 * fem),
                                ),
                                child: Center(
                                  child: Center(
                                    child: Text(
                                      '20',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 25 * ffem,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
