part of 'page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Makanan favorit: " + surveyProvider.getSurvey[0],
                ),
                Text(
                  "Minuman favorit: " + surveyProvider.getSurvey[1],
                ),
                Text(
                  "Waifu genshin favorit: " + surveyProvider.getSurvey[2],
                ),
                Text(
                  "Waifu arknight favorit: " + surveyProvider.getSurvey[3],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
