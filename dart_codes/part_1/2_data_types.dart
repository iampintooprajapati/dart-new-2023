// ** Dart has spacial support for these data types.
// => Numbers
//    1=> int
//    2=> Double
// => Strings
// => Booleans
// => Lists (also knowns as Arrays )
// => Maps
// => Runes ( for expressing Unicode char in a String )
// => Symbols

// Note :- All data types in Dart are Objects.
// Therefore , values are by default null

// ** Variable Declaration
// Define a value 10 [ Let's say it is v age ]

// int age = 10;
// or
// var age = 10; // it is inferred as integer automatically

void main() {
  // Numbers : int
  int point = 5000;
  var run = 2000;
  // Numbers : double
  double pi = 3.14;
  double percentage = 65.22;

  // Strings
  String name = "VR";
  var surname = "RV";

  // boolean
  bool isAlive = true;
  var isTrue = true;

  print(point);
  print(run);
  print(pi);
  print(percentage);
  print(name);
  print(surname);
  print(isAlive);
  print(isTrue);
}
