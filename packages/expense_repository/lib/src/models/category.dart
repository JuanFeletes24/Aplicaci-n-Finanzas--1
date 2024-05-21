import '../entities/entities.dart';

class Category{
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  String color;
  
  Category({
    required   this.categoryId,
    required   this.name,
    required   this.totalExpenses,
    required   this.icon,
    required   this.color,

  
  
  });
//estado inicial
static final empty = Category(
  categoryId: '',
  name: '',
  totalExpenses:0,
  icon: '',
  color: ''
);
//se envia a firebase
  CategoryEntity toEntity(){
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      color: color,
    );
  }

  //transforma la información para usarla en la app
  static  Category fromEntity (CategoryEntity entity){
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
      icon: entity.icon,
      color: entity.color,
    );
  }


}
