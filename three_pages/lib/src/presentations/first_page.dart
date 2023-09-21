import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/src/presentations/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  showInSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Форма успешно заполнена!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Первая страница"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[а-яА-Яa-zA-Z]'))],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Заполните поле с буквами!";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        icon: Icon(Icons.abc_rounded),
                        label: Text("Введите буквы"),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Заполните поле с паролем!";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        icon: Icon(Icons.password_rounded),
                        label: Text("Введите пароль"),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Заполните поле с датой!";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        icon: Icon(Icons.date_range_rounded),
                        label: Text("Введите дату"),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Заполните поле с цифрами!";
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        icon: Icon(Icons.numbers),
                        label: Text("Введите цифры"),
                      ),
                    ),
                  ),
                ]),
              ),

              SizedBox(height: 20),

              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.asset('assets/images/secure.jpg', width: 150, height: 150, fit: BoxFit.cover),
              ),

              SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate())
                        showInSnackBar();
                      },
                    child: Text("Подтвердить", style: TextStyle(fontSize: 20)))
              ),
            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=> SecondPage()));},
          child: Icon(Icons.navigate_next_rounded)),
    );
  }
}
