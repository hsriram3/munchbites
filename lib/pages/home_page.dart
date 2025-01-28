import 'package:flutter/material.dart';
import 'package:flutter_app_food/models/food.dart';
import 'package:flutter_app_food/models/restaurant.dart';
import 'package:flutter_app_food/pages/food_page.dart';
import 'package:flutter_app_food/widgets/current_location.dart';
import 'package:flutter_app_food/widgets/description_box.dart';
import 'package:flutter_app_food/widgets/drawerpage.dart';
import 'package:flutter_app_food/widgets/food_tile.dart';
import 'package:flutter_app_food/widgets/sliver_appbar.dart';
import 'package:flutter_app_food/widgets/tabbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  List<Food> __menuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

//get category food
  List<Widget> getFoodInCaregory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = __menuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //for indv food
          final food = categoryMenu[index];

          //return from food_tile
          return myFoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the AppBar from here
      drawer: Drawerpage(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          MySliverAppbar(
            title: mTabbar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // Current location
                const SCurrentLocation(),
                // Description box
                const DDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInCaregory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
