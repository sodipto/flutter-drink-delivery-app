import 'package:drink_app/constants/color-utils.dart';
import 'package:drink_app/pages/homepage/home-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
     backgroundColor: Color(0xFFE2EFC6),
     body: SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Container(
             height: size.height*0.50,
             width: double.infinity,
             color: Color(0xFFE2EFC6),
             child: Center(
               child: Container(
                 margin: EdgeInsets.only(top: size.height*0.05),
                 height: size.height* 0.35,
                 decoration: BoxDecoration(
                     image: DecorationImage(
                         image: AssetImage('assets/images/drink-van.PNG'),
                         fit: BoxFit.fitHeight
                     )
                 ),
               ),
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: size.height*0.05,left: 20,right: 20,bottom: 40),
             height: size.height*0.50,
             width: double.infinity,
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(40),
                   topRight: Radius.circular(40)
               )
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Drink the best drink in town!", textAlign: TextAlign.center, style: TextStyle(color: brandColor,fontSize: 28,fontWeight: FontWeight.bold)),
                 SizedBox(height: 40),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       height: 65,
                       width: 170,
                       child: RaisedButton(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30.0),
                         ),
                         color: buttonColor,
                         textColor: Colors.white,
                         padding: EdgeInsets.all(12.0),
                         onPressed: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => HomePage()),
                           );
                         },
                         child: Text(
                           "Logon",
                           style: TextStyle(
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold
                           ),
                         ),
                       ),
                     ),
                     Container(
                       height: 65,
                       width: 170,
                       child: FlatButton(
                         onPressed:(){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => HomePage()),
                           );
                         },
                         child: Text(
                           "Sign in",
                           style: TextStyle(
                             fontSize: 20.0,
                             color: brandColor,
                             fontWeight: FontWeight.bold
                           ),
                         ),
                         textColor: Colors.white,
                         shape: RoundedRectangleBorder(
                             side: BorderSide(
                             color: brandColor,
                             width: 1,
                             style: BorderStyle.solid
                         ),
                         borderRadius: BorderRadius.circular(30)),
                       )
                     ),
                   ],
                 ),
                 SizedBox(height: 25),
                 Container(
                     height: 65,
                     width: double.infinity,
                     child: FlatButton(
                       onPressed:() {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => HomePage()),
                         );
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           SvgPicture.asset(
                               'assets/icons/facebook.svg',
                               color: brandColor,
                               height: 25
                           ),
                           SizedBox(width:10),
                           Text(
                             "Connect with Facebook",
                             style: TextStyle(
                                 fontSize: 20.0,
                                 color: brandColor
                             ),
                           ),
                         ],
                       ),
                       textColor: Colors.white,
                       shape: RoundedRectangleBorder(
                           side: BorderSide(
                               color: brandColor,
                               width: 1,
                               style: BorderStyle.solid
                           ),
                           borderRadius: BorderRadius.circular(30)),
                     )
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
