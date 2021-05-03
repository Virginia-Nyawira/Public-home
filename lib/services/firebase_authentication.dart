import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_public_home/models/user.dart';

class AuthService{

  //ins of firebase authentication
  final FirebaseAuth _auth=FirebaseAuth.instance;

  //creating a user object based on a firebase user
  Users _userFromFirebaseUser(User user) {
    return user!= null? Users(uid: user.uid ) : null;
  }

  //Auth change user stream
  Stream<Users> get user{
    return _auth.authStateChanges().
    //map((User user) => _userFromFirebaseUser(user) );
    map(_userFromFirebaseUser);
  }

  //Register with email and password
  Future registerWithEmailPassword(String email,String password)
  async{
    try{
      UserCredential result=await _auth.
      createUserWithEmailAndPassword(email: email,
          password: password);
      User user =result.user;
      ///Create a new document for the user with the uid
//      await DatabaseService(uid: user.uid)
//          .updateUserData("0", 100, "New User");

      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      print("Creation of user error");
      return null;
    }
  }


  //Sign In with email and password
  Future signInWithEmailPassword(String email,String password)
  async{
    try{
      UserCredential result=await _auth.
      signInWithEmailAndPassword(email: email,
          password: password);
      User user =result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      print("Creation of user error");
      return null;
    }
  }

  //SIGN OUT
  Future signOuti() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}