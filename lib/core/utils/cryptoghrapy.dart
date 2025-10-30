import 'dart:convert';
import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

const pass = 'super-secret-passphrase-min-16-char';

String _b64(Uint8List bytes) => base64UrlEncode(bytes).replaceAll('=', '');

Uint8List _b64d(String s) {
  final buf = StringBuffer(s);
  final rem = s.length & 3;
  if (rem != 0) {
    for (var i = 0; i < 4 - rem; i++) {
      buf.write('=');
    }
  }
  return Uint8List.fromList(base64Url.decode(buf.toString()));
}

Future<SecretKey> _deriveKey({
  required String passphrase,
  required Uint8List salt,
}) async {
  final hkdf = Hkdf(hmac: Hmac.sha256(), outputLength: 32);
  return hkdf.deriveKey(
    secretKey: SecretKey(utf8.encode(passphrase)),
    nonce: salt,
    // info: utf8.encode('d30-qr-payment:v1'),
  );
}

Future<String> encryptPayloadAesGcmDeterministic({
  required Map<String, dynamic> jsonMap,
  required String passphrase,
}) async {
  final alg = AesGcm.with256bits();
  final salt = Uint8List.fromList([11,22,33,44,55,66,77,88,99,110,121,130,140,150,160,170]);
  final nonce = Uint8List.fromList([1,2,3,4,5,6,7,8,9,10,11,12]);

  final key = await _deriveKey(passphrase: passphrase, salt: salt);

  final cleartext = utf8.encode(json.encode(jsonMap));

  final sb = await alg.encrypt(
    cleartext,
    secretKey: key,
    nonce: nonce,
  );

  final combined = Uint8List.fromList(sb.cipherText + sb.mac.bytes);
  final wrapped = {
    'v': 1,
    'alg': 'AES-GCM/HKDF-SHA256',
    'salt': _b64(salt),
    'nonce': _b64(nonce),
    'ct': _b64(combined),
  };
  return json.encode(wrapped);
}

Future<Map<String, dynamic>> decryptPayload({
  required String encryptedJson,
  required String passphrase,
}) async {
  final obj = json.decode(encryptedJson) as Map<String, dynamic>;
  if (obj['alg'] != 'AES-GCM/HKDF-SHA256') {
    throw StateError('error');
  }

  final alg = AesGcm.with256bits();

  final salt  = _b64d(obj['salt']  as String);
  final nonce = _b64d(obj['nonce'] as String);
  final ctAll = _b64d(obj['ct']    as String);

  if (ctAll.length < 16) {
    throw StateError('Ciphertext too short');
  }
  final cipherText = ctAll.sublist(0, ctAll.length - 16);
  final macBytes   = ctAll.sublist(ctAll.length - 16);

  final key = await _deriveKey(passphrase: passphrase, salt: salt);

  final secretBox = SecretBox(
    cipherText,
    nonce: nonce,
    mac: Mac(macBytes),
  );

  final clear = await alg.decrypt(
    secretBox,
    secretKey: key,
  );

  return json.decode(utf8.decode(clear)) as Map<String, dynamic>;
}
