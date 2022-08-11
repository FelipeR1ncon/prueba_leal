import 'package:dio/dio.dart';
import 'package:prueba_leal/infrastructure/data/datasource/const_rest.dart';

///Se realiza esta clase para no usar el plugin directamente en las capas superiores
///asi si este llega a cambiar no tenemos que modificarlas.
class HttpClient {
  late Dio client;

  HttpClient() {
    client = Dio();
  }

  dynamic get({required urlRequest, Map<String, dynamic>? params}) async {
    try {
      params ??= {};
      params["language"] = "en-US";
      params["api_key"] = ConstRest.sss;
      Response response = await client.get(ConstRest.baseUrl + urlRequest,
          queryParameters: params);

      if (response.statusCode == 200) {
        return response;
      } else {
        return Exception(
            "Error realizando la peticion get con la url $urlRequest");
      }
    } on DioError catch (e) {
      ///TODO: SE DEBERIA DE DESGLOSAR CADA ERROR Y LANZAR UNA ERROR MAS
      ///ESPECIFICO
      return Exception(e);
    }
  }
}
