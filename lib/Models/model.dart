class Box {
  String? value;
  final int position;
  bool filled;

  Box({required this.value, required this.position, this.filled = false});
}

class Answers {
  final String? value;
  final List<int> position;

  Answers({required this.value, required this.position});
}

class Game {
  final int gridCount;
  final List<Box> boxes;
  final List<Answers> answers;
  final List<String> hints;

  Game(
      {required this.gridCount,
      required this.boxes,
      required this.answers,
      required this.hints});
}

List<Game> game = [
  Game(
      gridCount: 5,
      boxes: boxes,
      answers: answers,
      hints: ['B','E','N','D'],
  ),
  Game(
      gridCount: 4,
      boxes: second,
      answers: answer_2,
      hints: ['Y', 'A', 'R', 'D']),
  Game(
      gridCount: 4,
      boxes: third,
      answers: answer_3,
      hints: ['A', 'I' ,'P','N']),
  Game(gridCount: 5, boxes: fourth, answers: answer_4, hints: ['Y','E','S','A']),
  Game(gridCount: 5, boxes: five, answers: answer_5, hints: ['Y','A','R','D']),
  Game(gridCount: 5, boxes: six, answers: answer_6, hints: ['P','A','T','H']),
  Game(gridCount : 5, boxes: seven, answers: answer_7, hints: ['B','I','R','D'])
];


//first
List<Box> boxes = [
  Box(value: null, position: 0),
  Box(value: null, position: 1),
  Box(value: 'B', position: 2),
  Box(value: 'E', position: 3),
  Box(value: 'N', position: 4),
  Box(value: null, position: 5),
  Box(value: 'D', position: 6),
  Box(value: null, position: 7),
  Box(value: 'N', position: 8),
  Box(value: null, position: 9),
  Box(value: 'B', position: 10),
  Box(value: 'E', position: 11),
  Box(value: 'N', position: 12),
  Box(value: 'D', position: 13),
  Box(value: null, position: 14),
  Box(value: null, position: 15),
  Box(value: 'N', position: 16),
  Box(value: null, position: 17),
  Box(value: null, position: 18),
  Box(value: null, position: 19),
];
List<Answers> answers = [
  Answers(value: 'BEN', position: [2,3,4]),
  Answers(value: 'END', position: [3,8,13]),
  Answers(value: 'BEND', position: [10,11,12,13]),
  Answers(value: 'DEN', position: [6,11,16]),
];

// 2nd page

List<Box> second = [
  Box(value: 'Y', position: 0,),
  Box(value: 'A', position: 1),
  Box(value: 'R', position: 2),
  Box(value: 'D', position: 3,),
  Box(value: null, position: 4),
  Box(value: null, position: 5),
  Box(value: null, position: 6),
  Box(value: 'A', position: 7),
  Box(value: null, position: 8),
  Box(value: null, position: 9),
  Box(value: null, position: 10),
  Box(value: 'Y', position: 11,),
];
List<Answers> answer_2 = [
  Answers(value: 'YARD', position: [0,1,2,3]),
  Answers(value: 'DAY', position: [3, 7, 11]),
];

// 3rd
List<Box> third = [
  Box(value: null, position: 0,),
  Box(value: null, position: 1),
  Box(value: 'P', position: 2),
  Box(value: null, position: 3,),
  Box(value: 'P', position: 4),
  Box(value: 'A', position: 5),
  Box(value: 'I', position: 6),
  Box(value: 'N', position: 7),
  Box(value: null, position: 8),
  Box(value: null, position: 9),
  Box(value: 'N', position: 10),
  Box(value: null, position: 11,),
];

List<Answers> answer_3 = [
  Answers(value: 'PAIN', position: [4,5,6,7]),
  Answers(value: 'PIN', position: [2,6,10]),
];

//first
List<Box> fourth = [
  Box(value: null, position: 0),
  Box(value: 'Y', position: 1, ),
  Box(value: 'E', position: 2),
  Box(value: 'S', position: 3),
  Box(value: null, position: 4),
  Box(value: null, position: 5),
  Box(value: null, position: 6),
  Box(value: 'A', position: 7,),
  Box(value: null, position: 8),
  Box(value: null, position: 9),
  Box(value: null, position: 10),
  Box(value: null, position: 11),
  Box(value: 'S', position: 12),
  Box(value: 'E', position: 13),
  Box(value: 'A', position: 14),
  Box(value: 'S', position: 15),
  Box(value: 'A', position: 16),
  Box(value: 'Y', position: 17),
  Box(value: null, position: 18),
  Box(value: null, position: 19),
  Box(value: null, position: 20),
  Box(value: null, position: 21),
  Box(value: null, position: 22),
  Box(value: null, position: 23),
  Box(value: null, position: 24),
];
List<Answers> answer_4 = [
  Answers(value: 'YES', position: [1,2,3]),
  Answers(value: 'EASY', position: [2,7,12,17]),
  Answers(value: 'SEA', position: [12,13,14]),
  Answers(value: 'SAY', position: [15,16,17]),
];


//Five
List<Box> five = [
  Box(value: 'D', position: 0),
  Box(value: 'A', position: 1, ),
  Box(value: 'Y', position: 2),
  Box(value: null, position: 3),
  Box(value: 'D', position: 4),
  Box(value: null, position: 5),
  Box(value: null, position: 6),
  Box(value: 'A', position: 7,),
  Box(value: null, position: 8),
  Box(value: 'R', position: 9),
  Box(value: null, position: 10),
  Box(value: null, position: 11),
  Box(value: 'R', position: 12),
  Box(value: 'A', position: 13),
  Box(value: 'Y', position: 14),
  Box(value: null, position: 15),
  Box(value: null, position: 16),
  Box(value: 'D', position: 17),
  Box(value: null, position: 18),
  Box(value: null, position: 19),

];
List<Answers> answer_5 = [
  Answers(value: 'DAY', position: [0,1,2]),
  Answers(value: 'YARD', position: [2,7,12,17]),
  Answers(value: 'RAY', position: [12,13,14]),
  Answers(value: 'DRY', position: [4,9,14]),
];

//Six
List<Box> six = [
  Box(value: 'P', position: 0),
  Box(value: null, position: 1, ),
  Box(value: null, position: 2),
  Box(value: null, position: 3),
  Box(value: null, position: 4),
  Box(value: 'A', position: 5),
  Box(value: 'P', position: 6),
  Box(value: 'T', position: 7,),
  Box(value: null, position: 8),
  Box(value: 'H', position: 9),
  Box(value: 'T', position: 10),
  Box(value: null, position: 11),
  Box(value: 'A', position: 12),
  Box(value: null, position: 13),
  Box(value: 'A', position: 14),
  Box(value: 'H', position: 15),
  Box(value: null, position: 16),
  Box(value: 'P', position: 17),
  Box(value: 'A', position: 18),
  Box(value: 'T', position: 19),

];
List<Answers> answer_6 = [
  Answers(value: 'PATH', position: [0,5,10,15]),
  Answers(value: 'APT', position: [5,6,7]),
  Answers(value: 'TAP', position: [7,12,17]),
  Answers(value: 'HAT', position: [9,14,19]),
  Answers(value: 'PAT', position: [17, 18 , 19])
];
//Seven

List<Box> seven = [
  Box(value: null, position: 0),
  Box(value: null, position: 1, ),
  Box(value: 'B', position: 2),
  Box(value: null, position: 3),
  Box(value: null, position: 4),
  Box(value: 'R', position: 5),
  Box(value: null, position: 6),
  Box(value: 'I', position: 7,),
  Box(value: null, position: 8),
  Box(value: null, position: 9),
  Box(value: 'I', position: 10),
  Box(value: null, position: 11),
  Box(value: 'R', position: 12),
  Box(value: 'I', position: 13),
  Box(value: 'D', position: 14),
  Box(value: 'B', position: 15),
  Box(value: 'I', position: 16),
  Box(value: 'D', position: 17),
  Box(value: null, position: 18),
  Box(value: null, position: 19),

];

List<Answers> answer_7 = [
  Answers(value: 'BIRD', position: [2,7,12,17]),
  Answers(value: 'RIB', position: [5,10,15]),
  Answers(value: 'BID', position: [15,16,17]),
  Answers(value: 'RID', position: [12,13,14]),
];

// Eight



