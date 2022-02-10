part of 'page.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  SurveyModel survey = SurveyModel();

  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyProvider>(
      builder: (context, surveyProvider, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          title: const Text("Survey Provider"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              QuestionWidget(
                surveyProvider: surveyProvider,
                survey: survey,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: survey
                            .getListPertanyaanJawabanSurvey[
                                surveyProvider.getIndexPertanyaan]
                            .length,
                        itemBuilder: (context, index) {
                          if (index >= 1) {
                            return Column(
                              children: [
                                ListTileSurveyWidget(
                                  surveyProvider: surveyProvider,
                                  index: index,
                                  survey: survey,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        surveyProvider.backPertanyaan();
                      },
                      color: Colors.white,
                      child: const Text("Back"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    (surveyProvider.getSurvey.length ==
                                survey.getListPertanyaanJawabanSurvey.length &&
                            surveyProvider.getSurvey.length - 1 ==
                                surveyProvider.getIndexPertanyaan &&
                            !surveyProvider.checkNull)
                        ? RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ResultPage(),
                                ),
                              );
                            },
                            color: Colors.red[800],
                            child: const Text(
                              "Finish",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : RaisedButton(
                            onPressed: () {
                              surveyProvider.nextPertanyaan();
                            },
                            color: Colors.red[800],
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
