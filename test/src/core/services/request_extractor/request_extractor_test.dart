import 'dart:convert';

import 'package:backend/src/core/services/request_extractor/request_extractor.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

void main() {
  final extractor = RequestExtractor();

  test('getAuthorizationBearer', () async {
    final request = Request('GET', Uri.parse('http://localhost/'), headers: {
      'authorization': 'bearer jadjadjadajwjsajdaojwd',
    });
    final token = extractor.getAuthorizationBearer(request);
    expect(token, 'jadjadjadajwjsajdaojwd');
  });

  test('getAuthorizationBasic', () async {
    var credentialAuth = 'tecnoxsistemas:12345';
    credentialAuth = base64Encode(credentialAuth.codeUnits);

    final request = Request('GET', Uri.parse('http://localhost/'), headers: {
      'authorization': 'basic $credentialAuth',
    });
    final credential = extractor.getAuthorizationBasic(request);
    expect(credential.username, 'tecnoxsistemas');
    expect(credential.password, '12345');
  });
}
