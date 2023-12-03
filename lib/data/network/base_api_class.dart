
abstract class BaseApiClass{

  Future<dynamic> getApiCall(String uri);

  Future<dynamic> postApiCall(String uri , dynamic data);

  Future<dynamic> updateApiCall(String uri, dynamic data);

  Future<dynamic> deleteApiCall(String uri);
}