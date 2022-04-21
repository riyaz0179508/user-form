import 'package:flutter/material.dart';
import 'package:user_form/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

TextEditingController _emailController=TextEditingController();
TextEditingController _passController=TextEditingController();
final _userKey=GlobalKey<FormState>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _userKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "Field is empty";
                    }
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    border: OutlineInputBorder(
                      borderSide: BorderSide()
                    )
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Field is empty";
                      }
                    },
                    controller: _passController,
                    decoration: InputDecoration(
                        hintText: "Enter your Password",
                        border: OutlineInputBorder(
                            borderSide: BorderSide()
                        )
                    )
                ),
              ),

              ElevatedButton(
                  onPressed: (){
                    _userKey.currentState!.validate();
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>NextPage()));
                  },
                  child: Text("SignUp")
              )
            ],
          ),
        ),
      ),
    );
  }
}
