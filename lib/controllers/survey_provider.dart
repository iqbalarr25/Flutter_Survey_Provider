import 'package:flutter/material.dart';
import 'package:flutter_starter/models/survey_model.dart';

class SurveyProvider extends ChangeNotifier {
  SurveyModel surveyModel = SurveyModel();
  bool checkNull = false;  
  var _indexPertanyaan = 0;
  final List<String> _survey = [];

  //initailize list value with ""
  SurveyProvider() {
    for (int i = 0;
        i < surveyModel.getListPertanyaanJawabanSurvey.length;
        i++) {
      _survey.insert(i, "");
    }
  }

  void inputSurvey(String survey) {
    if (surveyModel.getListPertanyaanJawabanSurvey.length != _indexPertanyaan &&
        survey.isNotEmpty) {
      //remove value from list, if the value is already inserted before
      if (_survey.length > _indexPertanyaan) {
        _survey.removeAt(_indexPertanyaan);
      }
      _survey.insert(_indexPertanyaan, survey);
    }
    checkerList();
    notifyListeners();
  }

  void nextPertanyaan() {
    if (_indexPertanyaan != surveyModel.getListPertanyaanJawabanSurvey.length-1) {
      _indexPertanyaan++;
      checkerList();
    }
    notifyListeners();
  }

  void backPertanyaan() {
    if (_indexPertanyaan != 0) {
      _indexPertanyaan--;
      notifyListeners();
    }
    checkerList();
  }

  // check if list has null value
  void checkerList(){
    for(String jawabanSurvey in _survey){
      if(jawabanSurvey==""){
        checkNull=true;
        break;
      }else{
        checkNull=false;
      }
    }
  }

  List<String> get getSurvey => _survey;

  int get getIndexPertanyaan => _indexPertanyaan;
}
