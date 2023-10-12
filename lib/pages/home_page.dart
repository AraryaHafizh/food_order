
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_order/data/menu_cat.dart';
import 'package:food_order/data/popular_now.dart';
import 'package:food_order/pages/profile_page.dart';
import 'package:food_order/style.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselController _carouselController = CarouselController();
  PageController bannerController = PageController();
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBG,
      appBar: appBarHandler(),
      body: mainPage(),
    );
  }

/////////////////// app bar handler ///////////////////

  appBarHandler() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: defaultBG,
      scrolledUnderElevation: 0.0,
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, right: 20),
            child: InkWell(
                borderRadius: BorderRadius.circular(22),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(name: widget.name)));
                  debugPrint('profile ditekan');
                },
                child: Ink(
                  child: CircleAvatar(
                    child: Text(widget.name[0].toUpperCase(),
                        style: lexend.copyWith(fontSize: 24)),
                  ),
                )),
          ),
        )
      ],
    );
  }

/////////////////// home page handler ///////////////////

  mainPage() {
    return Container(
      margin: const EdgeInsets.only(top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Greeting ----------------------------------
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello ${widget.name}',
                    style: unbounded.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 28)),
                const SizedBox(height: 5),
                Text('Good Food is Waiting!',
                    style: unbounded.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 22)),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // text popular now ----------------------------------
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Popular now',
              style:
                  unbounded.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
          const SizedBox(height: 20),
          // Popular Menu ----------------------------------
          Center(
            child: SizedBox(
              width: 360,
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: popularNow.length,
                options: CarouselOptions(
                  height: 220,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  var items = popularNow[index + 1];
                  return menuPopular(items);
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Dots Indicator ----------------------------------
          Center(
            child: DotsIndicator(
              dotsCount: popularNow.length,
              position: _currentCarouselIndex,
              decorator: DotsDecorator(
                color: Colors.black12,
                activeColor: Colors.amber.shade400,
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // text menu category ----------------------------------
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Menu Category',
              style:
                  unbounded.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),
          // Menu by Category ----------------------------------
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              height: 250,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // childAspectRatio: (100 / 75),
                  crossAxisCount: 2,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: menuCategory.length,
                // physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return menuCat(menuCategory[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

// ------ popular menu handler ------

  Widget menuPopular(data) {
    return Container(
      width: 350,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.amber,
      ),
      child: InkWell(
        onTap: () {
          debugPrint('${data!['product']} ditekan');
        },
        child: Ink(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                data['img'],
              )),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['product'],
                      style: lexend.copyWith(
                          fontSize: 21, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(data['price'],
                      style: lexend.copyWith(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 14,
                      ),
                      Text(
                        data['rating'],
                        style: lexend.copyWith(fontWeight: FontWeight.w100),
                      ),
                      const Spacer(),
                      Text(
                        'Order Now!',
                        style: lexend.copyWith(fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// ------ menu category handler ------

  Widget menuCat(data) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: InkWell(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => menuByCat(data)));
          debugPrint('$data menu dipencet');
        },
        child: Column(
          children: [
            SizedBox(
                height: 70,
                width: 70,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2)
                      ]),
                  child: Center(
                      child: Text(
                    data[0],
                    style: lexend.copyWith(fontSize: 20),
                  )),
                )),
            const SizedBox(height: 5),
            Text(
              data,
              style: lexend.copyWith(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

/////////////////// menu page ///////////////////

  Widget menuByCat(data) {
    return Scaffold(
      backgroundColor: defaultBG,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            backgroundColor: defaultBG,
            expandedHeight: 100, // Tinggi ekspanded app bar
            floating: false, // Tetap muncul saat scroll
            pinned: true, // App bar akan selalu terlihat di atas saat scroll
            flexibleSpace: FlexibleSpaceBar(
              title: Text(data,
                  style: lexend.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22)), // Judul app bar
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined)),
              )
            ],
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (2 / 2.4),
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return menuBox(data);
              },
              childCount: 10,
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.shopping_cart_outlined),
      // ),
    );
  }

  Widget menuBox(data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Text('Food Image')),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Food Name'),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Icon(
                      Icons.star_sharp,
                      size: 17,
                    ),
                    SizedBox(width: 5),
                    Text('Rating'),
                  ],
                ),
                Material(
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Text('Price'),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                        child: Ink(
                          width: 20, // Sesuaikan lebar lingkaran
                          height: 20, // Sesuaikan tinggi lingkaran
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amberAccent.shade200,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
