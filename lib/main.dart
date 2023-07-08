import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var email = TextEditingController();

  var pass = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool passwordShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const  Icon(
          Icons.login,
        ),
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:Container(
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
    Colors.blue,
    Colors.red,
    ],
    )
    ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    defaultFormField(

                      controller: email,
                      label: 'Email',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      validate: (String? value){
                        if(value!.isEmpty){
                          return 'email must not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: pass,
                      label: 'Password',
                      prefix: Icons.lock,
                      type: TextInputType.visiblePassword,
                      validate: (String? value){
                        if(value!.isEmpty){
                          return 'password must not be empty';
                        }
                        return null;
                      },
                      isPass: passwordShow,
                      suffix: passwordShow ? Icons.visibility : Icons.visibility_off,
                      showPass: (){
                        setState(() {
                          passwordShow = !passwordShow;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                        text: 'login',
                        background: Colors.blue,
                        function: ()
                        {
                          if(formKey.currentState!.validate())
                          {
                            print(email.text);
                            print(pass.text);
                          }
                        },
                        width: double.infinity
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text(
                            'Don\'t have an account'
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Register Now',
                          ),
                        ),
                      ],
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



Widget defaultFormField ({
  required TextEditingController controller,
  required TextInputType type,
  onSubmit,
  onChange,
  bool isPass = false,
  required validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  showPass
})=> TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPass,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator: validate,
  decoration:  InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed: showPass,
      icon:   Icon(
        suffix,
      ),
    ) :null,
  ),
);

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius =10.0,
  required function,
  required String text,
}) => Container(
  width: width,
  height: 40.0,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radius,
    ),
    color: background,
  ),
  child: MaterialButton(
    onPressed: function,
    child:  Text(
      isUpperCase ? text.toUpperCase() : text,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  ),

);