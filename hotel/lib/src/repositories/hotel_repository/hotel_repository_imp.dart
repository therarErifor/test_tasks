import '../../repositories/hotel_repository/hotel_entities/about_the_hotel.dart';
import '../../repositories/hotel_repository/hotel_entities/hotel_data.dart';
import '../repository_entities/resp.dart';
import 'hotel_data_source/hotel_remote_data_source.dart';
import 'hotel_repository.dart';

class HotelRepositoryImp extends HotelRepository{
  final HotelRemoteDataSource _hotelRemoteDataSource = HotelRemoteDataSource();

  @override
  Future<Resp<HotelData>> getHotelDataAsync()async{
    final resp = await _hotelRemoteDataSource.getHotelDataDtoAsync();
    final dataDto = resp.data;

    if((resp.isSuccessTheResp == true)&&(dataDto != null)){
      var aboutTheHotelDto = dataDto.about_the_hotel;
      return Resp(HotelData(
        id: dataDto.id,
        name: dataDto.name,
        adress: dataDto.adress,
        minimalPrice: dataDto.minimal_price,
        priceForIt: dataDto.price_for_it,
        rating: dataDto.rating,
        ratingName: dataDto.rating_name,
        imageUrls: dataDto.image_urls,
        aboutTheHotel: AboutTheHotel(
            description: aboutTheHotelDto.description,
            peculiarities: aboutTheHotelDto.peculiarities),
        imageId: 0
      ), null);
    }
    return Resp(null, resp.error);
  }


}