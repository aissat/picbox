import 'package:bloc/bloc.dart';
import 'package:picbox/src/blocs/counter/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;

      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
