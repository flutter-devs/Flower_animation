import 'dart:ui';

class HomePageViewModel
{

  // flower list ==
List<Flower> flowerList = [
  Flower(item: "Mimosa" ,quantity: 2,color: Color(0xffF2A510) , name: "Rose",price: 20,photoUrl: "assets/images/basket_1.png",itemUrl: "https://static.wixstatic.com/media/3ccabb_2659b209b0a8409893980a6aff10ca1d~mv2.jpg/v1/fill/w_550,h_365,al_c,q_80,usm_0.66_1.00_0.01/3ccabb_2659b209b0a8409893980a6aff10ca1d~mv2.webp"),
  Flower(  item: "Leaves", quantity: 6, color: Color(0xff76A73B),name: "Carnation",price: 45,photoUrl: "assets/images/basket_2.png",itemUrl: "https://cdn.britannica.com/26/152026-050-41D137DE/Sunshine-leaves-beech-tree.jpg"),
  Flower( item: "Paper",quantity: 7,color:Color(0xffE9E6E6), name: "Tulip",price: 43,photoUrl: "assets/images/basket_3.png",itemUrl: "https://cdn.gardenista.com/wp-content/uploads/2016/05/Corrie_Beth_Hogg_paper_plant_oxalis-1.jpg"),
  Flower(item: "Fern",quantity: 3, color: Color(0xffF2A510) ,name: "Daisy",price: 12,photoUrl: "assets/images/bouquet_1.png",itemUrl: "https://cdnk.nurserylive.com/images/stories/virtuemart/product/nuraerylive-nephrolepis-exaltata-boston-fern-hanging-basket4.jpg"),
  Flower(item: "Berries",quantity: 5, color: Color(0xff76A73B),name: "Sunflower",price: 22,photoUrl: "assets/images/bouquet_2.png",itemUrl: "https://ak.picdn.net/shutterstock/videos/19308550/thumb/1.jpg"),
  Flower(name: "Rose",price: 20,photoUrl: "assets/images/wedding_1.png"),
  Flower(quantity: 5,color: Color(0xffF2A510) ,name: "Carnation",price: 45,photoUrl: "assets/images/wedding_2.png"),
  Flower(quantity: 9,color: Color(0xff76A73B),name: "Tulip",price: 43,photoUrl: "assets/images/flower_1.png"),
  Flower(quantity: 8,color:Color(0xffE9E6E6),name: "Daisy",price: 12,photoUrl: "assets/images/basket_1.png"),
];


List<Flower> WeddingList = [

  Flower(  item: "Leaves", quantity: 6, color: Color(0xff76A73B),name: "Carnation",price: 45,photoUrl: "assets/images/wedding_1.png",itemUrl: "https://cdn.britannica.com/26/152026-050-41D137DE/Sunshine-leaves-beech-tree.jpg"),
  Flower(item: "Mimosa" ,quantity: 2,color: Color(0xffF2A510) , name: "Rose",price: 20,photoUrl: "assets/images/wedding_2.png",itemUrl: "https://static.wixstatic.com/media/3ccabb_2659b209b0a8409893980a6aff10ca1d~mv2.jpg/v1/fill/w_550,h_365,al_c,q_80,usm_0.66_1.00_0.01/3ccabb_2659b209b0a8409893980a6aff10ca1d~mv2.webp"),
  Flower( item: "Paper",quantity: 7,color:Color(0xffE9E6E6), name: "Tulip",price: 43,photoUrl: "assets/images/basket_1.png",itemUrl: "https://cdn.gardenista.com/wp-content/uploads/2016/05/Corrie_Beth_Hogg_paper_plant_oxalis-1.jpg"),
  Flower(item: "Fern",quantity: 3, color: Color(0xffF2A510) ,name: "Daisy",price: 12,photoUrl: "assets/images/basket_2.png",itemUrl: "https://cdnk.nurserylive.com/images/stories/virtuemart/product/nuraerylive-nephrolepis-exaltata-boston-fern-hanging-basket4.jpg"),
  Flower(item: "Berries",quantity: 5, color: Color(0xff76A73B),name: "Sunflower",price: 22,photoUrl: "assets/images/basket_3.png",itemUrl: "https://ak.picdn.net/shutterstock/videos/19308550/thumb/1.jpg"),
  Flower(name: "Rose",price: 20,photoUrl: "assets/images/bouquet_1.png"),

  Flower(quantity: 5,color: Color(0xffF2A510) ,name: "Carnation",price: 45,photoUrl: "assets/images/wedding_2.png"),
  Flower(quantity: 9,color: Color(0xff76A73B),name: "Tulip",price: 43,photoUrl: "assets/images/flower_1.png"),

];
List<Flower> RoseList = [
  Flower( item: "Paper",quantity: 7,color:Color(0xffE9E6E6), name: "Rose",price: 43,photoUrl: "assets/images/flower_1.png",itemUrl: "https://cdn.gardenista.com/wp-content/uploads/2016/05/Corrie_Beth_Hogg_paper_plant_oxalis-1.jpg"),
  Flower(item: "Mimosa" ,quantity: 2,color: Color(0xffF2A510) , name: "Tulip",price: 20,photoUrl: "assets/images/flower_2.png",itemUrl: "https://static.wixstatic.com/media/3ccabb_2659b209b0a8409893980a6aff10ca1d~mv2.jpg/v1/fill/w_550,h_365,al_c,q_80,usm_0.66_1.00_0.01/3ccabb_2659b209b0a8409893980a6aff10ca1d~mv2.webp"),
  Flower(  item: "Leaves", quantity: 6, color: Color(0xff76A73B),name: "Carnation",price: 45,photoUrl: "assets/images/wedding_2.png",itemUrl: "https://cdn.britannica.com/26/152026-050-41D137DE/Sunshine-leaves-beech-tree.jpg"),
  Flower(item: "Fern",quantity: 3, color: Color(0xffF2A510) ,name: "Daisy",price: 12,photoUrl: "assets/images/basket_1.png",itemUrl: "https://cdnk.nurserylive.com/images/stories/virtuemart/product/nuraerylive-nephrolepis-exaltata-boston-fern-hanging-basket4.jpg"),
  Flower(item: "Berries",quantity: 5, color: Color(0xff76A73B),name: "Sunflower",price: 22,photoUrl: "assets/images/basket_2.png",itemUrl: "https://ak.picdn.net/shutterstock/videos/19308550/thumb/1.jpg"),
  Flower(name: "Rose",price: 20,photoUrl: "assets/images/bouquet_1.png"),
  Flower(quantity: 5,color: Color(0xffF2A510) ,name: "Carnation",price: 45,photoUrl: "assets/images/flower_1.png"),
  Flower(quantity: 9,color: Color(0xff76A73B),name: "Tulip",price: 43,photoUrl: "assets/images/wedding_1.png"),
];List<Flower> BouquetList = [
  Flower(item: "Mimosa" ,quantity: 2,color: Color(0xffF2A510) , name: "Rose",price: 20,photoUrl: "assets/images/bouquet_1.png",itemUrl: "https://static.wixstatic.com/media/3ccabb_2659b209b0a8409893980a6aff10ca1d~mv2.jpg/v1/fill/w_550,h_365,al_c,q_80,usm_0.66_1.00_0.01/3ccabb_2659b209b0a8409893980a6aff10ca1d~mv2.webp"),
  Flower(  item: "Leaves", quantity: 6, color: Color(0xff76A73B),name: "Carnation",price: 45,photoUrl: "assets/images/bouquet_2.png",itemUrl: "https://cdn.britannica.com/26/152026-050-41D137DE/Sunshine-leaves-beech-tree.jpg"),
  Flower( item: "Paper",quantity: 7,color:Color(0xffE9E6E6), name: "Tulip",price: 43,photoUrl: "assets/images/basket_1.png",itemUrl: "https://cdn.gardenista.com/wp-content/uploads/2016/05/Corrie_Beth_Hogg_paper_plant_oxalis-1.jpg"),
  Flower(item: "Fern",quantity: 3, color: Color(0xffF2A510) ,name: "Daisy",price: 12,photoUrl: "assets/images/basket_2.png",itemUrl: "https://cdnk.nurserylive.com/images/stories/virtuemart/product/nuraerylive-nephrolepis-exaltata-boston-fern-hanging-basket4.jpg"),
  Flower(item: "Berries",quantity: 5, color: Color(0xff76A73B),name: "Sunflower",price: 22,photoUrl: "assets/images/wedding_2.png",itemUrl: "https://ak.picdn.net/shutterstock/videos/19308550/thumb/1.jpg"),
  Flower(name: "Rose",price: 20,photoUrl: "assets/images/flower_1.png"),
  Flower(quantity: 5,color: Color(0xffF2A510) ,name: "Carnation",price: 45,photoUrl: "assets/images/basket_1.png"),
  Flower(quantity: 9,color: Color(0xff76A73B),name: "Tulip",price: 43,photoUrl: "assets/images/basket_2.png"),
  Flower(quantity: 8,color:Color(0xffE9E6E6),name: "Daisy",price: 12,photoUrl: "assets/images/wedding_2.png"),
];
}

class Flower
{
  String photoUrl;
  int price;
  String name;
  var color;
int quantity;
String item;
String itemUrl;

  Flower({this.photoUrl, this.price, this.name, this.color, this.quantity,
    this.item, this.itemUrl});


}