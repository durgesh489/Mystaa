class ProductModel {
  String image;
  String name;
  int price;
  int quantity;
  int discount;
  int priceAfterDiscount;
  double ratings;

  ProductModel(this.image, this.name, this.price, this.quantity,this.discount,this.priceAfterDiscount,this.ratings);
}

List<ProductModel> favouriteProducts = [
  ProductModel("images/product1.jpg", "Arhar Daal", 500, 1,10,450,3.5),
  ProductModel("images/product2.jpg", "Rice", 400, 3,50,200,4),
  ProductModel("images/product3.jpg", "Wheat", 500, 2,20,400,4.5),
  ProductModel("images/product4.jpg", "Glowner", 300, 1,10,270,4),
];
List<ProductModel> cartProducts = [
  ProductModel("images/product5.jpg", "Arhar Daal", 500, 1,10,450,3.5),
  ProductModel("images/product6.jpg", "Rice", 400, 3,50,200,4),
  ProductModel("images/product3.jpg", "Wheat", 500, 2,20,400,4.5),
  ProductModel("images/product4.jpg", "Glowner", 300, 1,10,270,4),
];
List<ProductModel> notifications = [
  ProductModel("images/product5.jpg", "Arhar Daal", 500, 1,10,450,3.5),
  ProductModel("images/product6.jpg", "Rice", 400, 3,50,200,4),
  ProductModel("images/product3.jpg", "Wheat", 500, 2,20,400,4.5),
  ProductModel("images/product4.jpg", "Glowner", 300, 1,10,270,4),
  ProductModel("images/product1.jpg", "Arhar Daal", 500, 1,10,450,3.5),
  ProductModel("images/product2.jpg", "Rice", 400, 3,50,200,4),
];
List<ProductModel> orders = [
  ProductModel("images/product1.jpg", "Arhar Daal", 500, 1,10,450,3.5),
  ProductModel("images/product2.jpg", "Rice", 400, 3,50,200,4),
  ProductModel("images/product6.jpg", "Rice", 400, 3,50,200,4),
];
