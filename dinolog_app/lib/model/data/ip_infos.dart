// {
//   "ip": "207.90.244.28",
//   "city": "Fort Worth",
//   "region": "Texas",
//   "country": "US",
//   "loc": "32.7254,-97.3208",
//   "org": "AS174 Cogent Communications, LLC",
//   "postal": "76104",
//   "timezone": "America/Chicago",
//   "readme": "https://ipinfo.io/missingauth"
// }
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ip_infos.freezed.dart';
part 'ip_infos.g.dart';

@freezed
abstract class IpInfos with _$IpInfos {
  @JsonSerializable(explicitToJson: true)
  const factory IpInfos({
    required String ip,
    required String city,
    required String region,
    required String country,
    required String loc,
    required String org,
    required String postal,
    required String timezone,
  }) = _IpInfos;

  factory IpInfos.fromJson(Map<String, dynamic> json) =>
      _$IpInfosFromJson(json);
}

extension IpInfosExtension on IpInfos {
  String get countryFlag {
    try {
      final int base = 0x1F1E6 - 'A'.codeUnitAt(0);
      final int firstChar = country.codeUnitAt(0) + base;
      final int secondChar = country.codeUnitAt(1) + base;
      return String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
    } catch (e) {
      return '';
    }
  }
}
