import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:new_public_home/authentication/login.dart';
import 'package:new_public_home/home_screen/homepage.dart';
import 'package:new_public_home/services/firebase_authentication.dart';
import 'package:new_public_home/shared_features/shared_feature.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggleView;

   RegisterScreen({Key key, this.toggleView});
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();
  String email="";
  String username="";
  String bio="";
  String password="";
  String error="";
  bool loading= false;
  //loading? Loader():
  @override
  Widget build(BuildContext context) {
    return loading? Loader(): Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Register",style: headingStyle.copyWith(
          color: Colors.white
        ),),
        actions: [
          FlatButton.icon(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));
//            widget.toggleView();
          },
            icon: Icon(Icons.person),
            label: Text("Sign In"),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:  Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value)=>value.isEmpty?
                  "Username" : null,
                  onChanged: (value) {
                    setState(() {
                      username=value;
                    });
                  },
                  decoration: textFormDecoration.copyWith(
                    hintText: "Username",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value)=>value.isEmpty?
                  "Enter Email" : null,
                  onChanged: (value) {
                    setState(() {
                      email=value;
                    });
                  },
                  decoration: textFormDecoration.copyWith(
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value)=>value.length<6?
                  "Enter Password 6 or more characters" : null,
                  obscureText: true,

                  onChanged: (value) {
                    setState(() {
                      password=value;
                    });
                  },
                  decoration: textFormDecoration.copyWith(
                      hintText: "Password"
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value)=>value.length<4?
                  "Bio too short" : null,
                  onChanged: (value) {
                    setState(() {
                      bio=value;
                    });
                  },
                  decoration: textFormDecoration.copyWith(
                      hintText: "Enter Bio"
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(onPressed: () async{
                  if(_formKey.currentState.validate()){
                    setState(() {
                      loading=true;
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                    });
                    dynamic result= await _auth.
                    registerWithEmailPassword(email, password);
                    if(
                    result==null
                    ){
                      setState(() {
                        error="Registration Failed, Please try again"
                            "If registered,Please Sign In";
                        loading=false;
                      });
                    }


                  }
                },
                  elevation: 10,
                  color: Colors.teal,
                  child: Text("Register",style: TextStyle(
                      color: Colors.white
                  ),),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(error,style: TextStyle(color: Colors.red,
                    fontSize: 14),
                )
              ],
            )
        ),
      ),
    );
  }
}

///Introduction Screen
class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}
List<PageViewModel> listPagesViewModel(){
  return [
    PageViewModel(
      title: "Public Home",
      body: "'Occasions Invite or Notify Online..'",
      image: Image.asset("assets/intro/socialp.png"),
      footer: MaterialButton(
        onPressed: () {
          // On button presed

        },
        child: const Text("Let's Go !"),
      ),
    ),
    PageViewModel(
      title: "Wedding",
      body: "'Celebration of love, trust, partnership, tolerance and tenacity'",
      image: Image.asset("assets/intro/weddingpn.png"),
      footer: MaterialButton(
        onPressed: () {
          // On button presed
        },
        child: const Text("Invite Friends !"),
      ),
    ),
    PageViewModel(
      title: "Funeral Announcement",
      body: "'A life so beautifully lived deserves to be beautifully remembered'",
      image: Image.asset("assets/intro/rip.png"),
      footer: MaterialButton(
        onPressed: () {
          // On button presed
        },
        child: const Text("Grieving is not forgetting!"),
      ),
    ),
    PageViewModel(
      title: "Anniversaries",
      body: "'Reminds us of important events, both personal and cultural.'",
      image: Image.asset("assets/intro/anivasary.jpg"),
      footer: MaterialButton(
        onPressed: () {
          // On button presed
        },
        child: const Text("It matters to us!"),
      ),
    ),
    PageViewModel(
      title: "Success Cards",
      body: " reminding them that they have many people who care for them and who are hoping for their success.'",
      image: Image.asset("assets/intro/congrats.png"),
      footer: MaterialButton(
        onPressed: () {
          // On button presed
        },
        child: const Text("Express your success & good luck wishes !"),
      ),
    )
  ];
}
class _IntroScreenState extends State<IntroScreen> {

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel(),
      onDone: () {
        // When done button is press
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>RegisterScreen()));
      },
      onSkip: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>RegisterScreen()));
        // You can also override onSkip callback
      },
      showSkipButton: true,
      skip: const Text("Skip",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
      next: const Icon(Icons.navigate_next,color: Colors.blue,size: 24,),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.blue,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)
          )
      ),
    );
  }
}