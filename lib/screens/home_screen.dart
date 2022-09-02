import 'dart:math';
import 'package:flutter/material.dart';
import '../components/my_text.dart';
import '../components/routes.dart';
import '../enums/game_enum.dart';
import '../enums/result_enum.dart';
import 'Shared_Preferences.dart';
int CPUScore=0; int UserScore=0;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PrefService _prefService = PrefService();
  GameEnum? userChoice;
  GameEnum? computerChoice;
  ResultEnum? finalResult;

  List cpuSelections = [
    GameEnum.rock,
    GameEnum.paper,
    GameEnum.scissor,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: userChoice == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyText('Rock'),
                  const MyText('Paper'),
                  const MyText('Scissors'),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Pick your weapon',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = GameEnum.rock;
                      });
                      makeComputerSelect();
                      calculations();
                    },
                    child: Image.asset(
                      'assets/images/rock.png',
                      height: 100,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            userChoice = GameEnum.paper;
                          });
                          makeComputerSelect();
                          calculations();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/paper.png',
                            height: 100,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            userChoice = GameEnum.scissor;
                          });
                          makeComputerSelect();
                          calculations();
                        },
                        child: Image.asset(
                          'assets/images/scissor.png',
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            children: [
                              const Text(
                                'Player',
                                style: TextStyle(color: Colors.white),
                              ),
                              MyText('$UserScore')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              const Text(
                                'CPU',
                                style: TextStyle(color: Colors.white),
                              ),
                              MyText('$CPUScore')
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsets.all(12),
                        //       child: ElevatedButton(
                        //           onPressed: () async {
                        //             await _prefService.removeCache("password").whenComplete(() {
                        //               Navigator.of(context).pushNamed(LoginRoute);
                        //             });
                        //           },
                        //         style: ElevatedButton.styleFrom(primary: const Color(0xff6ad79d)),
                        //           child: const Text("Log out",style: TextStyle(fontSize: 20),),
                        //       ),
                        //     )
                        //   ],
                        // ),
                      ],
                    ),

                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: ElevatedButton(
                          onPressed: () async {
                            await _prefService.removeCache("password").whenComplete(() {
                              Navigator.of(context).pushNamed(LoginRoute);
                            });
                          },
                          style: ElevatedButton.styleFrom(primary: const Color(0xff6ad79d)),
                          child: const Text("Log out",style: TextStyle(fontSize: 20),),
                        ),
                      )
                    ],
                  ),
                ],
              )
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(finalResult!.name),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'User',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(
                            'assets/images/${userChoice!.name}.png',
                            height: 100,
                          ),
                        ],
                      ),
                      Column(
                        children:  [
                          const Text(
                            'CPU',
                            style: TextStyle(color: Colors.white),
                          ),

                          //computerChoice!.name
                          Image.asset(//cpu
                            'assets/images/${computerChoice!.name}.png',
                            height: 100,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: const Color(0xff6ad79d)),
                        onPressed: (){
                           {
                            setState(() {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                            });
                          }
                        },
                        child: const Text('Play again ',style: TextStyle(fontSize: 20,color: Colors.white),),

                    ),
                  )
                ],
              )));
  }

  calculations() {
    // if user select rock
    if (userChoice == GameEnum.rock && computerChoice == GameEnum.paper) {
      setState(() {
        finalResult = ResultEnum.lose;
        CPUScore+=1;
      });
      // print(finalResult);
    }
    if (userChoice == GameEnum.rock && computerChoice == GameEnum.rock) {
      setState(() {
        finalResult = ResultEnum.draw;
      });
    }
    if (userChoice == GameEnum.rock && computerChoice == GameEnum.scissor) {
      setState(() {
        finalResult = ResultEnum.win;
        UserScore+=1;
      });
    }

    // if user select paper

    if (userChoice == GameEnum.paper && computerChoice == GameEnum.paper) {
      setState(() {
        finalResult = ResultEnum.draw;
      });
    }
    if (userChoice == GameEnum.paper && computerChoice == GameEnum.scissor) {
      setState(() {
        finalResult = ResultEnum.lose;
        CPUScore+=1;
      });
    }
    if (userChoice == GameEnum.paper && computerChoice == GameEnum.rock) {
      setState(() {
        finalResult = ResultEnum.win;
        UserScore+=1;
      });
    }

    // if user select scissor
    if (userChoice == GameEnum.scissor && computerChoice == GameEnum.paper) {
      setState(() {
        finalResult = ResultEnum.win;
        UserScore+=1;
      });
    }

    if (userChoice == GameEnum.scissor && computerChoice == GameEnum.rock) {
      setState(() {
        finalResult = ResultEnum.lose;
        CPUScore+=1;
      });
    }

    if (userChoice == GameEnum.scissor && computerChoice == GameEnum.scissor) {
      setState(() {
        finalResult = ResultEnum.draw;
      });
    }
  }

  makeComputerSelect() {
    setState(() {
      Random random = Random();
      int selected = random.nextInt(3);
      computerChoice = cpuSelections[selected];
    });
  }
}
