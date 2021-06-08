import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_app/app/constants.dart';
import 'package:flutter_clean_architecture_app/app/injection_container.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:flutter_clean_architecture_app/features/number_trivia/presentation/widgets/widgets.dart';

class NumberTriviaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider<NumberTriviaBloc>(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 10),
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      message: Constants.start,
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaDisplay(numberTrivia: state.trivia);
                  } else if (state is Error) {
                    return MessageDisplay(message: state.message);
                  }
                  return MessageDisplay(
                    message: Constants.DEFAULT_FAILURE_MESSAGE,
                  );  
                },
              ),
              SizedBox(height: 24),
              TriviaControls(),
            ],
          ),
        ),
      ),
    );
  }
}
