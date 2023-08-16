
import 'dart:convert';

List<AyurvedaHubResponse> ayurvedaDataFromJson(String str) => List<AyurvedaHubResponse>.from(
    json.decode(str).map((x) => AyurvedaHubResponse.fromJson(x)));

class AyurvedaHubResponse {
  AyurvedaHubResponse({
      num? aHId, 
      String? ayurvedaDesc, 
      String? ayurvedaName, 
      String? imgPath,}){
    _aHId = aHId;
    _ayurvedaDesc = ayurvedaDesc;
    _ayurvedaName = ayurvedaName;
    _imgPath = imgPath;
}

  AyurvedaHubResponse.fromJson(dynamic json) {
    _aHId = json['AHId'];
    _ayurvedaDesc = json['AyurvedaDesc'];
    _ayurvedaName = json['AyurvedaName'];
    _imgPath = json['ImgPath'];
  }
  num? _aHId;
  String? _ayurvedaDesc;
  String? _ayurvedaName;
  String? _imgPath;
AyurvedaHubResponse copyWith({  num? aHId,
  String? ayurvedaDesc,
  String? ayurvedaName,
  String? imgPath,
}) => AyurvedaHubResponse(  aHId: aHId ?? _aHId,
  ayurvedaDesc: ayurvedaDesc ?? _ayurvedaDesc,
  ayurvedaName: ayurvedaName ?? _ayurvedaName,
  imgPath: imgPath ?? _imgPath,
);
  num? get aHId => _aHId;
  String? get ayurvedaDesc => _ayurvedaDesc;
  String? get ayurvedaName => _ayurvedaName;
  String? get imgPath => _imgPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AHId'] = _aHId;
    map['AyurvedaDesc'] = _ayurvedaDesc;
    map['AyurvedaName'] = _ayurvedaName;
    map['ImgPath'] = _imgPath;
    return map;
  }

}