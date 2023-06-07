import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morti/core/error/failure.dart';
import 'package:rick_and_morti/feature/domain/usecases/search_person.dart';
import 'package:rick_and_morti/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_and_morti/feature/presentation/bloc/search_bloc/search_state.dart';

const serverfailuremessage = 'Запрос не найден';
const cachedfailyremessage = 'Cache Failure';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty());

  @override
  Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
    if (event is SearchPersons) {
      yield* _mapFetchPersonsToState(event.personQuery);
    }
  }

  Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
    yield PersonSearchLoading();

    final failureOrPerson =
        await searchPerson(SearchPersonParams(query: personQuery));

    yield failureOrPerson.fold(
        (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
        (person) => PersonSearchLoaded(persons: person));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverfailuremessage;
      case CacheFailure:
        return cachedfailyremessage;
      default:
        return 'Unexpected Error';
    }
  }
}
