// String credentials = "username:password";
// Codec<String, String> stringToBase64 = utf8.fuse(base64);
// String encoded = stringToBase64.encode(credentials);
// String decoded = stringToBase64.decode(encoded);

import 'dart:convert';

const String saltString = 'secret';

String encodeString(String email, String password) {
  // return stringToBase64.encode('${s}__$salt');
  return base64.encode(utf8.encode('$email:${password}__$saltString'));
}

String decodeString(String encoded) {
  // return stringToBase64.decode(encoded).replaceAll('__$salt', '');
  return utf8.decode(base64.decode(encoded)).replaceAll('__$saltString', '');
}

String encodeStringPlain(String plain) {
  // return stringToBase64.encode('${s}__$salt');
  final String encodedPlain = base64.encode(utf8.encode(plain));
  final String p1 = encodedPlain.substring(0, 17);
  final String p2 = encodedPlain.substring(17, encodedPlain.length);
  return '$p2$p1';
}

String decodeStringPlain(String encoded) {
  if (encoded.isNotEmpty && encoded.length > 18) {
    // return stringToBase64.decode(encoded).replaceAll('__$salt', '');
    final String p1 = encoded.substring(encoded.length - 17);
    final String p2 = encoded.substring(0, encoded.length - 17);
    return utf8.decode(base64.decode('$p1$p2'));
  }
  return '';
}

bool isStrongPassword(String testPassword) {
  if (testPassword.length < 12) {
    return false;
  }

  RegExp regExp = RegExp(
    r"(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})",
    caseSensitive: true,
    multiLine: false,
  );

  return regExp.hasMatch(testPassword);
}
