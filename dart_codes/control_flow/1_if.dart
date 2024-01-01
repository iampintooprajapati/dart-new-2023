void main() {
  // IF and ELSE Statements
  var salary = 2000;

  if (salary > 20000) {
    print("Congratulation , you got it");
  } else {
    print("work hard");
  }
  // IF ELSE IF Ladder Statements

  var marks = -15;

  if (marks >= 90 && marks < 100) {
    print("A+");
  } else if (marks >= 80 && marks < 90) {
    print("A");
  } else if (marks >= 70 && marks < 80) {
    print("B");
  } else if (marks >= 60 && marks < 70) {
    print("C");
  } else if (marks >= 35 && marks < 60) {
    print("D");
  } else if (marks >= 0 && marks < 30) {
    print("Congratulation, you failed");
  } else {
    print("cheating only 0 to 100 between limit");
  }
}
