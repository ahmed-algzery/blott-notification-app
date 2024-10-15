import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstask/features/news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:newstask/features/news/presentation/widgets/article_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  String _fullName = 'Hey'; // Default text for app bar

  @override
  void initState() {
    super.initState();
    _loadName(); // Load name from SharedPreferences
  }

  Future<void> _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstName = prefs.getString('first_name') ?? '';
    String lastName = prefs.getString('last_name') ?? '';

    setState(() {
      _fullName = 'Hey $firstName $lastName'; // Update with full name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          _fullName, // Display the name from SharedPreferences
          style: const TextStyle(
              fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        backgroundColor: const Color(0xff05021B),
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          if (state.isLoading) {
            return _buildLoading();
          }
          if (state.error != null) {
            return _buildErrorView(
                state.error?.message ?? 'حدث خطأ حاول مجداً !!');
          }
          if (state.articles.isEmpty) {
            return _buildNoData();
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.articles.length,
            itemBuilder: (context, index) =>
                ArticleTile(article: state.articles[index]),
          );
        },
      ),
    );
  }

  Widget _buildErrorView(String msg) {
    return Center(child: Text(msg));
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildNoData() {
    return const Center(
      child: Text('لا يوجد أخبار'),
    );
  }
}
