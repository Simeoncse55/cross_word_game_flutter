class Box{
  final String? value;
  final int? position;

  Box({ required this.value, required this.position});
}

class Answers {
  final String? value;
  final List<int> position;

  Answers({ required this.value, required this.position});
}

class Game{

  final int gridCount;
  final List<Box> boxes;
  final List<Answers> answers;
  final List<String> hints;


  Game({required this.gridCount,required this.boxes, required this.answers, required this.hints});
}
List<Game> game  =[

  Game(gridCount: 4, boxes: boxes, answers: answers,hints:['B','E','S','T']),
  Game(gridCount: 4, boxes: second, answers: answer_2,hints: ['G','O','N','E']),
];

List<Box> boxes =[
  Box(value: null, position: 1),
  Box(value: 'S', position: 2),
  Box(value: null, position: 3),
  Box(value: null, position: 4),
  Box(value: 'B', position: 5),
  Box(value: 'E', position: 6),
  Box(value: 'S', position: 7),
  Box(value: 'T', position: 8),
  Box(value: null, position: 9),
  Box(value: 'T', position: 10),
  Box(value: null, position: 11),
  Box(value: null, position: 12),
];
List<Answers> answers =[
  Answers(value: 'BEST', position: [5,6,7,8]),
  Answers(value: 'SET', position: [2,6,10])
];

// 2nd page

List<Box> second =[
  Box(value: null, position: 1),
  Box(value: 'N', position: 2),
  Box(value: 'G', position: 3),
  Box(value: 'O', position: 4),
  Box(value: null, position: 5),
  Box(value: null, position: 6),
  Box(value: null, position: 7),
  Box(value: 'G', position: 8),
  Box(value: null, position: 9),
  Box(value: null, position: 10),
  Box(value: 'N', position: 11),
  Box(value: 'E', position: 12),
];
List<Answers> answer_2 =[
  Answers(value: 'B E S T', position: [5,6,7,8]),
  Answers(value: 'S E T', position: [2,6,10])
];

