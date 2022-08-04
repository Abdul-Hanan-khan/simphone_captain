part of 'all_captain_cubit.dart';

abstract class AllCaptainState extends Equatable {
  const AllCaptainState();

  @override
  List<Object> get props => [];
}

class AllInitial extends AllCaptainState {}

class LoadingState extends AllCaptainState {}

class SuccessfullyGetFetchedAllCaptain extends AllCaptainState {
  final List<Franchises> franchises;

  const SuccessfullyGetFetchedAllCaptain(this.franchises);
}

class FailedToFetchedCaptain extends AllCaptainState {
  final String name;

  const FailedToFetchedCaptain(this.name);
}
