
import 'package:bloc/bloc.dart';

class my_bloc_observer extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('on create --${bloc.runtimeType}');
  }
  @override
  void onChange(BlocBase bloc, Change change) {

    super.onChange(bloc, change);
    print('on change --${bloc.runtimeType},$change');
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('on Error --${bloc.runtimeType},$error');
  }
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('on Close --${bloc.runtimeType}');
  }
}