import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:menz_cart_app/app/accessories/view/accessories.dart';
import 'package:menz_cart_app/app/categories/view_model/map.dart';
import 'package:menz_cart_app/app/ethic_wear/view/ethic_wear.dart';
import 'package:menz_cart_app/app/innerwear/view/inner_wear_screen.dart';
import 'package:menz_cart_app/app/jeans/view/jeans_screen.dart';
import 'package:menz_cart_app/app/shoes/view/shoes_screen.dart';
import 'package:menz_cart_app/app/sportswear/view/sports_wear.dart';
import 'package:menz_cart_app/app/trousers/view/trousers.dart';
import 'package:menz_cart_app/app/watches/view/watches_screen.dart';
import 'package:menz_cart_app/routes/routes.dart';
import 'package:menz_cart_app/app/shirt/view/shirt_screen.dart';
import 'package:menz_cart_app/app/t_shirt/view/t_shirt_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        FadeInUpBig(
          child: const CategoryCards(
            index: 0,
            screen: ShirtScreen(
              string: 'Shirts',
            ),
          ),
        ),
        FadeInUpBig(
          child: const CategoryCards(
            index: 1,
            screen: TshirtScreen(),
          ),
        ),
        FadeInUpBig(
          child: const CategoryCards(
            index: 2,
            screen: JeansScreen(),
          ),
        ),
        FadeInUpBig(
          child: const CategoryCards(
            index: 3,
            screen: TrousersScreen(),
          ),
        ),
        FadeInUpBig(
          child: const CategoryCards(
            index: 4,
            screen: EthicWearScreen(),
          ),
        ),
        FadeInUpBig(
          child: const CategoryCards(
            index: 5,
            screen: ShoesScreen(),
          ),
        ),
        FadeInUpBig(
          child: const CategoryCards(
            index: 6,
            screen: SportsWearScreen(),
          ),
        ),
        FadeInUpBig(
          child: const CategoryCards(
            index: 7,
            screen: WatchesScreen(),
          ),
        ),
        FadeInUpBig(
          child: const CategoryCards(
            index: 8,
            screen: InnerWearScreen(),
          ),
        ),
        FadeInUpBig(
          child: const CategoryCards(
            index: 9,
            screen: AccessoriesScreen(),
          ),
        ),
      ],
    );
  }
}

class CategoryCards extends StatelessWidget {
  const CategoryCards({Key? key, required this.index, required this.screen})
      : super(key: key);
  final int index;
  final dynamic screen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: GestureDetector(
        onTap: () {
          RoutesProvider.nextScreen(
            screen: screen,
          );
        },
        child: Material(
          borderRadius: BorderRadius.circular(
            8,
          ),
          elevation: 10,
          shadowColor: Colors.black,
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  categoryList[index]['backgroundImg'].toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: ListTile(
                subtitle: Text(
                  categoryList[index]['subTitle'].toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                title: Text(
                  categoryList[index]['categary'].toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(
                      252,
                      78,
                      78,
                      99,
                    ),
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List bgImagesyh = [
  'https://png.pngtree.com/thumb_back/fh260/back_our/20190620/ourmid/pngtree-tmall-t-shirt-festival-taobao-e-commerce-home-poster-banner-image_153340.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTeH_RvF4PvMT_dQQgdI93iS5qWm-qKRcjXCW4OXbgM3ZZyuA_xGYcfGXZLDdYoKW36xw&usqp=CAU',
  'https://media.istockphoto.com/photos/texture-banner-neutral-fabric-background-panoramic-picture-id1313116746?b=1&k=20&m=1313116746&s=170667a&w=0&h=NLosrN0eX2CObND853a2f_CfutrKKEdTQGYjJ2m2ckQ=',
  'https://media.istockphoto.com/vectors/soft-silk-satin-pink-background-vector-illustration-vector-id1159776728?k=20&m=1159776728&s=612x612&w=0&h=MT8b6267MT29shxTRh1gFnzpsXdh1TwqtogTdQxAle0=',
  'https://thumbs.dreamstime.com/b/dark-purple-silk-fabric-as-background-top-view-banner-design-dark-purple-silk-fabric-as-background-top-view-banner-design-233235103.jpg',
  'https://africa-images.com/public/photos/1/z/1zkn0nxHZsA8LEQiUxCNbATWr/1zkn0nxHZsA8LEQiUxCNbATWr_smaller.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsW-cew5qB-s9E5z4Jr4TVbB8nVUgG4T35hm_PPF0udCuJD8wBFcxIDQT62y5CXbnJ1w0&usqp=CAU',
  'https://thumbs.dreamstime.com/b/set-mobile-covid-passport-urban-holiday-accessories-background-232565286.jpg',
];
