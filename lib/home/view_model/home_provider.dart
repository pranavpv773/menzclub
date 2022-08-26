import 'package:flutter/widgets.dart';

class HomeProvider with ChangeNotifier {
  int currentIndex = 0;
  final List banners = [
    'https://cdn0.desidime.com/cdn-cgi/image/fit=contain,f=auto,onerror=redirect,w=1200,h=628,q=90/topics/photos/1400305/original/Top-10-Branded-Shirts-For-Men--1200x1200.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/MA2021/Store/PC/SBC/Denim-shirts.jpg',
    'https://m.media-amazon.com/images/S/abs-image-upload-na/5/AmazonStores/A21TJRUUN4KGV/9265039dedff42e1d2a00905072ec727.w623.h542._CR41%2C0%2C542%2C542_SX1500_.jpg',
    'https://sslimages.shoppersstop.com/sys-master/root/ha0/hc6/27683032203294/watches_carousel-msite----new-banner-main-craousel--20220606-hp-paeg.jpg',
    'https://printdaddy.in/wp-content/uploads/2021/09/Printed-Tshirt-Banner-1.jpg'
  ];

  indexCheck(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
