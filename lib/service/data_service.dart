import 'package:dio/dio.dart';
import 'package:flutquiz/model/model_app.dart';

abstract class Service {
  Dio dio = Dio();
  String baseurl = "https://freetestapi.com/api/v1/products";
  Future<List<DataModel>> getData();
}

class DataServiceImp extends Service {
  @override
  Future<List<DataModel>> getData() async {
    try {
      Response response = await dio.get(baseurl);
      if (response.statusCode == 200) {
        print(response.data);
        List<DataModel> chats = List.generate(
          response.data.length,
          (index) => DataModel.fromMap(response.data[index]),
        );
        return chats;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print("Dio Exception: ${e.message}");
      return [];
    } catch (e) {
      print("General error: $e");
      return [];
    }
  }
}
