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
            "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjVhNTA5ZjAxOWY3MGQ3NzlkODBmMTUyZDFhNWQzMzgxMWFiN2NlZjciLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiU2Frc2hpIFBvcmUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUVkRlRwNWhDZGdkc0hjZ2hibERkMlY1S2dhTmpKVF9BNU1ZdnphMEpULWc9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbnNjY3BjY29lIiwiYXVkIjoibnNjY3BjY29lIiwiYXV0aF90aW1lIjoxNjc1NjgxMjg1LCJ1c2VyX2lkIjoiMmVnVlliWHJHU1Z2QWR3dmNBYWtiMXJab0VpMSIsInN1YiI6IjJlZ1ZZYlhyR1NWdkFkd3ZjQWFrYjFyWm9FaTEiLCJpYXQiOjE2NzU3NjE3NTMsImV4cCI6MTY3NTc2NTM1MywiZW1haWwiOiJzYWtzaGlwb3JlMjhAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMDE3OTUxODg0NTU0NzQ3OTQxODYiXSwiZW1haWwiOlsic2Frc2hpcG9yZTI4QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.k-RjeC9l1ln3CsxMPOc3IAf206fridpm9xfyzLtnIt4WKHZpqqr-lNTXreXnSDHeZV668fRtokdEyMEMQs6NacqSlHCt3efvEU0UllkwsiSwkK3T_Q-txOoWEPibRNbR30bRXNhoRNlZS6MamaCnmtq2zVVKsp1VcXyQizPF-FdUjwYuaD7b91VTK-Q5jSyqFTkw_inKRfUxORidRgGx528UVIZnd3vsBZfK5esdQqeh378Ju4SWWmK2F6J3gWsfZncwG0szBNXW_4e89ohU44gcm52PCRdD0sReG-V1CDVkv_u1AVmpTYRwd7Q2MRTZfFi0qZUyBR9oStseWzJesw"
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
            "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjVhNTA5ZjAxOWY3MGQ3NzlkODBmMTUyZDFhNWQzMzgxMWFiN2NlZjciLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiU2Frc2hpIFBvcmUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUVkRlRwNWhDZGdkc0hjZ2hibERkMlY1S2dhTmpKVF9BNU1ZdnphMEpULWc9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbnNjY3BjY29lIiwiYXVkIjoibnNjY3BjY29lIiwiYXV0aF90aW1lIjoxNjc1NjgxMjg1LCJ1c2VyX2lkIjoiMmVnVlliWHJHU1Z2QWR3dmNBYWtiMXJab0VpMSIsInN1YiI6IjJlZ1ZZYlhyR1NWdkFkd3ZjQWFrYjFyWm9FaTEiLCJpYXQiOjE2NzU3NjE3NTMsImV4cCI6MTY3NTc2NTM1MywiZW1haWwiOiJzYWtzaGlwb3JlMjhAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMDE3OTUxODg0NTU0NzQ3OTQxODYiXSwiZW1haWwiOlsic2Frc2hpcG9yZTI4QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.k-RjeC9l1ln3CsxMPOc3IAf206fridpm9xfyzLtnIt4WKHZpqqr-lNTXreXnSDHeZV668fRtokdEyMEMQs6NacqSlHCt3efvEU0UllkwsiSwkK3T_Q-txOoWEPibRNbR30bRXNhoRNlZS6MamaCnmtq2zVVKsp1VcXyQizPF-FdUjwYuaD7b91VTK-Q5jSyqFTkw_inKRfUxORidRgGx528UVIZnd3vsBZfK5esdQqeh378Ju4SWWmK2F6J3gWsfZncwG0szBNXW_4e89ohU44gcm52PCRdD0sReG-V1CDVkv_u1AVmpTYRwd7Q2MRTZfFi0qZUyBR9oStseWzJesw"
      }),
    );
    return response.data;
  }

  Future getRegistrationStatus(String eventId) async {
    String? token = await MySharedService().getSharedToken();
    String url =
        "https://asia-south1-nsccpccoe.cloudfunctions.net/register/$eventId/status";
    var response = await Dio().get(
      url,
      options: Options(headers: {
        "authorization":
            "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjVhNTA5ZjAxOWY3MGQ3NzlkODBmMTUyZDFhNWQzMzgxMWFiN2NlZjciLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiU2Frc2hpIFBvcmUiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUVkRlRwNWhDZGdkc0hjZ2hibERkMlY1S2dhTmpKVF9BNU1ZdnphMEpULWc9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbnNjY3BjY29lIiwiYXVkIjoibnNjY3BjY29lIiwiYXV0aF90aW1lIjoxNjc1NjgxMjg1LCJ1c2VyX2lkIjoiMmVnVlliWHJHU1Z2QWR3dmNBYWtiMXJab0VpMSIsInN1YiI6IjJlZ1ZZYlhyR1NWdkFkd3ZjQWFrYjFyWm9FaTEiLCJpYXQiOjE2NzU3NjE3NTMsImV4cCI6MTY3NTc2NTM1MywiZW1haWwiOiJzYWtzaGlwb3JlMjhAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMDE3OTUxODg0NTU0NzQ3OTQxODYiXSwiZW1haWwiOlsic2Frc2hpcG9yZTI4QGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6Imdvb2dsZS5jb20ifX0.k-RjeC9l1ln3CsxMPOc3IAf206fridpm9xfyzLtnIt4WKHZpqqr-lNTXreXnSDHeZV668fRtokdEyMEMQs6NacqSlHCt3efvEU0UllkwsiSwkK3T_Q-txOoWEPibRNbR30bRXNhoRNlZS6MamaCnmtq2zVVKsp1VcXyQizPF-FdUjwYuaD7b91VTK-Q5jSyqFTkw_inKRfUxORidRgGx528UVIZnd3vsBZfK5esdQqeh378Ju4SWWmK2F6J3gWsfZncwG0szBNXW_4e89ohU44gcm52PCRdD0sReG-V1CDVkv_u1AVmpTYRwd7Q2MRTZfFi0qZUyBR9oStseWzJesw"
      }),
    );
    log(response.data.toString());
    return response.data;
  }
}
