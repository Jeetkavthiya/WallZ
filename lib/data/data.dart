import 'package:Wallz/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001e0592d3afda14371b260fadb698f399c";

List<CategoriesModel> getCategories(){

  List<CategoriesModel> categories = new List();
  CategoriesModel categoriesModel = new CategoriesModel();

  

  categoriesModel.imgUrl = "https://images.unsplash.com/photo-1503308823166-13ce184e3007?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categoriesModel.categoriesName = "Wild Life";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categoriesModel.categoriesName = "Cars";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.unsplash.com/photo-1499781350541-7783f6c6a0c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1115&q=80";
  categoriesModel.categoriesName = "Street Art";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
  categoriesModel.categoriesName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();
  
  categoriesModel.imgUrl = "https://images.unsplash.com/photo-1558981403-c5f9899a28bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  categoriesModel.categoriesName = "Bikes";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.unsplash.com/photo-1468276311594-df7cb65d8df6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categoriesModel.categoriesName = "Sky";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.unsplash.com/photo-1504639725590-34d0984388bd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categoriesModel.categoriesName = "Coding";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgUrl = "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2013&q=80";
  categoriesModel.categoriesName = "City";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  return categories;
}