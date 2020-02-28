import 'package:bloc_pattern_flutter/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state){
          print(state);
          if(state is QuoteEmpty){
            BlocProvider.of<QuoteBloc>(context).add(FetchQuote());
          }
          if(state is QuoteError){
            return Center(  
              child:  Text('failed to fetch quote'),
            );
          }
          if(state is QuoteLoaded){
            print(state);
            return ListTile( 
              leading: Text(  
                '${state.quote.id}',  
              ),
              title: Text(state.quote.quoteText),
              isThreeLine: true,
              subtitle: Text(state.quote.quoteAuthor),
              dense: true,
            );
          }
          return Center(  
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}