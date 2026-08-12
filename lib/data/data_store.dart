
import 'package:project3_5/model/product_model.dart';

class DataStore {
  final List<ProductModel> products = [
    ProductModel(
      code: 1001,
      name: "Classic Black T-Shirt",
      category: "T-Shirt",
      oldprice: 15.0,
      discount: 10,
      image:
          "https://i.pinimg.com/736x/f8/56/43/f85643e88e9c03369675c10e0cb051af.jpg",
      quantity: 1,
      rate: "4.5",
      view: "1.2K",
      size: ["S", "M", "L", "XL"],
      color: ["Black", "White", "Gray"],
      description:
          "A classic black T-shirt designed for everyday comfort and effortless style. "
          "Made from soft and breathable cotton fabric, this shirt provides a comfortable "
          "fit throughout the day. Its simple design makes it easy to combine with jeans, "
          "shorts, joggers, or casual trousers. The durable stitching and high-quality "
          "fabric help maintain its shape and color even after multiple washes. Perfect "
          "for casual outings, school, work, travel, or relaxing at home.",
    ),
    ProductModel(
      code: 1002,
      name: "Oversized White T-Shirt",
      category: "T-Shirt",
      oldprice: 20.0,
      discount: 15,
      image:
          "https://i.pinimg.com/736x/ac/f9/63/acf963563fcbdd68b831ee158df00eaa.jpg",
      quantity: 1,
      rate: "4.7",
      view: "2.1K",
      size: ["M", "L", "XL", "XXL"],
      color: ["White", "Black", "Red"],
      description:
          "A modern oversized white T-shirt created for a relaxed and fashionable look. "
          "The loose-fitting design provides excellent freedom of movement while keeping "
          "you comfortable during daily activities. Made with soft cotton material, it "
          "feels smooth and lightweight against the skin. The clean white color makes "
          "this T-shirt easy to match with jeans, cargo pants, shorts, or sneakers. "
          "Whether you are going out with friends, shopping, traveling, or enjoying a "
          "casual day, this oversized T-shirt is a versatile addition to your wardrobe.",
    ),

    ProductModel(
      code: 1003,
      name: "Classic Gray Hoodie",
      category: "Hoodie",
      oldprice: 35.0,
      discount: 20,
      image:
          "https://i.pinimg.com/1200x/6a/70/57/6a70573f0d935a1d658eaf88580de838.jpg",
      quantity: 1,
      rate: "4.8",
      view: "3.4K",
      size: ["S", "M", "L", "XL"],
      color: ["Gray", "Black", "Red"],
      description:
          "A comfortable gray hoodie designed to provide warmth, softness, and modern "
          "streetwear style. The hoodie is made from soft fleece fabric that helps keep "
          "you warm during cool mornings and evenings. It features a relaxed fit, a "
          "spacious front pocket for carrying small essentials, and an adjustable hood "
          "for additional protection from cold weather. The neutral gray color makes it "
          "easy to pair with jeans, joggers, cargo pants, and sneakers. It is suitable "
          "for casual outings, travel, outdoor activities, and everyday wear.",
    ),

    ProductModel(
      code: 1004,
      name: "Slim Fit Blue Jeans",
      category: "Jeans",
      oldprice: 40.0,
      discount: 12,
      image:
          "https://i.pinimg.com/736x/7e/30/1d/7e301db2a7a4c50f8f85bbb66f985eb8.jpg",
      quantity: 1,
      rate: "4.6",
      view: "1.8K",
      size: ["28", "30", "32", "34", "36"],
      color: ["Blue", "White", "Black"],
      description:
          "Stylish slim-fit blue jeans designed to provide a modern appearance while "
          "maintaining everyday comfort. The jeans are made from durable denim with a "
          "slight amount of stretch, allowing you to move comfortably throughout the day. "
          "The slim-fit design creates a clean and fashionable silhouette without feeling "
          "too tight. Featuring classic five-pocket styling, a secure button closure, and "
          "high-quality stitching, these jeans are suitable for everyday casual outfits. "
          "They can easily be paired with T-shirts, shirts, hoodies, jackets, and sneakers.",
    ),

    ProductModel(
      code: 1005,
      name: "Brown Casual Jacket",
      category: "Jacket",
      oldprice: 60.0,
      discount: 25,
      image:
          "https://i.pinimg.com/1200x/55/98/9a/55989ab1b6f0358e74706976008ab302.jpg",
      quantity: 1,
      rate: "4.9",
      view: "4.5K",
      size: ["M", "L", "XL", "XXL"],
      color: ["Brown", "Black", "Red"],
      description:
          "A stylish brown casual jacket designed to add a fashionable layer to your "
          "everyday outfit. The jacket features a classic design that works well with "
          "both casual and smart-casual clothing. Its comfortable material provides "
          "light protection against cool weather while remaining easy to wear throughout "
          "the day. The brown color gives the jacket a timeless and versatile appearance "
          "that can be matched with jeans, chinos, T-shirts, sweaters, or casual shirts. "
          "Ideal for travel, outdoor activities, weekend outings, and evening occasions.",
    ),

    ProductModel(
      code: 1006,
      name: "Blue Long Sleeve Shirt",
      category: "Shirt",
      oldprice: 28.0,
      discount: 10,
      image:
          "https://i.pinimg.com/1200x/a2/83/0a/a2830a67dd8ce856a13a58ea5a9fe2fd.jpg",
      quantity: 1,
      rate: "4.4",
      view: "980",
      size: ["S", "M", "L", "XL"],
      color: ["Blue", "White", "Black"],
      description:
          "An elegant blue long-sleeve shirt that combines classic style with everyday "
          "comfort. Made from lightweight and breathable fabric, this shirt is comfortable "
          "for long hours of wear and suitable for different occasions. The clean design "
          "features a traditional button closure, long sleeves, and a neat collar that "
          "creates a polished appearance. It can be worn with formal trousers for work "
          "or combined with jeans and sneakers for a more relaxed look. A versatile choice "
          "for office days, meetings, dinners, special occasions, and casual events.",
    ),

    ProductModel(
      code: 1007,
      name: "Khaki Casual Shorts",
      category: "Shorts",
      oldprice: 22.0,
      discount: 15,
      image:
          "https://i.pinimg.com/1200x/14/fc/35/14fc35fa8530cbe1091b4ae1f6185f21.jpg",
      quantity: 1,
      rate: "4.3",
      view: "870",
      size: ["28", "30", "32", "34", "36"],
      color: ["Blue", "Black", "Red"],
      description:
          "Comfortable khaki casual shorts designed for warm weather and active everyday "
          "wear. The lightweight fabric provides a comfortable feeling while allowing "
          "good airflow during hot days. The classic khaki color creates a clean and "
          "versatile appearance that can easily be combined with T-shirts, polo shirts, "
          "shirts, and casual sneakers. The shorts feature practical pockets for storing "
          "small personal items such as keys, cards, or a smartphone. Perfect for holidays, "
          "travel, outdoor activities, shopping, beach trips, and relaxed weekends.",
    ),

    ProductModel(
      code: 1008,
      name: "Pink Casual Dress",
      category: "Dress",
      oldprice: 45.0,
      discount: 20,
      image:
          "https://i.pinimg.com/736x/de/c3/13/dec3132591d1ad6c9eed0e898b3a04b2.jpg",
      quantity: 1,
      rate: "4.8",
      view: "3.2K",
      size: ["S", "M", "L", "XL"],
      color: ["Pink", "White", "Black", "Red"],
      description:
          "A beautiful pink casual dress designed for women who prefer a simple yet "
          "elegant fashion style. The lightweight and comfortable fabric provides a "
          "pleasant feeling throughout the day while allowing natural movement. Its "
          "feminine design creates a stylish silhouette without being overly formal, "
          "making it suitable for many different occasions. The soft pink color gives "
          "the dress a fresh and elegant appearance that can be paired with sandals, "
          "heels, or sneakers. Perfect for casual outings, dates, shopping, vacations, "
          "parties, and weekend activities.",
    ),

    ProductModel(
      code: 1009,
      name: "Cream Knit Sweater",
      category: "Sweater",
      oldprice: 38.0,
      discount: 18,
      image:
          "https://i.pinimg.com/736x/07/31/65/073165d24a6f8a1f182d0e77fcf271ac.jpg",
      quantity: 1,
      rate: "4.6",
      view: "1.5K",
      size: ["M", "L", "XL"],
      color: ["Pink", "Brown", "Black", "Gray"],
      description:
          "A warm and comfortable cream-colored knitted sweater designed for cool "
          "weather and stylish everyday outfits. The soft knitted material provides "
          "warmth while remaining comfortable enough for extended wear. Its simple "
          "design and neutral cream color make it an excellent layering piece that can "
          "be worn over shirts or T-shirts. The sweater pairs naturally with jeans, "
          "trousers, skirts, and casual shoes, making it suitable for different styles. "
          "Ideal for cool mornings, evening walks, travel, coffee dates, casual gatherings, "
          "and everyday winter or autumn outfits.",
    ),

    ProductModel(
      code: 1010,
      name: "Navy Blue Polo Shirt",
      category: "Polo",
      oldprice: 25.0,
      discount: 10,
      image:
          "https://i.pinimg.com/1200x/b2/ea/32/b2ea32a578b0801b44d450a2d749dec7.jpg",
      quantity: 1,
      rate: "4.7",
      view: "2.7K",
      size: ["S", "M", "L", "XL", "XXL"],
      color: ["Blue", "White", "Black", "Gray"],
      description:
          "A premium navy blue polo shirt designed to provide a smart and comfortable "
          "appearance for both casual and semi-formal occasions. Made from soft and "
          "breathable fabric, this polo shirt provides comfort during long hours of wear. "
          "The classic collar and button placket create a clean and polished look, while "
          "the simple navy blue color makes it easy to match with jeans, chinos, shorts, "
          "or trousers. Its versatile design makes it suitable for work, casual meetings, "
          "weekend outings, travel, dinners, and everyday wear. A practical wardrobe "
          "essential for anyone who prefers a clean and timeless fashion style.",
    ),
  ];
}
