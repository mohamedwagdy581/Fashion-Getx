import 'package:fashion/views/home_page.dart';
import 'package:fashion/views/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

// My own imports

import '../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //static String id = 'Login';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late SharedPreferences preferences;
  bool loading = false;
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isAuth = await googleSignIn.isSignedIn();
    if (isAuth) {
      buildAuthScreen();
      //Get.to(() => const HomePage());
    }
    setState(() {
      loading = false;
    });
  }

/*  Future handelSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;
    FirebaseUser firebaseClient = await firebaseAuth.signInWithGoogle(
        idToken: googleSignInAuthentication!.idToken,
        accessToken: googleSignInAuthentication.accessToken);
  }*/

  Widget buildAuthScreen() {
    return const HomePage();
  }

  Widget buildUnAuthScreen() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Fashop',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // ********************   Apple Sign In Button   *******************
            customSignIn(
                () {}, 'assets/images/applelogo.png', 'Connect with Apple ID.'),

            const SizedBox(
              height: 20,
            ),
            // ***********************   Google Sign In Button   ***************
            customSignIn(
                () {}, 'assets/images/google.jpg', 'Connect with Google.'),

            const SizedBox(
              height: 20,
            ),
            // *********************   Facebook Sign In Button   ***************
            customSignIn(() {}, 'assets/images/facebooklogo.png',
                'Connect with Facebook.'),

            const SizedBox(
              height: 30,
            ),

            // ********************   Or Continue with   *********************
            // Center(child: Text('------------------- Or Continue with Email ---------------'),)
            Stack(
              children: const <Widget>[
                Divider(
                  thickness: 1.25,
                ),
                Center(
                    child: Text(
                  'Or Continue with Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // ******************  Email and Password TextField  ***************
            CustomTextfield('Enter Your Email', Icons.email),
            const SizedBox(
              height: 20,
            ),
            CustomTextfield('Enter Your Password', Icons.lock),
            // ****************   Forget Password  ******************
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text(
                  'Forget Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // ***********************   Sign In Button  ***********************
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const HomePage()),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPrimary: Colors.white,
                  primary: Colors.red,
                ),
                child: const Text(
                  'Sign In > ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Dont\'t have account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(() => Signup()),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }

  // Custom SignIn Buttons with Apple, Google or Facebook accounts
  Widget customSignIn(VoidCallback onPress, String image, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              height: 40,
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
