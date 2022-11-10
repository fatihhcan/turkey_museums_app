import '../../../core/init/network/dio_client.dart';


abstract class IFilterService {
  final DioClient client;
  IFilterService(this.client);

  Future<List<dynamic>?> fetchCity();
}
