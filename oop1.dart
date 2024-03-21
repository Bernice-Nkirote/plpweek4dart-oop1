import 'dart:io';

// define an interface
abstract class Drawable {
  void draw();
}

// define the base class
class Shape implements Drawable {
  final String color;
  Shape(this.color); // constructor of the shape class

  @override
  // implementation provided for draw()method from Drawable
  void draw() {
    print("Drawing a $color shape");
  }
}

// define a child class that inherits from shape and overrides the draw method
class Circle extends Shape {
  final double radius;

  Circle(String color, this.radius, String dataFile) : super(color) {
    // read data from the file and process it
    final file = File(dataFile); //created file
    final data = file.readAsLinesSync().first;
    print("Processed data from file: $data");
  }

  @override
  void draw() {
    print("Drawing a $color circle with radius $radius");
  }
}

void main() {
// create an instance of Circle with data from a file
  final circle = Circle("red", 5.0, "circle_data.txt");

// use a loop to draw a circle multiple times
  for (var i = 0; i < 3; i++) {
    circle.draw();
  }
}
