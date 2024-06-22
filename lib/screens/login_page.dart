import 'package:flutter/material.dart';


class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
   bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flexible(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'images/moofli_logo.jpg', // Path to your logo
                width: 100, // Adjust width as needed
                height: 100, // Adjust height as needed
              ),
            ),

             
              const SizedBox(height: 20.0),
              const Text('Welcome!', textAlign: TextAlign.center, style: TextStyle(fontFamily: "Poppins", fontSize: 27, fontWeight: FontWeight.w400, color: Color.fromRGBO(0, 0, 0, 1),
  ),),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Email or phone number',  
                     border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                   
                  ),
                  ),  
                ),
                const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password' ,  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)), 
                    
                  ),),
              ),
        
            const SizedBox(height: 20.0),
        
              Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(iconAlignment: IconAlignment.end,
                  onPressed: () {
                    // Add your password recovery logic here
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(155, 0, 210, 1.0)
                      // This sets the text color
                      ),
                  child: const Text('Forgot your password?' , textAlign: TextAlign.right,),
                ),
              
            ],
            ),
              ElevatedButton(
                onPressed: () async {
                  // Add your password recovery logic here
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromRGBO(155, 0, 210, 1.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Log in ' , style: TextStyle(color: Color.fromRGBO(255,255,255,1)),),
                ),
              ),
              const SizedBox(height: 10.0),
               const Text('OR' , textAlign: TextAlign.center , style: TextStyle(fontSize: 20, ),),
               const SizedBox(height: 10.0),


          const Text('Sign in with ', style: TextStyle(color: Color.fromRGBO(155, 0, 210, 1.0) , fontWeight: FontWeight.bold),  textAlign: TextAlign.center),
              
          const SizedBox(height: 10.0),
               Center(
               child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 340,
              height: 73,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
               
                color: const Color.fromRGBO(241, 244, 255, 1),
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: SizedBox(
                                width: 37.0,
                                height: 37.0,
                                child: Image.asset('images/google_logo.png'),
                              ),
                              onPressed: () {
                                // Implement Google login functionality
                              },
                            ),
                          ),
                          const VerticalDivider(
                  thickness: 2.0,
                  color: Colors.black,), // Divider between buttons
                          Expanded(
                            child: IconButton(
                              icon: SizedBox(
                                width: 34.0,
                                height: 33.0,
                                child: Image.asset('images/facebook_logo.png'),
                              ),
                              onPressed: () {
                                // Implement Facebook login functionality
                              },
                            ),
                          ),
                          const VerticalDivider(
                             
                   width: 1.0,
                thickness: 59.0, // Set thickness to make it bold
                color: Color.fromRGBO(50, 50, 50, 1)
                ,
                          ), // Divider between buttons
                          Expanded(
                            child: IconButton(
                              icon: SizedBox(
                                width: 40.0,
                                height: 40.7,
                                child: Image.asset('images/skillop_logo.png'),
                              ),
                              onPressed: () {
                                // Implement Skillop login functionality
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              
            ),
               ),
               const SizedBox(height: 10.0),

           RichText( textAlign: TextAlign.center,
              text: const TextSpan(
                text: '''By signing up or logging in, you agree to 
  our ''', 
                style: TextStyle(
                  color: Color.fromRGBO(106, 106, 106, 1),
                  fontSize: 16.0,
                  fontFamily: "Poppins",
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Terms of service',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      decoration: TextDecoration.underline
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      color: Color.fromRGBO(106, 106, 106, 1),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy policy',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ],
              ),
            ),
             
             
             
        
              const SizedBox(height: 20.0),
              const Text('Don\'t have an account?', textAlign: TextAlign.center , style: TextStyle(fontFamily: "Poppins",color: Color.fromRGBO(106, 106, 106, 1),), ),
              TextButton(
                onPressed: () {
                  // Add your password recovery logic here
                },
                style: TextButton.styleFrom(
                    foregroundColor: const Color.fromRGBO(155, 0, 210, 1.0)
                    // This sets the text color
                    ),
                child: const Text('Sign Up' , style: TextStyle(fontFamily: "Poppins",),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 // ElevatedButton.icon(
    //   icon: Image.asset('assets/google_logo.png'), // Replace with your asset path
    //   label: const Text('Sign in with Google'),
    //   onPressed: () {
    //     // Handle Google sign-in
    //   },
    // ),

     // ElevatedButton.icon(
    //   icon: Image.asset('images/facebook_logo.png'), // Replace with your asset path
    //   label: const Text('Sign in with Facebook'),
    //   onPressed: () {
    //     // Handle Facebook sign-in
    //   },
    // ),
    // ElevatedButton.icon(      
    //   icon: Image.asset('images/google_logo.png'), // Replace with your asset path
    //   label: const Text('Sign in with Apple'),
    //   onPressed: () {
    //     // Handle Apple sign-in
    //   },
    // ),

     // SignInButton(
              //   Buttons.Google,
              //   text: "Sign in with Google",
              //   onPressed: () {
              //     // Add your Google sign-in logic here
              //   },
              // ),
              // SignInButton(
              //   Buttons.Facebook,
              //   text: "Sign in with Facebook",
              //   onPressed: () {
              //     // Add your Facebook sign-in logic here
              //   },
              // ),
              // const SizedBox(height: 20.0),
              
              