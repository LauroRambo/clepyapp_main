import 'package:domain/entities/clepy_product.dart';
import 'package:equatable/equatable.dart';

abstract class FeedState extends Equatable {
  @override
  List<Object> get props => [];
}

class FeedStateInitial extends FeedState {}

class FeedStateLoadingInProgress extends FeedState {}

class FeedStateLoadSuccess extends FeedState {
  final List<ClepyProduct> products;
  FeedStateLoadSuccess({required this.products});
}
