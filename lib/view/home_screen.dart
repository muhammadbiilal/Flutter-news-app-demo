import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app_demo/models/news_channel_headlines_model.dart';
import 'package:news_app_demo/view/categories_screen.dart';
import 'package:news_app_demo/view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum FilterList {
  bbcNews,
  aryNews,
  cryptoCoinsNews,
  cnn,
  alJazeeraEnglish,
  australianFinancialReview,
  espn
}

class _HomeScreenState extends State<HomeScreen> {
  NewsViewModel newsViewModel = NewsViewModel();

  FilterList? selectedMenu;

  final format = DateFormat('MMMM dd, yyyy');

  String name = 'bbc-news';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CategoriesScreen()));
            },
            icon:
                Image.asset('images/category_icon.png', height: 30, width: 30)),
        centerTitle: true,
        title: Text(
          'News',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        actions: [
          PopupMenuButton<FilterList>(
            initialValue: selectedMenu,
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (FilterList item) {
              if (FilterList.bbcNews.name == item.name) {
                setState(() {
                  name = 'bbc-news';
                  // name = item.name;
                  selectedMenu = item;
                  // newsViewModel.resetNewsChannelHeadlines();
                });
              } else if (FilterList.aryNews.name == item.name) {
                setState(() {
                  name = 'ary-news';
                  // name = item.name;
                  selectedMenu = item;
                  // newsViewModel.resetNewsChannelHeadlines();
                });
              } else if (FilterList.alJazeeraEnglish.name == item.name) {
                setState(() {
                  name = 'al-jazeera-english';
                  // name = item.name;
                  selectedMenu = item;
                  // newsViewModel.resetNewsChannelHeadlines();
                });
              } else if (FilterList.australianFinancialReview.name ==
                  item.name) {
                setState(() {
                  name = 'australian-financial-review';
                  // name = item.name;
                  selectedMenu = item;
                  // newsViewModel.resetNewsChannelHeadlines();
                });
              } else if (FilterList.cnn.name == item.name) {
                setState(() {
                  name = 'cnn';
                  // name = item.name;
                  selectedMenu = item;
                  // newsViewModel.resetNewsChannelHeadlines();
                });
              } else if (FilterList.cryptoCoinsNews.name == item.name) {
                setState(() {
                  name = 'crypto-coins-news';
                  // name = item.name;
                  selectedMenu = item;
                  // newsViewModel.resetNewsChannelHeadlines();
                });
              } else if (FilterList.espn.name == item.name) {
                setState(() {
                  name = 'espn';
                  // name = item.name;
                  selectedMenu = item;
                  // newsViewModel.resetNewsChannelHeadlines();
                });
              }

              // newsViewModel.fetchNewsChannelHeadlinesApi(name);
            },
            itemBuilder: (context) => <PopupMenuEntry<FilterList>>[
              const PopupMenuItem(
                value: FilterList.bbcNews,
                child: Text('BBC News'),
              ),
              const PopupMenuItem(
                value: FilterList.aryNews,
                child: Text('ARY News'),
              ),
              const PopupMenuItem(
                value: FilterList.australianFinancialReview,
                child: Text("Australian Financial Review"),
              ),
              const PopupMenuItem(
                value: FilterList.cryptoCoinsNews,
                child: Text("Crypto Coins News"),
              ),
              const PopupMenuItem(
                value: FilterList.cnn,
                child: Text("CNN"),
              ),
              const PopupMenuItem(
                value: FilterList.alJazeeraEnglish,
                child: Text("Al Jazeera English"),
              ),
              const PopupMenuItem(
                value: FilterList.espn,
                child: Text("ESPN"),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.55,
            width: width,
            child: FutureBuilder<NewsChannelHeadlinesModel>(
              future: newsViewModel.fetchNewsChannelHeadlinesApi(name),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: SpinKitCircle(size: 50, color: Colors.blue));
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        DateTime dateTime = DateTime.parse(snapshot
                            .data!.articles![index].publishedAt
                            .toString());
                        return SizedBox(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: height * 0.6,
                                width: width * 0.9,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data!.articles![index].urlToImage
                                        .toString(),
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        Container(child: spinKit2),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error_outline,
                                            color: Colors.red),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                child: Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      height: height * 0.22,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: width * 0.7,
                                            child: Text(
                                              snapshot
                                                  .data!.articles![index].title
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: width * 0.7,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data!
                                                      .articles![index]
                                                      .source!
                                                      .name!
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  format.format(dateTime),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

const spinKit2 = SpinKitFadingCircle(
  color: Colors.amber,
  size: 50,
);
