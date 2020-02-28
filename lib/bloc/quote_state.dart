import 'package:bloc_pattern_flutter/model/models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


abstract class QuoteState extends Equatable{
  const QuoteState();

  @override 
  List<Object> get props => [];
}

class QuoteEmpty extends QuoteState {}

class QuoteLoading extends QuoteState{}

class QuoteError extends QuoteState{}

class QuoteLoaded extends QuoteState{
  final Quote quote;

  const QuoteLoaded({@required this.quote}):assert(quote != null);
  
  @override 
  List<Object> get props => [quote];
}