import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samples/neumorphic/presentation/home_book_page/pages/home_book_page.dart';

import '../../home_book_page/bloc/sharedbookdetailbloc/shared_book_detail_bloc.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SharedBookDetailBloc, SharedBookDetailState>(
        builder: (context, state) {
          if (state is Shared) {
            return Stack(
              children: [
                CustomAppBar(bookname: state.bookName),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: Text(
                      state.info,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key, @required this.bookname}) : super(key: key);
  final String bookname;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
          ).copyWith(
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  context.read<SharedBookDetailBloc>().add(ResetEvent());
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeBookPage(),
                    ),
                  );
                },
              ),
              Text(
                bookname,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.list,
                    color: Colors.black,
                    size: 40,
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
