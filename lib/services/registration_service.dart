import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nscc_app/services/my_shared_service.dart';

class RegistrationService {
  Future getFields(String eventId) async {
    String? token = await MySharedService().getSharedToken();
    String url =
        "https://asia-south1-nsccpccoe.cloudfunctions.net/register/$eventId/fields";
    var response = await Dio().get(
      url,
      options: Options(headers: {
        "authorization":
            "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjVhNTA5ZjAxOWY3MGQ3NzlkODBmMTUyZDFhNWQzMzgxMWFiN2NlZjciLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiU2Frc2hpIFBvcmUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUVkRlRwNWhDZGdkc0hjZ2hibERkMlY1S2dhTmpKVF9BNU1ZdnphMEpULWc9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbnNjY3BjY29lIiwiYXVkIjoibnNjY3BjY29lIiwiYXV0aF90aW1lIjoxNjc1NjgxMjg1LCJ1c2VyX2lkIjoiMmVnVlliWHJHU1Z2QWR3dmNBYWtiMXJab0VpMSIsInN1YiI6IjJlZ1ZZYlhyR1NWdkFkd3ZjQWFrYjFyWm9FaTEiLCJpYXQiOjE2NzU2ODEyODUsImV4cCI6MTY3NTY4NDg4NSwiZW1haWwiOiJzYWtzaGlwb3JlMjhAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMDE3OTUxODg0NTU0NzQ3OTQxODYiXSwiZW1haWwiOlsic2Frc2hpcG9yZTI4QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.SNCRBpFuEONvNQQZlVQ-uAj89HLnGATVm4p-2DX4R2vhh995WFwMe50FiTnUS8mM_vRfd9AMYOBhNRQ7rYjV5ANs-C0MnclWQybnfp1n4loEGqkDKqwBJJ7MRCCBEsB-Ul14q6-wA1l-vhQzrkP3bwZYzgP9xpsc1B4GxTz0py32MsJMe0ibXFB5thO7j8X1Jutg0Sfkj9egnVM3VMSEOhKaJKL7quLg_9jbWsCqHWBrbYvIREz2xakHFQUvajz170kubZlwnO02QgUScrjwf5YdOdtvmOQHUWGwQFpXO5YBdh5mOxeNlAiI9prwd0VsUMFdWulwF4i7R-KMoAGGAQ"
      }),
    );
    return response.data;
  }

  Future register(String eventId, Map<String, dynamic> data) async {
    String? token = await MySharedService().getSharedToken();
    String url =
        "https://asia-south1-nsccpccoe.cloudfunctions.net/register/$eventId";
    var response = await Dio().post(
      url,
      data: data,
      options: Options(headers: {
        "authorization":
            "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjVhNTA5ZjAxOWY3MGQ3NzlkODBmMTUyZDFhNWQzMzgxMWFiN2NlZjciLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiU2Frc2hpIFBvcmUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUVkRlRwNWhDZGdkc0hjZ2hibERkMlY1S2dhTmpKVF9BNU1ZdnphMEpULWc9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbnNjY3BjY29lIiwiYXVkIjoibnNjY3BjY29lIiwiYXV0aF90aW1lIjoxNjc1NjgxMjg1LCJ1c2VyX2lkIjoiMmVnVlliWHJHU1Z2QWR3dmNBYWtiMXJab0VpMSIsInN1YiI6IjJlZ1ZZYlhyR1NWdkFkd3ZjQWFrYjFyWm9FaTEiLCJpYXQiOjE2NzU2ODEyODUsImV4cCI6MTY3NTY4NDg4NSwiZW1haWwiOiJzYWtzaGlwb3JlMjhAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMDE3OTUxODg0NTU0NzQ3OTQxODYiXSwiZW1haWwiOlsic2Frc2hpcG9yZTI4QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.SNCRBpFuEONvNQQZlVQ-uAj89HLnGATVm4p-2DX4R2vhh995WFwMe50FiTnUS8mM_vRfd9AMYOBhNRQ7rYjV5ANs-C0MnclWQybnfp1n4loEGqkDKqwBJJ7MRCCBEsB-Ul14q6-wA1l-vhQzrkP3bwZYzgP9xpsc1B4GxTz0py32MsJMe0ibXFB5thO7j8X1Jutg0Sfkj9egnVM3VMSEOhKaJKL7quLg_9jbWsCqHWBrbYvIREz2xakHFQUvajz170kubZlwnO02QgUScrjwf5YdOdtvmOQHUWGwQFpXO5YBdh5mOxeNlAiI9prwd0VsUMFdWulwF4i7R-KMoAGGAQ"
      }),
    );
    return response.data;
  }
}

/*

*/