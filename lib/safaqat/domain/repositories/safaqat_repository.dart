
import 'package:safaqat/safaqat/data/models/auth/change_password/change_password_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_body.dart';
import 'package:safaqat/safaqat/data/models/auth/login/login_dto.dart';
import 'package:safaqat/safaqat/data/models/auth/register/register_body.dart';
import 'package:safaqat/safaqat/data/models/city/city_dto.dart';
import 'package:safaqat/safaqat/data/models/country/country_dto.dart';
import 'package:safaqat/safaqat/data/models/customer/customer_response.dart';
import 'package:safaqat/safaqat/data/models/news/publish_news_body.dart';
import 'package:safaqat/safaqat/domain/entities/resources.dart';

abstract class SafaqatRepository {
  Future<Resources<CustomerResponse>> getCustomers();

  Future<Resources<List<CityDto>>> getCities(int countryCode);

  Future<Resources<List<CountryDto>>> getCountries();

  Future<Resources<List<CountryDto>>> searchNews(String query);

  // Future<Resources> publishNews(PublishNewsBody body);
}
