// => why we need constants in dart ?
// -  if you never want change a value then use final and const keywords.
//   ex : final name = "VR";
//        const pi = 3.14;

// => Difference between final and const
// - final variable can only be set once and it is initialized when accessed.
// - const variable is implicitly final but is a compile-time constant.
// -> i.e. it is initialized during compilation
// - Instance variable can be final but cannot be const.
// - if you want a constant at class level then make it static const.

void main() {
  // final keyword
  final cityName = "A'bad";

  final String countryName = "Bharat"; // String optional

  // const keyword

  const PI = 3.14;

  const double gravity = 9.8; // String optional
}

class Circle {
  final color = 'Red';
  static const PI = 3.14;
}
