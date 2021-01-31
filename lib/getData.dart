import 'package:dio/dio.dart';

Future getData() async {
  Dio dio = new Dio();
  try{
  Response res = await dio.get(
      'http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?offset=0&limit=10');

  return res.data;
  }catch(err){
    print(err);
  } 
}
