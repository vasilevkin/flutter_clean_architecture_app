import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_app/app/constants.dart';
import 'package:flutter_clean_architecture_app/app/injection_container.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/presentation/bloc/bloc.dart';
import 'package:flutter_clean_architecture_app/features/weather_search/presentation/widgets/widgets.dart';

class WeatherSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocProvider<WeatherSearchBloc>(
      create: (_) => sl<WeatherSearchBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 10),
              BlocBuilder<WeatherSearchBloc, WeatherSearchState>(
                builder: (context, state) {
                  if (state is Initial) {
                    return WeatherMessageDisplay(
                      message: Constants.start,
                    );
                  } else if (state is Loading) {
                    return WeatherLoadingWidget();
                  } else if (state is Success) {
                    return WeatherDisplay(cityWeather: state.cityWeather);
                  } else if (state is Error) {
                    return WeatherMessageDisplay(message: state.message);
                  }
                  return WeatherMessageDisplay(
                    message: Constants.DEFAULT_FAILURE_MESSAGE,
                  );
                },
              ),
              SizedBox(height: 24),
              CityWeatherControls(),
            ],
          ),
        ),
      ),
    );
  }
}
