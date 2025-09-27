
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  if (context.request.method == HttpMethod.get) {
    return Response.json(body: []);
  }
  return Response(statusCode: HttpStatus.methodNotAllowed);
}
