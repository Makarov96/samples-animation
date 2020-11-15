import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../data/datasources/local_data_books.dart';
import '../../../widgets/transition/fadein_transition.dart';
import '../bloc/audiobook_bloc/audiobook_bloc.dart';
import '../bloc/current_index_pageview.dart';
import '../bloc/shared_book_color_bloc.dart';
import '../bloc/sharedbookdetailbloc/shared_book_detail_bloc.dart';
import '../../book_details_page/pages/book_detail_page.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndexPageView = Provider.of<CurrentIndexPageView>(context);
    final sharedbookcolorbloc = Provider.of<SharedBookColorBloc>(context);
    var pageController = new PageController(
      initialPage: 1,
      viewportFraction: 0.65,
    );
    return PageView.builder(
      controller: pageController,
      itemCount: books.length,
      onPageChanged: (index) {
        currentIndexPageView.handleCurrentIndexPageView(index);
        sharedbookcolorbloc.changeColor(books[index].color);
        context.read<AudiobookBloc>().add(ResetAudioEvent());
      },
      itemBuilder: (_, i) {
        final book = books[i];
        return Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 150,
                  horizontal: 0,
                ).copyWith(
                  top: MediaQuery.of(context).size.height * 0.5,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 235,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          currentIndexPageView.currentidex == i
                              ? book.bookname
                              : '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      BlocBuilder<AudiobookBloc, AudiobookState>(
                        builder: (context, state) {
                          if (state is Start) {
                            return currentIndexPageView.currentidex == i
                                ? GestureDetector(
                                    onTap: () {
                                      context
                                          .read<AudiobookBloc>()
                                          .add(StopEvent());
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      height: 70,
                                      width: 70,
                                      child: Center(
                                        child: Icon(
                                          Icons.play_arrow,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 3.0,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          } else if (state is Stop) {
                            return GestureDetector(
                              onTap: () {
                                context.read<AudiobookBloc>().add(StartEvent());
                              },
                              child: currentIndexPageView.currentidex == i
                                  ? Container(
                                      margin: EdgeInsets.only(
                                        top: 20,
                                      ),
                                      height: 70,
                                      width: 70,
                                      child: Center(
                                        child: Icon(
                                          Icons.pause,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 3.0,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            );
                          } else {
                            return Container();
                          }
                        },
                      )
                    ],
                  ),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: currentIndexPageView.currentidex == i
                      ? Color(0xFFFAFAFA)
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      200.0,
                    ),
                    bottomLeft: Radius.circular(
                      200.0,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: currentIndexPageView.currentidex == i
                          ? Colors.black.withOpacity(
                              0.2,
                            )
                          : Colors.transparent,
                      offset: Offset(
                        0,
                        30.0,
                      ),
                      blurRadius: 30.0,
                      spreadRadius: 1.0,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 130,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.read<SharedBookDetailBloc>().add(
                          SharedDataEvent(
                            info: book.bookDetail,
                            bookName: book.bookname,
                          ),
                        );
                    Navigator.pushReplacement(
                      context,
                      fadeInTransition(
                        context,
                        BookDetailPage(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 20.0,
                    child: Container(
                      width: currentIndexPageView.currentidex == i ? 300 : 200,
                      height: currentIndexPageView.currentidex == i ? 500 : 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            book.bookPath,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
