import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:quiver/collection.dart';
import '../Models/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();
  late Game currGame;

  int _currentIndex = 0;

  void _forward(int index) {
    final page = index + 1;
    if (index >= (boxes.length - 1)) return;
    controller.jumpToPage(index + 1);
  }

  void _backward(int index) {
    final page = index - 1;
    // if (page.isNegative) return;
    controller.jumpToPage(page);
  }

  // void _incrementIndex(int index) {
  //   controller.jumpToPage(index + 1);
  //   // setState(() {
  //   //   _currentIndex = index < boxes.length ?
  //   //       _currentIndex+1 :
  //   //       _currentIndex;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shuffle_rounded),
        onPressed: () {
          currGame.hints.shuffle();
          setState(() {});
        },
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        //physics: NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) {
          print(index);
          var _level = index + 1;
          var _hintBadge = 3;

          currGame = game[index];

          return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft, colors: [
              Colors.black87,
              Colors.deepPurple,
            ])
                // image: DecorationImage(image: AssetImage('images/bg1.png'), fit: BoxFit.cover),
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
                        Text(
                          'Level $_level',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),

                        /// Hint Badge...
                        InkWell(
                          onTap: () {},
                          child: Badge(
                              smallSize: 40,
                              label: Text(
                                '$_hintBadge',
                                style: TextStyle(fontSize: 12),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                // color: Colors.white,
                                child: Center(
                                  child: Image.asset(
                                    'images/hint.png',
                                    height: 40,
                                  ),
                                ),
                              )),
                        ),

                        // back icon
                        Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: InkWell(
                                onTap: () {
                                  _backward(index);
                                },
                                child: const Icon(
                                  Icons.skip_previous,
                                  size: 25,
                                  color: Colors.deepPurple,
                                ))),

                        // next button
                        Container(
                            height: 30,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: InkWell(
                                onTap: () {
                                  controller.jumpToPage(index + 1);
                                },
                                child: Icon(
                                  Icons.skip_next,
                                  size: 25,
                                  color: Colors.deepPurple,
                                )))
                      ],
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: currGame.gridCount,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 4,
                      ),
                      itemCount: game[index].boxes.length,
                      itemBuilder: (context, boxIndex) {
                        final currBox = game[index].boxes[boxIndex];

                        return Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: currBox.value == null
                                    ? Colors.transparent
                                    : Colors.white,
                              ),
                              child: Container(
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      currBox.filled
                                          ? (currBox.value ?? "")
                                          : "",
                                      style: const TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  Stack(
                    children: [
                      Transform.rotate(
                        angle: 0.7,
                        child: Container(
                          alignment: Alignment.center,
                          height: 300,
                          width: 300,
                          child: PatternLock(
                            relativePadding: 1,
                            selectThreshold: 39,
                            notSelectedColor: Colors.white,
                            selectedColor: Colors.white,
                            pointRadius: 30,
                            dimension: 2,
                            onInputComplete: (List<int> input) {
                              final hints = currGame.hints;
                              debugPrint(hints.toString());
                              debugPrint(input.toString());

                              String answer = '';
                              input.forEach((element) {
                                answer += hints[element];
                              });
                              final ans = currGame.answers
                                  .where((e) =>
                                      e.value?.toLowerCase() ==
                                      answer.toLowerCase())
                                  .firstOrNull;
                              if (ans != null) {
                                currGame.boxes[ans.position[0]].filled = true;
                                currGame.boxes[ans.position[1]].filled = true;
                                if (answer.length == 3 || answer.length == 4) {
                                  currGame.boxes[ans.position[2]].filled = true;
                                }
                                if (answer.length == 4) {
                                  currGame.boxes[ans.position[3]].filled = true;
                                }
                              }
                              setState(() {});

                              // debugPrint(answer);
                            },
                          ),
                        ),
                      ),
                      IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 6)),
                          width: 300,
                          height: 300,
                          child: Container(
                            height: 300,
                            width: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.values[5],
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 28.0, right: 10),
                                  child: Text(
                                    currGame.hints[0],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0, top: 10),
                                      child: Text(
                                        currGame.hints[2],
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 30),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 0.0, bottom: 10),
                                      child: Text(
                                        currGame.hints[1],
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 30),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 26, left: 15),
                                  child: Text(
                                    currGame.hints[3],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
