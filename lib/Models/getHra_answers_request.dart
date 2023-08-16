/// CustomerID : ""
/// integrationID : ""

class GetHraAnswersRequest {
  GetHraAnswersRequest({
      String? clientID,
      String? integrationID,}){
    _clientID = clientID;
    _integrationID = integrationID;
}

  GetHraAnswersRequest.fromJson(dynamic json) {
    _clientID = json['ClientID'];
    _integrationID = json['integrationID'];
  }
  String? _clientID;
  String? _integrationID;
GetHraAnswersRequest copyWith({  String? customerID,
  String? integrationID,
}) => GetHraAnswersRequest(  clientID: customerID ?? _clientID,
  integrationID: integrationID ?? _integrationID,
);
  String? get customerID => _clientID;
  String? get integrationID => _integrationID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ClientID'] = _clientID;
    map['integrationID'] = _integrationID;
    return map;
  }

}