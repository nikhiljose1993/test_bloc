part of 'count_bloc.dart';

abstract class CountEvent {}

class Increment extends CountEvent {}

class Decrement extends CountEvent {}
