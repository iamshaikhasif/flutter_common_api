import 'dart:convert';

import 'package:common_app_required/ApiService/api_client.dart';
import 'package:common_app_required/ApiService/api_key.dart';
import 'package:common_app_required/utils/utils.dart';
import 'package:flutter/material.dart';

import '../Models/ayurveda_hub_response.dart';
import '../Models/getHra_answers_request.dart';
import '../Models/hq_response_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // var res = await ApiClient.instance.apiRequest<List<AyurvedaHubResponse>>(
    //     ApiKey.getAyurvedaList,
    //     RequestMethod.get,
    //     (json) => ayurvedaDataFromJson(jsonEncode(json)));

    //getHraQuestions
    var request = GetHraAnswersRequest(
        clientID: "be3d4965-1983-4f36-adc9-50be0c710626",
        integrationID: "12DFFB6F-ADAA-4C8E-B1B2-D76AAA939135");
    var res = await ApiClient.instance.apiRequest<HqResponseModel>(
      ApiKey.getHraQuestions,
      RequestMethod.post,
      (json) => HqResponseModel.fromJson(
        json,
      ),
      body: ApiClient.instance.objectToJsonEncoded(request),
    );

    CommonUtils.instance.debugLog("res", "$res");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
    ));
  }
}
