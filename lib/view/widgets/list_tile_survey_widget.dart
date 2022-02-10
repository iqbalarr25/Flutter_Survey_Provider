part of 'widget.dart';

class ListTileSurveyWidget extends StatelessWidget {
  const ListTileSurveyWidget(
      {Key? key,
      required this.surveyProvider,
      required this.index,
      required this.survey})
      : super(key: key);

  final SurveyProvider surveyProvider;
  final int index;
  final SurveyModel survey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        surveyProvider.inputSurvey(survey.getListPertanyaanJawabanSurvey[
            surveyProvider.getIndexPertanyaan][index] as String);
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: (surveyProvider.getSurvey.length >
                  surveyProvider.getIndexPertanyaan)
              ? (surveyProvider.getSurvey[surveyProvider.getIndexPertanyaan] ==
                      survey.getListPertanyaanJawabanSurvey[
                              surveyProvider.getIndexPertanyaan][index]
                          .toString())
                  ? Colors.red[50]
                  : Colors.white
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xff263238),
            width: 0.1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 20,
            left: 20,
            bottom: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                survey.getListPertanyaanJawabanSurvey[
                        surveyProvider.getIndexPertanyaan][index]
                    .toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Radio(
                activeColor: Colors.red[800],
                value: survey.getListPertanyaanJawabanSurvey[
                        surveyProvider.getIndexPertanyaan][index]
                    .toString(),
                groupValue: (surveyProvider.getSurvey.length >
                        surveyProvider.getIndexPertanyaan)
                    ? surveyProvider
                        .getSurvey[surveyProvider.getIndexPertanyaan]
                    : surveyProvider.getSurvey,
                onChanged: (value) {
                  surveyProvider.inputSurvey(
                      survey.getListPertanyaanJawabanSurvey[
                          surveyProvider.getIndexPertanyaan][index] as String);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
