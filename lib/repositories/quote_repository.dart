import 'package:bloc_pattern_flutter/model/models.dart';
import 'package:bloc_pattern_flutter/repositories/quote_api_client.dart';
import 'package:meta/meta.dart';

class QuoteRepository{
  final QuoteApiClient quoteApiClient;

  QuoteRepository({@required this.quoteApiClient})
      : assert(quoteApiClient != null);
      
  Future<Quote> fetchQuote() async{
    return await quoteApiClient.fetchQuote();
  }

}