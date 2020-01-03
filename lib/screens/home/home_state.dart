import 'package:github_smaple/modals/commit_modal.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState{

  final bool isLoading;
  final bool isLoadMore;
  final bool fetchError;
  final List<CommitModal> allCommits;

  HomeState({
    @required this.isLoading,
    @required this.allCommits,
    @required this.fetchError,
    @required this.isLoadMore,
  });

  factory HomeState.initial(){
    return new HomeState(
      allCommits: [],
      isLoading: false,
      fetchError: false,
      isLoadMore: false
    );

  }

  HomeState copyWith({
    bool isLoading,
    bool fetchError,
    bool isLoadMore,
    List<CommitModal> allNews,
  }){
    return new HomeState(
        allCommits: allNews ?? this.allCommits,
        isLoading: isLoading ?? false,
        fetchError: fetchError ?? false,
        isLoadMore: isLoadMore ?? false
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is HomeState &&
              runtimeType == other.runtimeType &&
              
              allCommits == other.allCommits &&
              isLoading == other.isLoading &&
              fetchError == other.fetchError &&
              isLoadMore == other.isLoadMore;

  @override
  int get hashCode =>
      allCommits.hashCode ^
      isLoading.hashCode ^
      fetchError.hashCode ^
      isLoadMore.hashCode;
}