
import 'package:bloc/bloc.dart';
import 'package:ezara3_1/app_cubit/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class app_cubit extends Cubit<app_states> {
  app_cubit() : super(app_initial_state());

  static app_cubit get(context) {
    return BlocProvider.of(context);
  }

}
