import 'package:fashion/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// My Own imports
import '../widgets/custom_textfield.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  static String id = 'Signup';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  // Custom SignIn Buttons with Apple, Google or Facebook accounts
  Widget customSignIn(VoidCallback onPress, String image, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPrimary: Colors.black,
          primary: Colors.white,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
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
              height: 20,
            ),

            // ********************   Apple Sign In Button   *******************
            customSignIn(
                () {}, 'assets/images/applelogo.png', 'Connect with Apple ID.'),

            const SizedBox(
              height: 10,
            ),

            // ***********************   Google Sign In Button   ***************
            customSignIn(
                () {}, 'assets/images/google.jpg', 'Connect with Google.'),

            const SizedBox(
              height: 10,
            ),

            // *********************   Facebook Sign Up Button   ***************
            customSignIn(() {}, 'assets/images/facebooklogo.png',
                'Connect with Facebook.'),

            const SizedBox(
              height: 15,
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
              height: 20,
            ),
            // ******************  Email and Password TextField  ***************
            CustomTextfield('User Name', Icons.person),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield('Enter Your Email', Icons.email),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield('Enter Your Password', Icons.lock),
            const SizedBox(
              height: 10,
            ),
            const RadioWidget(),
            // SizedBox(height: 10,),
            Row(
              children: const <Widget>[
                CheckBoxWidget(),
                Text('Receive exclusive offers and promotions from Fashop'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // ***********************   Sign Up Button  ***********************
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const LoginScreen()),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPrimary: Colors.white,
                    primary: Colors.red),
                child: const Text(
                  'Sign Up > ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Have an Account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Text(
                    'Sign In',
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
}

class RadioWidget extends StatefulWidget {
  const RadioWidget({Key? key}) : super(key: key);

  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  var selectValue = 1;
  onChange(value) {
    setState(() => selectValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: selectValue,
              onChanged: (value) => onChange(value),
            ),
            const Text('Male'),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
              value: 2,
              groupValue: selectValue,
              onChanged: (value) => onChange(value),
            ),
            const Text('Female'),
          ],
        ),
      ],
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Colors.redAccent,
        tristate: false,
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        });
  }
}
