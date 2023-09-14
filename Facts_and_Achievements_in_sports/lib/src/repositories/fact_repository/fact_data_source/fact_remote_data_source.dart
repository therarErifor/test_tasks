import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'fact_data_source.dart';
import 'fact_dto/fact_list_dto.dart';

class FactRemoteDataSource implements FactDataSource{

  @override
  Future<FactListDto> getFactDtoAsync() async{
    final response = await rootBundle.loadString('assets/facts_data/facts_data.json');
    final Map<String, dynamic> data = await jsonDecode(response);
    return FactListDto.fromJson(data);
  }
}