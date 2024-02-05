import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        //physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          var currGame = game[index];
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg1.png'), fit: BoxFit.cover),
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
                        const Text(
                          'Word Game',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        const Icon(
                          Icons.settings,
                          size: 25,
                          color: Colors.white,
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
                                  controller.jumpToPage(index - 1);
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
                                child: const Icon(
                                  Icons.skip_next,
                                  size: 25,
                                  color: Colors.deepPurple,
                                )))
                      ],
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemCount: game[index].boxes.length,
                      itemBuilder: (context, boxIndex) {
                        final currBox = game[index].boxes[boxIndex];

                        return Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: currBox.value == null
                                    ? Colors.transparent
                                    : Colors.white,
                              ),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    currBox.value == null
                                        ? ' '
                                        : '${currBox.value}',
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  Text(
                    'BEST',
                    style: TextStyle(
                        backgroundColor: Colors.white,
                        fontSize: 25,
                        letterSpacing: 5),
                  ),
                  Stack(
                    children: [
                      Transform.rotate(
                        angle: 0.8,
                        child: Container(
                          alignment: Alignment.center,
                          height: 300,
                          width: 300,
                          child: PatternLock(
                            notSelectedColor: Colors.transparent,
                            selectedColor: Colors.white,
                            relativePadding: 0.7,
                            pointRadius: 35,
                            dimension: 2,
                            onInputComplete: (List<int> input) {
                              final hints = currGame.hints;
                              debugPrint(hints.toString());
                              debugPrint(input.toString());

                              String answer = '';
                              input.forEach((element) {
                                answer += hints[element];
                              });
                              debugPrint(answer);
                            },
                          ),
                        ),
                      ),
                      IgnorePointer(
                        // ignoringSemantics: true,
                        child: Container(
                          width: 300,
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.values[5],
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Text(
                                    currGame.hints[0],
                                    style: TextStyle(
                                        fontSize: 35, color: Colors.deepPurple),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 25.0),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                        child: Text(
                                          currGame.hints[2],
                                          style: TextStyle(
                                            fontSize: 35,
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                        child: Text(
                                          currGame.hints[1],
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Colors.deepPurple),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Text(
                                    currGame.hints[3],
                                    style: TextStyle(
                                        fontSize: 35, color: Colors.deepPurple),
                                  ),
                                ),
                              ),
                            ],
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

