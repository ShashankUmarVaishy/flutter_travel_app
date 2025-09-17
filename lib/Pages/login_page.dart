import 'package:flutter/material.dart';
import 'package:front_end/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name ="";
  bool changedButton=false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState?.validate() ?? false){
      setState(() {
          changedButton=true;
      });
      await Future.delayed(Duration(seconds : 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key:_formKey,
          child: Column(
            children: [
              Image.asset("assets/images/breakfast.png", fit: BoxFit.cover),
              SizedBox(
                height: 20, 
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20, 
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0 , horizontal: 15.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your username",
                        labelText: "Username",
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Username can't be empty";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name=value;
                        setState(() {
                          
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        labelText: "Password",
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Password can't be empty";
                        }
                        else if(value.length<6){
                          return "Password must be at least 6 character";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20, //20px space b/w\
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:BorderRadius.circular(changedButton?25:10),
                      child: InkWell(
                        borderRadius:BorderRadius.circular(changedButton?25:10),
                        onTap: ()=>moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changedButton? 50:135,
                          height: changedButton? 50:50,
                          alignment: Alignment.center,
                          child: changedButton?
                          Icon(Icons.done, color:Colors.white)
                          :
                          Text("Login", style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          ),
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
