import 'package:drink_app/constants/color-utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidePassword= true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              height: size.height * 0.50,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login3.jpg'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top +20, horizontal: 20),
              child: Text("Welcome \nBack",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold)),
            ),
            Positioned(
              top: size.height * 0.50,
              child: Container(
                height: size.height * 0.50,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: EdgeInsets.only(top:50,left: 40,right: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Please Sign In",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 30),
                      TextField(
                        decoration: new InputDecoration(
                          hintText: 'Email',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: brandColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: brandColor),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Stack(
                        children: [
                          TextField(
                            obscureText: isHidePassword,
                            decoration: new InputDecoration(
                              hintText: 'Password',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: brandColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: brandColor),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined,color: brandColor),
                              onPressed: (){
                                setState(() {
                                  isHidePassword= isHidePassword?false:true;
                                });
                              },
                            ),
                          )
                         ]
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("Forgot password?",
                                style: TextStyle(
                                    color: brandColor,
                                    fontSize: 18)
                            ),
                          ),

                          Text("Sign up",
                              style: TextStyle(
                                  color: brandColor,
                                  fontSize: 18)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.50-40,
              right: 40,
              child: InkResponse(
                onTap: () {
                  Navigator.pushNamed(context, '/category');
                },
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFB8DD41),
                  child: Icon(Icons.arrow_forward,color: Colors.white,size: 40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
