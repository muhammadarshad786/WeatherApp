import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indicator/model/indicatoremodel.dart';

class ApiCall {
  Future<Indicatoremodel> getData() async {
    const link = 'https://api.waqi.info/feed/lahore/?token=4c161cc78151405d23e02d352f41b10bdf3df790';
    final url = Uri.parse(link);
    
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
        final data = json['data'];
        
        return Indicatoremodel(
          aqi: data['aqi'].toString(),
          pm25: data['iaqi']['pm25']['v'].toString(),
          pmp10: data['iaqi']['pm10'].toString() ,
          o3: data['iaqi']['o3'].toString(),
        );
      }
       else 
       {
        throw Exception('non-OK status');
      }
   }  
   
  }
