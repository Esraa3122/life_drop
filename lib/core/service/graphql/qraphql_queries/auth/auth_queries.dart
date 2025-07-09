// import 'package:firebase_auth/firebase_auth.dart';

// class Auth {
//   final _auth = FirebaseAuth.instance;
//   Future SignUpPage(String email, String password) async {
//     final authResult = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//     return authResult;
//   }

//   Future LogInPage(String email, String password) async {
//     final authResult = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);
//     return authResult;
//   }
// }

import 'package:life_drop/features/auth/data/models/login_request_body.dart';
import 'package:life_drop/features/auth/data/models/sign_up_request_body.dart';

class AuthQueries {
  factory AuthQueries() {
    return _instance;
  }
  const AuthQueries._();

  static const AuthQueries _instance = AuthQueries._();

  Map<String, dynamic> loginMapQuery({required LoginRequestBody body}) {
    return {
      'query': r'''
          mutation Login($email: String!, $password: String!) {
            login(email: $email, password: $password) {
              access_token
              refresh_token
            }
          }
        ''',
      'variables': {
        'email': body.email,
        'password': body.password,
      },
    };
  }

  Map<String, dynamic> signUpMapQuery({required SignUpRequestBody body}) {
    return {
      'query': r'''
              mutation SignUp($name: String!, $email: String! , $password: String!, $avatar: String!) {
              addUser(
                data: {
                  name: $name
                  email: $email
                  password:$password
                  avatar: $avatar
                  role: customer
                }
              ) {
                id
                email
              }
            }
        ''',
      'variables': {
        'name': body.name,
        'email': body.email,
        'password': body.password,
        'avatar': body.avatar,
      },
    };
  }
}
