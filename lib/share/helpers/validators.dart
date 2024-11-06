class Validators{
  static final RegExp imageUrlRegex = RegExp(
    r'^(https?:\/\/.*\.(?:png|jpg|jpeg|gif|bmp))$',
    caseSensitive: false,
  );

}