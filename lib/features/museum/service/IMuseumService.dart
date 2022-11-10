import 'package:turkey_museum_app/features/museum/model/museum_model.dart';
import '../../../core/init/network/dio_client.dart';

abstract class IMuseumService {
  final DioClient client;
  IMuseumService(this.client);

  Future<List<MuseumModel>?> fetchMuseum(String city, String county);
}
