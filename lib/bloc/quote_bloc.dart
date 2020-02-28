import 'package:bloc_pattern_flutter/bloc/bloc.dart';
import 'package:bloc_pattern_flutter/model/models.dart';
import 'package:bloc_pattern_flutter/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class  QuoteBloc extends Bloc<QuoteEvent, QuoteState>{
  final QuoteRepository repository;

  QuoteBloc({@required this.repository}):assert(repository != null);

  @override
  QuoteState get initialState => QuoteEmpty();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if(event is FetchQuote){
      yield QuoteLoading();
      try{
        final Quote quote = await repository.fetchQuote();
        yield QuoteLoaded(quote: quote);
      }catch(_){
        yield QuoteError();
      }
    }
  }

}