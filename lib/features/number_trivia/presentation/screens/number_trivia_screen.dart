import 'package:flutter/material.dart';

import '../../domain/entities/number_trivia.dart';
import '../widgets/loading.dart';
import '../widgets/message_display.dart';
import '../widgets/trivia_controls.dart';
import '../widgets/trivia_display.dart';

class NumberTriviaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Loading(),
        MessageDisplay(
          message: 'Message',
        ),
        TriviaControls(),
        TriviaDisplay(numberTrivia: NumberTrivia(text: 'text', number: 1)),
      ],
    );
  }
}
