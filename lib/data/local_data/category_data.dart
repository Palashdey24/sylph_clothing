import 'package:sylph_clothing/domain/model/generic_category_model.dart';

enum CategoryEnums {
  showAll,
  fullsleeve,
  jacket,
  shirt,
  hoodie,
  joggers,
  tshirt,
  tshirtp,
  maggie,
  plaintshirt,
  polotshirt,
  punjabi,
  sock,
  kurti,
  comfy,
  palazzo,
  sports,
  kid,
  cap,
  wallet,
  belt
}

const Map<CategoryEnums, String> categoryName = {
  CategoryEnums.showAll: "Show All",
  CategoryEnums.fullsleeve: "Full Sleeve T-Shirt",
  CategoryEnums.jacket: "Jacket",
  CategoryEnums.hoodie: "Hoodie",
  CategoryEnums.joggers: "Joggers",
  CategoryEnums.tshirt: "T-Shirt",
  CategoryEnums.tshirtp: "T-Shirt Premium",
  CategoryEnums.maggie: "Maggie",
  CategoryEnums.plaintshirt: "Plain T-Shirt",
  CategoryEnums.polotshirt: "Polo T-Shirt",
  CategoryEnums.punjabi: "Punjabi",
  CategoryEnums.sock: "Sock",
  CategoryEnums.kurti: "Kurti",
  CategoryEnums.comfy: "Comfy Trouser",
  CategoryEnums.palazzo: "Palazzo",
  CategoryEnums.sports: "Sports Edition",
  CategoryEnums.kid: "Kid",
  CategoryEnums.cap: "Cap",
  CategoryEnums.wallet: "Wallet",
  CategoryEnums.belt: "Belt",
  CategoryEnums.shirt: "Shirt",
};

final List<List<String>> favCategory = [
  [
    categoryName[CategoryEnums.tshirt].toString(),
    "https://cdn.pixabay.com/photo/2024/04/17/18/40/ai-generated-8702729_1280.jpg",
    "https://cdn.pixabay.com/photo/2013/07/12/15/53/t-shirt-150527_1280.png"
  ],
  [
    categoryName[CategoryEnums.shirt].toString(),
    "https://cdn.pixabay.com/photo/2015/10/16/13/47/premium-991221_1280.jpg",
    "https://www.pngarts.com/files/1/Formal-Shirts-For-Men-PNG-Free-Download.png"
  ],
  [
    categoryName[CategoryEnums.fullsleeve].toString(),
    "https://images.unsplash.com/photo-1721310062239-2c21104cc797?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://cdn.pixabay.com/photo/2016/11/23/06/57/isolated-t-shirt-1852114_1280.png"
  ],
  [
    categoryName[CategoryEnums.polotshirt].toString(),
    "https://cdn.pixabay.com/photo/2022/08/30/02/26/polo-shirt-7420117_1280.png",
    "https://cdn.pixabay.com/photo/2013/07/13/14/07/apparel-162180_1280.png"
  ],
  [
    categoryName[CategoryEnums.maggie].toString(),
    "https://plus.unsplash.com/premium_photo-1727942421317-382428c9ac44?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dCUyMHNoaXJ0cyUyMGZ1bGwlMjBzbGVldmV8ZW58MHx8MHx8fDA%3D",
    "https://cdn.pixabay.com/photo/2014/04/03/10/21/vest-310156_1280.png"
  ],
  [
    categoryName[CategoryEnums.cap].toString(),
    "https://cdn.pixabay.com/photo/2021/06/18/10/30/cap-6345767_1280.jpg",
    "https://cdn.pixabay.com/photo/2021/02/11/01/35/cap-6003984_1280.png"
  ],
  [
    categoryName[CategoryEnums.plaintshirt].toString(),
    "https://cdn.pixabay.com/photo/2024/04/29/04/21/tshirt-8726721_1280.jpg",
    "https://cdn.pixabay.com/photo/2013/07/12/15/53/t-shirt-150524_1280.png"
  ],
  [
    categoryName[CategoryEnums.kid].toString(),
    "https://cdn.pixabay.com/photo/2023/05/05/18/26/child-7972995_1280.jpg",
    "https://cdn.pixabay.com/photo/2024/01/23/20/45/child-8528228_1280.png"
  ],
];

final List<GenericCategoryModel> genericCategoryData = [
  GenericCategoryModel(genericName: "Winter Collection", category: [
    categoryName[CategoryEnums.showAll].toString(),
    categoryName[CategoryEnums.fullsleeve].toString(),
    categoryName[CategoryEnums.jacket].toString(),
    categoryName[CategoryEnums.hoodie].toString(),
    categoryName[CategoryEnums.joggers].toString(),
  ]),
  GenericCategoryModel(genericName: "Free Delivery", category: [
    categoryName[CategoryEnums.showAll].toString(),
  ]),
  GenericCategoryModel(genericName: "Top Selling", category: [
    categoryName[CategoryEnums.showAll].toString(),
  ]),
  GenericCategoryModel(genericName: "Men", category: [
    categoryName[CategoryEnums.showAll].toString(),
    categoryName[CategoryEnums.tshirt].toString(),
    categoryName[CategoryEnums.tshirtp].toString(),
    categoryName[CategoryEnums.maggie].toString(),
    categoryName[CategoryEnums.joggers].toString(),
    categoryName[CategoryEnums.hoodie].toString(),
    categoryName[CategoryEnums.punjabi].toString(),
    categoryName[CategoryEnums.plaintshirt].toString(),
    categoryName[CategoryEnums.jacket].toString(),
    categoryName[CategoryEnums.sock].toString(),
    categoryName[CategoryEnums.belt].toString(),
    categoryName[CategoryEnums.wallet].toString(),
    categoryName[CategoryEnums.shirt].toString(),
  ]),
  GenericCategoryModel(genericName: "Women", category: [
    categoryName[CategoryEnums.showAll].toString(),
    categoryName[CategoryEnums.kurti].toString(),
    categoryName[CategoryEnums.tshirt].toString(),
    categoryName[CategoryEnums.comfy].toString(),
    categoryName[CategoryEnums.palazzo].toString(),
    categoryName[CategoryEnums.shirt].toString(),
  ]),
  GenericCategoryModel(genericName: "Kids", category: [
    categoryName[CategoryEnums.showAll].toString(),
    categoryName[CategoryEnums.tshirt].toString(),
    categoryName[CategoryEnums.polotshirt].toString(),
    categoryName[CategoryEnums.plaintshirt].toString(),
    categoryName[CategoryEnums.fullsleeve].toString(),
    categoryName[CategoryEnums.punjabi].toString(),
    categoryName[CategoryEnums.jacket].toString(),
    categoryName[CategoryEnums.shirt].toString(),
  ]),
];
