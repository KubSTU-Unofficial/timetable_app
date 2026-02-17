part of 'home_page_bloc.dart';

class HomePageTabData {
	final Stream<List<Lesson>>? lessons;
	final String? error;

  HomePageTabData({this.lessons, this.error});
}
