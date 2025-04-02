import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';

import 'amplify_outputs.dart';
import 'amp-models/ModelProvider.dart';
import 'package:words_numbers/words_numbers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await _configureAmplify();
    runApp(const MyApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

Future<void> _configureAmplify() async {
  try {
    final api = AmplifyAPI(
      options: APIPluginOptions(modelProvider: ModelProvider.instance),
    );
    await Amplify.addPlugins([api]);
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyConfig);
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        title: 'Exam results - for teachers',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(5, 30, 27, 100)),
        ),
        home: const MyHomePage(title: 'Exam Results Teacher APP'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _entryState = 'initial'; //'addExam' 'resultsEntry';
  late List<Exam?> _exams = [];
  late List<Result?> _results = [];
  late Exam _newExam = Exam(subject: '');
  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    getExamList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
          (_entryState == 'initial')
              ? SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Exams:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      examListTable(),
                    ],
                  ),
                ),
              )
              : (_entryState == 'resultsEntry')
              ? SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'New exam: ${_newExam.subject}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: examResultEntry(),
                      ),
                      resultsListTable(),
                    ],
                  ),
                ),
              )
              : Center(
                // addExam
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'New exam:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: newExamEntry(),
                    ),
                  ],
                ),
              ),
      floatingActionButton:
          (_entryState == 'initial')
              ? FloatingActionButton(
                onPressed: _addExam,
                tooltip: 'Add',
                child: const Icon(Icons.add),
              )
              : null, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _addExam() async {
    _textFieldController.text = '';
    setState(() {
      _entryState = 'addExam';
    });
  }

  Future<List<Exam?>> getExamList() async {
    try {
      final request = ModelQueries.list(
        Exam.classType,
        authorizationMode: APIAuthorizationType.userPools,
      );
      final response = await Amplify.API.query(request: request).response;

      final exams = response.data?.items;
      if (exams == null) {
        safePrint('errors: ${response.errors}');
        return const [];
      }
      setState(() {
        _exams = exams;
      });
      return exams;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return const [];
    }
  }

  Table examListTable() {
    return Table(
      border: TableBorder.all(width: 1.0, color: Colors.black),
      children: [
        for (var exam in _exams)
          TableRow(
            children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(exam!.subject ?? 'unknown'),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }

  Table resultsListTable() {
    return Table(
      border: TableBorder.all(width: 1.0, color: Colors.black),
      children: [
        for (var result in _results)
          TableRow(
            children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 2, 2, 2),
                        child: Text(result!.studentName ?? 'unknown'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 2, 2),
                        child: Text(result.grade.toString()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }

  Row examResultEntry() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 8,
          child: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Student - grade"),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              addResult();
            },
            child: Icon(Icons.add, size: 40),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              getExamList();
              setState(() {
                _entryState = 'initial';
              });
            },
            child: Icon(Icons.done, size: 40),
          ),
        ),
      ],
    );
  }

  Row newExamEntry() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 8,
          child: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Exam subject"),
          ),
        ),

        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () async {
              _textFieldController.text = '';
              setState(() {
                _entryState = 'initial';
              });
            },
            child: Icon(Icons.cancel, size: 40),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () async {
              await createExam(_textFieldController.text);
              _textFieldController.text = '';
              setState(() {
                _entryState = 'resultsEntry';
              });
            },
            child: Icon(Icons.done, size: 40),
          ),
        ),
      ],
    );
  }

  Future<void> createExam(String subject) async {
    try {
      final exam = Exam(date: TemporalDateTime.now(), subject: subject);
      final request = ModelMutations.create(
        exam,
        authorizationMode: APIAuthorizationType.userPools,
      );
      final response = await Amplify.API.mutate(request: request).response;

      final createdExam = response.data;
      if (createdExam == null) {
        safePrint('errors: ${response.errors}');
        return;
      }
      safePrint('Mutation result: ${createdExam.date}');
      setState(() {
        _newExam = createdExam;
      });
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }

  Future<void> addResult() async {
    var words = _textFieldController.text.split(' ');
    int length = words.length;
    if (length > 0) {
      Result newRes = Result();
      String inputStr = '';
      int inputInt = 0;
      if (words.isNotEmpty) {
        inputStr = WordsNumbers.convertTextNumberToString(words[length - 1]);
        var parseRes = int.tryParse(inputStr);
        if (parseRes != null) {
          inputInt = parseRes;
        }
        newRes = Result(studentName: words[0], grade: inputInt);
        
      }
      _textFieldController.text = '';
      try {
        final result = Result(
          studentName: words[0],
          grade: inputInt,
          exam: _newExam,
        );
        final request = ModelMutations.create(
          result,
          authorizationMode: APIAuthorizationType.userPools,
        );
        final response = await Amplify.API.mutate(request: request).response;

        final createdResult = response.data;
        if (createdResult == null) {
          safePrint('errors: ${response.errors}');
          return;
        }
        safePrint('Mutation result: ${createdResult.studentName} ${createdResult.grade}');
        setState(() {
          _results.add(newRes);
        });
      } on ApiException catch (e) {
        safePrint('Mutation failed: $e');
      }
    }
  }
}
