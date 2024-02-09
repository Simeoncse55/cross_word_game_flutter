import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration( seconds: 2 ),(){
     Get.off(HomePage());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Colors.deepPurple.shade900],
                ),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60, width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: Text(
                      'W',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepPurple),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60, width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Text(
                          'D',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepPurple),
                        ),
                      ),
                    ),
                    Container(
                      height: 60, width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: Text(
                          '0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60, width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: Text(
                      'R',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.deepPurple),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
              child:
              Column(
             mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                      child:
                      Text('Game !',style: TextStyle(fontSize: 50,
                          fontWeight: FontWeight.bold ,color: Colors.white),),
                  ),
                  Container(
                    height: 190,width: 200,
                  )
                ],
              ))
        ],
      ),

    );
  }
}
