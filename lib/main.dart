import 'package:bloc_pattern_flutter/bloc/bloc.dart';
import 'package:bloc_pattern_flutter/repositories/quote_api_client.dart';
import 'package:bloc_pattern_flutter/repositories/repositories.dart';
import 'package:bloc_pattern_flutter/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SimpleBlocDelegate extends BlocDelegate{
  @override
  void onTransition(Bloc bloc, Transition transition){
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main(){
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final QuoteRepository repository = QuoteRepository(  
    quoteApiClient: QuoteApiClient(
      httpClient: http.Client(),
      ),
  );

  runApp(App(repository:repository));
}

class App extends StatelessWidget {
  final QuoteRepository repository;

  App({Key key, @required this.repository})
     : assert(repository != null), super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      home: Scaffold(  
        appBar: AppBar(  
          title: Text('Quote'),
        ),
        body: BlocProvider(  
          create: (context) => QuoteBloc(repository: repository),
          child: HomePage(),
        ),
      )
    );
  }
}