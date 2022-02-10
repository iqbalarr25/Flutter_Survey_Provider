part of 'widget.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key, required this.surveyProvider, required this.survey})
      : super(key: key);

  final SurveyProvider surveyProvider;
  final SurveyModel survey;

  @override
  Widget build(BuildContext context) {
    return Text(
      survey.getListPertanyaanJawabanSurvey[surveyProvider.getIndexPertanyaan]
              [0]
          .toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
