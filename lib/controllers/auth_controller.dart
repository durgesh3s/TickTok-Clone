<<<<<<< HEAD
=======
import 'dart:io';
>>>>>>> 86c6d9e (Update V.0.2)
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
<<<<<<< HEAD
import 'dart:io';
import 'package:tiktok_clone/constant.dart';
import 'package:tiktok_clone/models/user.dart' as model;

import '../screens/auth/login_screens.dart';
import '../screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

=======
import 'package:tiktok_tutorial/constants.dart';
import 'package:tiktok_tutorial/models/user.dart' as model;
import 'package:tiktok_tutorial/views/screens/auth/login_screen.dart';
import 'package:tiktok_tutorial/views/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
>>>>>>> 86c6d9e (Update V.0.2)
  late Rx<User?> _user;
  late Rx<File?> _pickedImage;

  File? get profilePhoto => _pickedImage.value;
<<<<<<< HEAD
=======
  User get user => _user.value!;
>>>>>>> 86c6d9e (Update V.0.2)

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

<<<<<<< HEAD
  _setInitialScreen(User? user){
    if(user == null){
      Get.offAll(() => LoginScreen());
    }else{
    Get.offAll(() => HomeScreen());
    }
  }


  void pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      Get.snackbar('Profile Picture', 'You have successfully selected your profile picture');
=======
  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
>>>>>>> 86c6d9e (Update V.0.2)
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

<<<<<<< HEAD

=======
>>>>>>> 86c6d9e (Update V.0.2)
  // upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
<<<<<<< HEAD
        .child('profilePic')
        .child(firebaseAuth.currentUser!.uid);
=======
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

>>>>>>> 86c6d9e (Update V.0.2)
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

<<<<<<< HEAD
// registering the user
  Future<void> registerUser(
=======
  // registering the user
  void registerUser(
>>>>>>> 86c6d9e (Update V.0.2)
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
<<<<<<< HEAD
        // save out user to our auth and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
=======
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
>>>>>>> 86c6d9e (Update V.0.2)
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadUrl,
        );
<<<<<<< HEAD
        await fireStore.collection('users').doc(cred.user!.uid).set(user.toJson());
      }else{
        Get.snackbar(
            'Enter Creating An Account',
            'Please enter all the fields',
=======
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Please enter all the fields',
>>>>>>> 86c6d9e (Update V.0.2)
        );
      }
    } catch (e) {
      Get.snackbar(
<<<<<<< HEAD
        'Error Creating An Account',
=======
        'Error Creating Account',
>>>>>>> 86c6d9e (Update V.0.2)
        e.toString(),
      );
    }
  }

  void loginUser(String email, String password) async {
<<<<<<< HEAD
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        // print('Log success');
      }else{
        Get.snackbar(
          'Enter Login in Account',
          'Please enter all the fields',
        );
      }
    }catch(e){
      Get.snackbar(
        'Error Logging',
=======
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
>>>>>>> 86c6d9e (Update V.0.2)
        e.toString(),
      );
    }
  }
<<<<<<< HEAD
=======

  void signOut() async {
    await firebaseAuth.signOut();
  }
>>>>>>> 86c6d9e (Update V.0.2)
}
