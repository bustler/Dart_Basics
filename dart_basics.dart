typedef IntList = List<int>;

//1
class nod {
  // Наибольший общий делитель
  late IntList inputNumbers;

  nod(IntList this.inputNumbers);

  int nodNomber() {
    int hightDivision = _findLow(inputNumbers);

    for (bool trigger = true; hightDivision > 1 && trigger; hightDivision--) {
      for (int numbers in inputNumbers) {
        if (numbers % hightDivision != 0) {
          trigger = true;
          break;
        } else {
          trigger = false;
        }
      }
      if (!trigger) {
        break;
      }
    }
    return hightDivision;
  }

  int _findLow(IntList input) {
    int low = input[0];
    for (int element in input) {
      if (low > element) {
        low = element;
      }
    }
    return low;
  }
}

class nok {
  // Наименьшее общее кратное
  late IntList inputNumbers;

  nok(IntList this.inputNumbers);

  int nokNomber() {
    int outNok = 1;
    int hightValue = _findHight(inputNumbers);

    for (bool trigger = true; trigger && outNok < 1000; outNok++) {
      int enumeration = hightValue * outNok;

      for (int element in inputNumbers) {
        if (enumeration % element == 0) {
          // print("good $a  $element");
          trigger = false;
        } else {
          // print("bad $a  $element");
          trigger = true;
          break;
        }
      }
      if (!trigger) {
        break;
      }
    }
    // print("NOK: $outNok");
    return outNok * hightValue;
  }

  int _findHight(IntList input) {
    int hight = input[0];
    for (int element in input) {
      if (hight < element) {
        hight = element;
      }
    }
    // print(hight);
    return hight;
  }
}

//2
class notation {
  late int _num;
  notation(this._num);

  int toDecimal() {
    int dec = 0;
    int i = 0;
    while (_num != 0) {
      dec += pow(2, i) * (_num % 10);
      i++;
      _num ~/= 10;
    }
    return dec;
  }

  int toBinary() {
    int bin = 0;
    List<int> load = [];
    while (_num >= 1) {
      // bin *= 10;
      load.add(_num % 2);
      _num ~/= 2;
    }
    // print(load);
    for (int i = load.length - 1; i >= 0; i--) {
      // print(bin);
      bin *= 10;
      bin += load[i];
    }
    return bin;
  }
}

//3
IntList findeNum(String a) {
  IntList num = [];
  String value = "";
  for (int i = 0; i < a.length; i++) {
    int? b = int.tryParse(a[i]);
    if (a[i] == " " && value != "") {
      num.add(int.parse(value));
      value = "";
      continue;
    }
    if (b == null) {
      value = "";
      while (a[i] != " ") {
        i++;
        if (i >= a.length) break;
      }
      continue;
    } else if (b != null) {
      value = value + a[i];
    }
  }
  return num;
}

//4
Map<String, int> Words(List<String> words) {
  Map<String, int> test = {words[0]: 1};
  words.removeAt(0);

  for (String word in words) {
    if (test.containsKey(word)) {
      test[word] = test[word]! + 1;
    } else {
      test[word] = 1;
    }
  }
  return test;
}

//5
Set<int> strToNum(List<String> someString) {
  const List<String> numbers = [
    "zero",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine"
  ];
  late Set<int> numString = {};
  for (String element in someString) {
    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] == element) {
        numString.add(i);
        break;
      }
    }
  }

  return numString;
}

//6
class Point {
  late final double x, y, z;

  Point(this.x, this.y, this.z);

  double distanceTo(Point another) {
    // d = √((x2 - x1)2 + (y2 - y1)2 + (z2 - z1)2)
    double deltaX = this.x - another.x;
    double deltaY = this.y - another.y;
    double deltaZ = this.z - another.z;
    return root(((deltaX * deltaX) + (deltaY * deltaY) + (deltaZ * deltaZ)), 2);
  }

  Point.triangle(Point A, Point B, Point C) {
    // {\displaystyle S={\sqrt {p(p-a)(p-b)(p-c)}}},
    double a, b, c;
    a = A.distanceTo(B);
    b = B.distanceTo(C);
    c = C.distanceTo(A);
    double p = (a + b + c) / 2;
    double S = root(p * (p - a) * (p - b) * (p - c), 2);
    print(S /*.toStringAsFixed(5)*/);
  }
}

//7
int pow(int x, int exp) {
  if (exp == 0) return 1;
  if (x == 0) return 0;
  int y = x;
  for (; exp > 1; exp--) {
    y *= x;
  }
  return y;
}

double root(double value, int exp) {
  double rootValue = 1;
  rootValue = _accuracy(value, exp, rootValue, 1.0);
  rootValue = _accuracy(value, exp, rootValue, 0.000001);
  rootValue = _accuracy(value, exp, rootValue, 0.000000000001);
  return rootValue;
}

double _accuracy(double value, int exp, double rootValue, double point) {
  bool triggerDown = false;
  bool triggerUp = false;
  double residual = 1;
  double cache;

  while (residual != 0) {
    cache = rootValue;
    for (int i = 1; i < exp; i++) {
      cache *= rootValue;
    }
    residual = cache - value;
    if (residual == 0) {
      return rootValue;
    } else if (residual < 0) {
      triggerUp = true;
      rootValue += point;
    } else {
      triggerDown = true;
      rootValue -= point;
    }

    if (triggerDown && triggerUp) {
      break;
    }
  }
  return rootValue;
}

//8
abstract class User {
  late String email;
  String mailSystem = "";
  User(String this.email);

  void getEmail() {
    print("Users email: $email");
  }
}

class AdminUser extends User with MailSystem {
  AdminUser(String email) : super(email);

  @override
  void getEmail() {
    print(getMailSystem);
  }
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

mixin MailSystem on User {
  String getSystem() {
    if (mailSystem != "") return mailSystem;
    int i = 0;
    for (; i < email.length; i++) {
      if (email[i] == '@') {
        i++;
        break;
      }
    }
    for (; i < email.length; i++) {
      mailSystem += email[i];
    }
    return mailSystem;
  }

  String get getMailSystem => getSystem();
}

class UserManager<T extends User> {
  Set<User> users = {};

  void add(User newUser) {
    users.add(newUser);
  }

  void remove(User removeUser) {
    users.remove(removeUser);
  }

  void showAllUser() {
    for (User n in users) {
      n.getEmail();
    }
  }
}

void main() {
  //#1
  print("\n1. NOK & NOD:");
  IntList a = [24, 18, 78];
  final b = nok(a);
  final c = nod(a);
  print(b.nokNomber());
  print(c.nodNomber());

  //#2
  print("\n2. notation:");
  print(notation(126).toBinary());
  print(notation(1111110).toDecimal());

  //#3
  print("\n3. search numbers:");
  print(findeNum("a 2 asd 421j 15 6 2 l2 q 2 13 a3ew "));

  //#4
  print("\n4. count:");
  List<String> words = [
    "n",
    "b",
    "v",
    "a",
    "123",
    "a",
    " ",
    " ",
    " ",
    "a",
    "123"
  ];
  print(Words(words));

  //#5
  print("\n5. finde numbers:");
  List<String> numbers = [
    "one",
    "two",
    "three",
    "cat",
    "five",
    "two",
    "dog",
    "two",
  ];
  print(strToNum(numbers));

  //#6
  print("\n6.1. distance:");
  final A = Point(8, 2, -5);
  final B = Point(-3, -3, 4);
  print(A.distanceTo(B) /*.toStringAsFixed(5)*/);

  print("\n6.2. triangle:");
  final C = Point(1, 2, 3);
  Point.triangle(A, B, C);
  //#7
  print("\n7. root:");
  print(root(9, 4) /*.toStringAsFixed(5)*/);

  //#8
  print("\n8. Mail:");
  var test = new AdminUser("efimov@gmail.com");
  // print(test.email);
  test.getEmail();
  print("\n\n");

  var test1 = new AdminUser("efimov@mail.ru");
  var test2 = new GeneralUser("leshka@rambler.ru");
  var test3 = new GeneralUser("pashka@gmai.com");
  var test4 = new AdminUser("egorka@internet.net");
  var test5 = new AdminUser("fedya@pklsafpkl.dsg");
  var test6 = new GeneralUser("stas@lapki.ru");
  var test7 = new AdminUser("lera@pog.champ");

  var allUsers = new UserManager();
  allUsers.add(test);
  allUsers.add(test1);
  allUsers.add(test2);
  allUsers.add(test3);
  allUsers.add(test4);
  allUsers.add(test5);
  allUsers.add(test6);
  allUsers.add(test7);

  print("before:");
  allUsers.showAllUser();
  allUsers.remove(test1);
  print("\nafter:");
  allUsers.showAllUser();
}
