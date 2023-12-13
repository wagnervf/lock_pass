class GoogleAuthUserModel {
  final String uid;
  final String email;
  final String displayName;
  final String photoURL;

  GoogleAuthUserModel({
    required this.uid,
    required this.email,
    this.displayName = '',
    this.photoURL = '',
  });

  factory GoogleAuthUserModel.fromFirebaseUser(user) {
    return GoogleAuthUserModel(
      uid: user.uid,
      email: user.email!,
      displayName: user.displayName ?? '',
      photoURL: user.photoURL ?? '',
    );
  }

  @override
  String toString() {
    return 'User{uid: $uid, email: $email, displayName: $displayName, photoURL: $photoURL}';
  }
}