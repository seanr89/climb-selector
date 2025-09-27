
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    return Response(statusCode: HttpStatus.created);
  }
  return Response(statusCode: HttpStatus.methodNotAllowed);
}
