class DigitsToWordsParser {
  var digs = {
    {' ноль'},
    {' Первый'},
    {' Второй'},
    {' Третий'},
    {' Четвертый'},
    {' Пятый'},
    {' Шестой'},
    {' Седьмой'},
    {' Восьмой'},
    {' Девятый'},
    {' Десятый'},
    {' Одинадцатый'},
    {' Двенадцатый'},
    {' Тринадцатый'},
    {' Четырнадцатый'},
    {' Пятнадцатый'},
    {' Шестнадцатый'},
    {' Семнадцатый'},
    {' Восемнадцатый'},
    {' Девятнадцатый'}
  };
  var dec = {
    {''},
    {''},
    {' Двадцатый'},
    {' Тридцатый'},
    {' Сороковой'},
    {' Пятидесятый'},
    {' Шестидесятый'},
    {' семьдесят'},
    {' восемьдесят'},
    {' девяносто'}
  };

  var hund = {
    {''},
    {' сто'},
    {' двести'},
    {' триста'},
    {' четыреста'},
    {' пятьсот'},
    {' шестьсот'},
    {' семьсот'},
    {' восемьсот'},
    {' девятьсот'}
  };
  var categories = {
    {''},
    {''},
    {' тысяча', ' тысячи', ' тысяч'},
    {' миллион', ' миллиона', ' миллионов'},
    {' миллиард', ' миллиарда', ' миллиардов'},
    {' триллион', ' триллиона', ' триллионов'}
  };

  toWords({required int number}) {
    String digitName = '';
    List<int> numberMilletimation = [];
    int i = 0;
    i = number;

    while (i != 0) {
      int j = i % 1000;
      i = i ~/ 1000;
      numberMilletimation.add(j);
    }

    int category = numberMilletimation.length;

    for (i = category - 1; i >= 0; i--) {
      digitName = digitName +
          _decimation(numberMilletimation[i], i + 1); //i == 0 ? 1 : i
    } // 1 сотня 2 тысячи 3 миллион 4 миллиард

    return digitName;
  }

  _decimation(int number, int category) {
    String word = '';
    List<int> decs = [];
    int i = number;
    while (i != 0) {
      int j = i % 10;
      i = i ~/ 10;
      decs.add(j);
    }
    while (decs.length != 3) {
      decs.add(0);
    }

    word = _decToString(decs, category);

    return word;
  }

  String _decToString(List<int> decs, int category) {
    String word = '';
    // название сотен, если есть
    if (decs[2] > 0) {
      word = word + hund.elementAt(decs[2]).elementAt(0);
      if (decs[1] == 0 && decs[0] == 0 && category > 1) {
        word = word + categories.elementAt(category).elementAt(2);
      }
    }

//есть десятки
    if (decs[1] > 0) {
      //если перый десяток
      if (decs[1] == 1) {
        word = word + digs.elementAt(decs[1] * 10 + decs[0]).elementAt(0);
        if (category > 1) {
          word = word + categories.elementAt(category).elementAt(2);
        }
      }
      //от второго десятка
      if (decs[1] > 1) {
        //название десятка
        word = word + dec.elementAt(decs[1]).elementAt(0);
        //если без десяток круглый и разряд больше сотни
        if (decs[0] == 0 && category > 1) {
          word = word + categories.elementAt(category).elementAt(2);
        }
        //единицы для второго десятка
        if (decs[0] > 0) {
          //для единицы и двойки
          if (decs[0] == 1 || decs[0] == 2) {
            //в пределах сотни
            if (category == 1) {
              word = word + digs.elementAt(decs[0]).elementAt(0);
            }
            //для тысячи
            if (category == 2) {
              word = word + digs.elementAt(decs[0]).elementAt(1); //одна две
              if (decs[0] == 1) {
                word =
                    word + categories.elementAt(category).elementAt(0); //тысяча
              }
              if (decs[0] == 2) {
                word =
                    word + categories.elementAt(category).elementAt(1); //тысячи
              }
            }
            if (category > 2) {
              if (decs[0] == 1) {
                word = word +
                    categories
                        .elementAt(category)
                        .elementAt(0); //1 миллион миллиард
              }

              if (decs[0] == 2) {
                word = word +
                    categories
                        .elementAt(category)
                        .elementAt(1); //2 миллиона миллиарда
              }
            }
          }
          // для 3 и 4
          if (decs[0] == 3 || decs[0] == 4) {
            word = word + digs.elementAt(decs[0]).elementAt(0);
            if (category > 1) {
              word = word + categories.elementAt(category).elementAt(1);
              //тысячи
            }
          }
//для 5 и т.д.
          if (decs[0] > 4) {
            word = word + digs.elementAt(decs[0]).elementAt(0);
            if (category > 1) {
              word = word + categories.elementAt(category).elementAt(2);
            }
          }
        }
      }
    }

    //единицы
    if (decs[0] > 0 && decs[1] == 0) {
      if (category == 2) {
        if (decs[0] == 1 || decs[0] == 2) {
          word = word + digs.elementAt(decs[0]).elementAt(1);
        } else {
          word = word + digs.elementAt(decs[0]).elementAt(0);
        }
      } else {
        word = word + digs.elementAt(decs[0]).elementAt(0);
      }

      if (category > 1) {
        if (decs[0] == 1) {
          word = word + categories.elementAt(category).elementAt(0);
        } else if (decs[0] > 1 && decs[0] < 5) {
          word = word + categories.elementAt(category).elementAt(1);
        } else {
          word = word + categories.elementAt(category).elementAt(2);
        }
      }
    }
    return word;
  }
}