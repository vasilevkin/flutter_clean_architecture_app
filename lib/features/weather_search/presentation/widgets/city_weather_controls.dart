import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_app/app/constants.dart';
// import 'package:flutter_clean_architecture_app/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/presentation/bloc/bloc.dart';

class CityWeatherControls extends StatefulWidget {
  @override
  _CityWeatherControlsState createState() => _CityWeatherControlsState();
}

class _CityWeatherControlsState extends State<CityWeatherControls> {
  final _controller = TextEditingController();
  String inputString = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          // keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: Constants.cityInputHint,
          ),
          onChanged: (value) {
            inputString = value;
          },
          onSubmitted: (_) => dispatchConcrete,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: dispatchConcrete,
                child: Text(Constants.search),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: dispatchRandom,
                child: Text(Constants.randomCity),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void dispatchConcrete() {
    _controller.clear();

    BlocProvider.of<WeatherSearchBloc>(context)
        .add(GetWeatherForConcreteCity(inputString));
  }

  void dispatchRandom() {
    _controller.clear();

    BlocProvider.of<WeatherSearchBloc>(context)
        .add(GetWeatherForRandomSearch());
  }
}
