import 'package:wallpaper_studio/src/models/category_model.dart';

final List<CategoryModel> categories = [
  const CategoryModel(
    name: 'Nature',
    imgPath: 'assets/categories/nature.png',
    description: 'Mountains, Forest and Landscapes',
    amount: 3,
  ),
  const CategoryModel(
    name: 'Abstract',
    imgPath: 'assets/categories/abstract.png',
    description: 'Modern Geomentric and artistic designs',
    amount: 4,
  ),
  const CategoryModel(
    name: 'Urban',
    imgPath: 'assets/categories/urban.png',
    description: 'Cities, architecture and street',
    amount: 6,
  ),
  const CategoryModel(
    name: 'Space',
    imgPath: 'assets/categories/space.png',
    description: 'Cosmos, planets, and galaxies',
    amount: 3,
  ),
  const CategoryModel(
    name: 'Minimalist',
    imgPath: 'assets/categories/minimalist.png',
    description: 'Clean, simple, and elegant',
    amount: 6,
  ),
  const CategoryModel(
    name: 'Animals',
    imgPath: 'assets/categories/animals.png',
    description: 'Wildlife and nature photography',
    amount: 4,
  ),
];

final List<String> subImage = [
  'assets/subcategories/1.png',
  'assets/subcategories/2.png',
  'assets/subcategories/3.png',
  'assets/subcategories/4.png',
  'assets/subcategories/5.png',
  'assets/subcategories/6.png',
];

final List<String> tags = ['Nature', 'Ambience', 'Flowers'];

final List<FavouritesModel> favourites = [];

FavouritesModel mainSelectedWalpper = FavouritesModel(imgPath: "", name: "");
