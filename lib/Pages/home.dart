import 'package:flutter/material.dart';
import 'package:pattern_lock/pattern_lock.dart';

import '../Models/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
    controller: controller,
          //physics: NeverScrollableScrollPhysics(),
       itemCount: 2,
       itemBuilder: (context,index){

       var currGame = game[index];
         return Container(
           decoration: const BoxDecoration(
             image: DecorationImage(
               image: AssetImage('images/bg1.png'),
               fit: BoxFit.cover
             )
           ),
           child: Padding(
             padding: const EdgeInsets.all(25.0),
             child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [

                 SafeArea(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text('Word Game' , style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                       const Icon(Icons.settings,size: 25, color: Colors.white,),

                       // back icon
                       Container(
                         height: 30, width: 40,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.white
                           ),
                           child: InkWell(
                               onTap: (){
                                 controller.jumpToPage(index -1);
                               },
                               child: const Icon(Icons.skip_previous,size: 25, color: Colors.deepPurple,))
                       ),

                       // next button
                       Container(
                           height: 30, width: 40,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.white
                           ),
                           child: InkWell(
                               onTap: (){
                                 controller.jumpToPage(index + 1);
                               },
                               child: const Icon(Icons.skip_next,size: 25, color: Colors.deepPurple,))
                       )
                     ],
                   ),
                 ),

                 GridView.builder(
                   shrinkWrap: true,
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 4,
                       mainAxisSpacing: 12,
                       crossAxisSpacing: 12
                     ),
                     itemCount: game[index].boxes.length,
                     itemBuilder: (context,boxIndex){
                       final currBox = game[index].boxes[boxIndex];

                       return Stack(
                         children: [
                           Container(
                             height: 100,
                             width: 100,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(25),
                               color: currBox.value == null ? Colors.transparent : Colors.white,
                             ),
                              child:  Container(

                                child: Center(
                                  child: Text(
                                    currBox.value == null ? ' ' : '${currBox.value}',
                                    style: const TextStyle(fontSize: 35 , fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                           ) ,
                         ],
                       );

                     }),


                 // Container(
                 //   height: 300,
                 //   width: 300,
                 //   decoration: BoxDecoration(
                 //     color: Colors.white.withOpacity(0.5),
                 //     shape: BoxShape.circle
                 //   ),
                 //   child: Padding(
                 //     padding: const EdgeInsets.only(),
                 //
                 //     child: Column(
                 //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                 //       children: [
                 //         Container(
                 //           height: 80, width: 80,
                 //           decoration: const BoxDecoration(
                 //             color: Colors.white,
                 //             shape: BoxShape.circle
                 //           ),
                 //           child: Center(child: Text(currGame.hints[0],style: const TextStyle(fontSize: 40,color: Colors.deepPurple,fontWeight: FontWeight.bold),),),
                 //         ),
                 //         Row(
                 //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //           children: [
                 //             Container(
                 //               height: 80, width: 80,
                 //               decoration: const BoxDecoration(
                 //                   color: Colors.white,
                 //                   shape: BoxShape.circle
                 //               ),
                 //               child: Center(child: Text(currGame.hints[1],style: const TextStyle(fontSize: 40,color: Colors.deepPurple,fontWeight: FontWeight.bold),),),
                 //             ),
                 //             Container(
                 //               height: 80, width: 80,
                 //               decoration: const BoxDecoration(
                 //                   color: Colors.white,
                 //                   shape: BoxShape.circle
                 //               ),
                 //               child: Center(child: Text(currGame.hints[2],style: const TextStyle(fontSize: 40,color: Colors.deepPurple,fontWeight: FontWeight.bold),),),
                 //             ),
                 //           ],
                 //         ),
                 //         Container(
                 //           height: 80, width: 80,
                 //           decoration: const BoxDecoration(
                 //               color: Colors.white,
                 //               shape: BoxShape.circle
                 //           ),
                 //           child: Center(child: Text(currGame.hints[3],style: const TextStyle(fontSize: 40,color: Colors.deepPurple,fontWeight: FontWeight.bold),),),
                 //         ),
                 //       ],
                 //     ),
                 //
                 //
                 //   ),
                 // )

                 // Transform.rotate(
                 //   angle: 0.8,
                 //   child: Stack(
                 //     children: [
                 //
                 //
                 //       Container(
                 //
                 //         height: 380, width: 380,
                 //         decoration: BoxDecoration(
                 //           color: Colors.white.withOpacity(0.5),
                 //           shape: BoxShape.circle
                 //         ),
                 //         child: Column(
                 //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 //           children: [
                 //
                 //             Stack(
                 //               children: [
                 //                 Container(
                 //                   height: 300, width: 300,
                 //                   child: Column(
                 //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 //                     children: [
                 //
                 //                       Row(
                 //                         mainAxisAlignment: MainAxisAlignment.values[5],
                 //                         children: [
                 //                           Container(
                 //                             height: 80, width: 80,
                 //                             decoration: BoxDecoration(
                 //                                 color: Colors.white,
                 //                                 shape: BoxShape.circle
                 //                             ),
                 //                             child: Transform.rotate(
                 //                                 angle: -0.8,
                 //                                 child: Center(child: Text('A',style: TextStyle(
                 //                                     color: Colors.deepPurple,
                 //                                     fontSize: 40,fontWeight: FontWeight.bold),))),
                 //                           ),
                 //
                 //                           Container(
                 //                             height: 80, width: 80,
                 //                             decoration: BoxDecoration(
                 //                                 color: Colors.white,
                 //                                 shape: BoxShape.circle
                 //                             ),
                 //                             child: Transform.rotate(
                 //                                 angle: -0.8,
                 //                                 child: Center(child: Text('A',style: TextStyle(
                 //                                     color: Colors.deepPurple,
                 //                                     fontSize: 40,fontWeight: FontWeight.bold),))),
                 //                           )
                 //                         ],
                 //                       ),
                 //                       Row(
                 //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 //                         children: [
                 //                           Container(
                 //                             height: 80, width: 80,
                 //                             decoration: BoxDecoration(
                 //                                 color: Colors.white,
                 //                                 shape: BoxShape.circle
                 //                             ),
                 //                             child: Transform.rotate(
                 //                                 angle: -0.8,
                 //                                 child: Center(child: Text('A',style: TextStyle(
                 //                                     color: Colors.deepPurple,
                 //                                     fontSize: 40,fontWeight: FontWeight.bold),))),
                 //                           ),
                 //
                 //                           Container(
                 //                             height: 80, width: 80,
                 //                             decoration: BoxDecoration(
                 //                                 color: Colors.white,
                 //                                 shape: BoxShape.circle
                 //                             ),
                 //                             child: Transform.rotate(
                 //                                 angle: -0.8,
                 //                                 child: Center(child: Text('A',style: TextStyle(
                 //                                     color: Colors.deepPurple,
                 //                                     fontSize: 40,fontWeight: FontWeight.bold),))),
                 //                           )
                 //                         ],
                 //                       )
                 //                     ],
                 //                   ),
                 //                 ),
                 //                 Container(
                 //                   height: 300, width: 300, color: Colors.transparent,
                 //                   child: PatternLock(
                 //                       pointRadius: 30,
                 //                       selectedColor: Colors.white,
                 //                       relativePadding: 0.6,
                 //                       selectThreshold: 60,
                 //                       dimension: 2,
                 //                       onInputComplete: (List<int> input){
                 //                         print('$input');
                 //                       }),
                 //                 ),
                 //               ],
                 //             )
                 //
                 //
                 //
                 //
                 //
                 //           ],
                 //         ),
                 //       ),
                 //
                 //
                 //     ],
                 //   ),
                 // ),


          Text('BEST',style: TextStyle(backgroundColor: Colors.white,fontSize: 25,letterSpacing: 5),),
                 Stack(
                   children: [

                     Transform.rotate(
                       angle: 0.8,
                       child: Container(
                         alignment: Alignment.center,
                         height: 300, width: 300,
                         child: const Lock(),
                       ),
                     ),

                     IgnorePointer(
                       // ignoringSemantics: true,
                       child: Container(

                         width: 300, height: 300,
                            child:     Column(
                           mainAxisAlignment: MainAxisAlignment.values[5],
                           children: [
                             Container(
                               height: 80, width:80,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(50)
                               ),
                               child: Center(
                                 child: Text(currGame.hints[3],style: TextStyle(fontSize:35,color: Colors.deepPurple),),
                               ),
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(right: 25.0),
                                   child: Container(
                                     height: 80, width:80,
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(50)
                                     ),
                                     child: Center(
                                       child: Text(currGame.hints[1],style: TextStyle(fontSize:35,color: Colors.deepPurple),),
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 25.0),
                                   child: Container(
                                     height: 80, width:80,
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(50)
                                     ),
                                     child: Center(
                                       child: Text(currGame.hints[2],style: TextStyle(fontSize:35,color: Colors.deepPurple),),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Container(
                               height: 80, width:80,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(50)
                               ),
                               child: Center(
                                 child: Text(currGame.hints[0],style: TextStyle(fontSize:35,color: Colors.deepPurple),),
                               ),
                             ),
                           ],
                         )
                         ,
                       ),
                     ),




                   ],
                 )

               ],
             ),
           ),
         );

       },

      ),

    );
  }
}


class Lock extends StatefulWidget {
  const Lock({super.key});

  @override
  State<Lock> createState() => _LockState();
}

class _LockState extends State<Lock> {
  @override
  Widget build(BuildContext context) {
    return PatternLock(
      notSelectedColor: Colors.transparent,
      selectedColor: Colors.white,
      relativePadding: 0.7,
      pointRadius:35,
      dimension: 2,

      onInputComplete: (List<int> input) {},
    );
  }
}

