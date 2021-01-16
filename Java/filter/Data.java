//package filter;
//
//import beans.Product;
//
//import java.util.HashMap;
//import java.util.Map;
//
//public class Data {
//    public static Map<String, Product> dataBP = new HashMap<>();
//    public static Map<String, Product> dataHB = new HashMap<>();
//    public static Map<String, Product> dataCB = new HashMap<>();
//
//    static {
//
//        dataBP.put("01", new Product("01", "AmazonBasics Laptop Computer Backpack - Fits Up To 17 Inch Laptops", "https://m.media-amazon.com/images/I/91HkBT96VML._AC_UL320_.jpg", 2999.00, 0));
//
//        dataHB.put("1HB", new Product("1HB", "Kenneth Cole Reaction Chelsea Women's Chevron Quilted 15-Inch Laptop & Tablet Fashion Travel Backpack", "https://m.media-amazon.com/images/I/91kv5-h0T+L._AC_UL320_.jpg", 52.20, 0));
//        dataHB.put("2HB", new Product("2HB", "PUMA Men's Evercat Contender 3.0 Backpack, deep black, One Size", "https://m.media-amazon.com/images/I/A1XeHgskVPL._AC_UL320_.jpg", 14.97, 0));
//        dataHB.put("3HB", new Product("3HB", "The North Face Vault Backpack, TNF Black, One Size", "https://m.media-amazon.com/images/I/91lgw9JSZfL._AC_UL320_.jpg", 58.95, 0));
//        dataHB.put("4HB", new Product("4HB", "Herschel Classic Backpack, Black, 24.0L", "https://m.media-amazon.com/images/I/91DwzkIT4GL._AC_UL320_.jpg", 41.70, 0));
//        dataHB.put("5HB", new Product("5HB", "Herschel Retreat Backpack, Black/Night Camo, Classic 19.5L", "https://m.media-amazon.com/images/I/81NpnhlNFtL._AC_UL320_.jpg", 44.99, 0));
//        dataHB.put("6HB", new Product("6HB", "Herschel Little America Laptop Backpack, Windsor Wine/Tan Synthetic Leather, Classic 25.0L", "https://m.media-amazon.com/images/I/814Exr0kUkL._AC_UL320_.jpg", 82.40, 0));
//        dataHB.put("7HB", new Product("7HB", "The North Face Recon Backpack", "https://m.media-amazon.com/images/I/81Yq00N0a2L._AC_UL320_.jpg", 98.95, 0));
//        dataHB.put("8HB", new Product("8HB", "The North Face Women's Jester Backpack", "https://m.media-amazon.com/images/I/918s+Tu38VL._AC_UL320_.jpg", 68.95, 0));
//        dataHB.put("9HB", new Product("9HB", "Herschel Nova Backpack, Ash Rose, Mini 9L", "https://m.media-amazon.com/images/I/91LHg-aQKtL._AC_UL320_.jpg", 46.30, 0));
//        dataHB.put("10HB", new Product("10HB", "Rockland Double Handle Rolling Backpack, Black, 17-Inch", "https://m.media-amazon.com/images/I/71fVZaF0UsL._AC_UL320_.jpg", 35.32, 0));
//        dataHB.put("11HB", new Product("11HB", "Samsonite Xenon 3.0 Checkpoint Friendly Backpack", "https://m.media-amazon.com/images/I/A1Ych28ajrL._AC_UL320_.jpg", 38.59, 0));
//        dataHB.put("12HB", new Product("12HB", "Samsonite Tectonic Lifestyle Easy Rider Business Backpack, Steel Grey, One Size", "https://m.media-amazon.com/images/I/91pql3ZiYfL._AC_UL320_.jpg", 43.30, 0));
//        dataHB.put("13HB", new Product("13HB", "OuterEQ Packable Travel Outdoor Backpacks Foldable Daypacks for Camping & Hiking", "https://m.media-amazon.com/images/I/81SmM+ESBTL._AC_UL320_.jpg", 19.99, 0));
//        dataHB.put("14HB", new Product("14HB", "Briggs & Riley @ Work-Cargo Backpack, Grey, Large", "https://m.media-amazon.com/images/I/A1Opu4X2eXL._AC_UL320_.jpg", 299.00, 0));
//        dataHB.put("15HB", new Product("15HB", "Briggs & Riley Rhapsody Essential Backpack", "https://m.media-amazon.com/images/I/91mtKSm8RRL._AC_UL320_.jpg", 169.00, 0));
//        dataHB.put("16HB", new Product("16HB", "Samsonite Classic Leather Slim Backpack", "https://m.media-amazon.com/images/I/91NCmEL+5AL._AC_UL320_.jpg", 99.88, 0));
//        dataHB.put("17HB", new Product("17HB", "PUMA Kids' Lunch Box Backpack Combo", "https://m.media-amazon.com/images/I/A12jbKu5oaL._AC_UL320_.jpg", 25.37, 0));
//        dataHB.put("18HB", new Product("18HB", "Vera Bradley Women's Signature Cotton Campus Backpack, Moonlight Garden, One Size", "https://m.media-amazon.com/images/I/911M6XSnF4L._AC_UL320_.jpg", 75.59, 0));
//        dataHB.put("19HB", new Product("19HB", "The North Face Women's Borealis Backpack", "https://m.media-amazon.com/images/I/919F2xhHx3L._AC_UL320_.jpg", 88.95, 0));
//        dataHB.put("20HB", new Product("20HB", "Nike Elite Pro Basketball Backpack BA6164 One Size", "https://m.media-amazon.com/images/I/71WT4s7GqHL._AC_UL320_.jpg", 70.00, 0));
//        dataHB.put("21HB", new Product("21HB", "Herschel Heritage Backpack, Black/Saddle Brown, Classic 21.5L", "https://m.media-amazon.com/images/I/81v5yLXH9GL._AC_UL320_.jpg", 56.00, 0));
//        dataHB.put("22HB", new Product("22HB", "Kate Spade New York Karissa Medium Backpack Nylon", "https://m.media-amazon.com/images/I/91zFD1+u6vL._AC_UL320_.jpg", 129.97, 0));
//        dataHB.put("23HB", new Product("23HB", "Samsonite Classic Leather Backpack", "https://m.media-amazon.com/images/I/81cFoSASRmL._AC_UL320_.jpg", 118.22, 0));
//        dataHB.put("24HB", new Product("24HB", "The North Face Recon Laptop Backpack", "https://m.media-amazon.com/images/I/91xqN-oDFDL._AC_UL320_.jpg", 234.52, 0));
//        dataHB.put("25HB", new Product("25HB", "Samsonite Tectonic Lifestyle Sweetwater Business Backpack, Black, One Size", "https://m.media-amazon.com/images/I/916cGsLI3YL._AC_UL320_.jpg", 77.00, 0));
//        dataHB.put("26HB", new Product("26HB", "Champion Life Stealth Sling Backpack", "https://m.media-amazon.com/images/I/916DfwEZwoL._AC_UL320_.jpg", 45.00, 0));
//        dataHB.put("27HB", new Product("27HB", "Champion Men's Manuscript Backpack, heather grey, One size", "https://m.media-amazon.com/images/I/A1V17niVbbL._AC_UL320_.jpg", 35.67, 0));
//        dataHB.put("28HB", new Product("28HB", "Vintage Waterproof Waxed Canvas Convertible Laptop Messenger Backpack Men Women", "https://m.media-amazon.com/images/I/81c0eDbQe3L._AC_UL320_.jpg", 112.99, 0));
//        dataHB.put("29HB", new Product("29HB", "BRASS TACKS Leathercraft Men's Waxed Canvas Backpack Casual 15.6 laptop Bookbag", "https://m.media-amazon.com/images/I/8198ywcl8YL._AC_UL320_.jpg", 109.00, 0));
//        dataHB.put("30HB", new Product("30HB", "Gootium 21101 Specially High Density Thick Canvas Backpack Rucksack", "https://m.media-amazon.com/images/I/81UOIlWGECL._AC_UL320_.jpg", 45.99, 0));
//        dataHB.put("31HB", new Product("31HB", "Champion Men's Top Load Backpack", "https://m.media-amazon.com/images/I/A180zO28ojL._AC_UL320_.jpg", 54.31, 0));
//        dataHB.put("32HB", new Product("32HB", "AmazonBasics Laptop Computer Backpack - Fits Up To 17 Inch Laptops", "https://m.media-amazon.com/images/I/81vfzNUAXEL._AC_UL320_.jpg", 38.05, 0));
//        dataHB.put("33HB", new Product("33HB", "JanSport SuperBreak One Backpack - Lightweight School Bookbag", "https://m.media-amazon.com/images/I/91HkBT96VML._AC_UL320_.jpg", 27.00, 0));
//        dataHB.put("34HB", new Product("34HB", "The North Face Borealis Backpack", "https://m.media-amazon.com/images/I/91D409p0gPL._AC_UL320_.jpg", 88.90, 0));
//        dataHB.put("35HB", new Product("35HB", "Kenneth Cole On Track Pack Vegan Leather 15.6” Laptop & Tablet Bookbag Anti-Theft RFID Backpack for School, Work, & Travel", "https://m.media-amazon.com/images/I/81xwbJbF-RL._AC_UL320_.jpg", 52.20, 0));
//        dataHB.put("36HB", new Product("36HB", "Samsonite Kombi Small Business Backpack with Smart Sleeve, Black/Brown, 16.25 x 10.5 x 5-Inch", "https://m.media-amazon.com/images/I/91BcTKmu+nL._AC_UL320_.jpg", 58.32, 0));
//        dataHB.put("37HB", new Product("37HB", "Fjallraven, Kanken Classic Backpack for Everyday, Graphite", "https://m.media-amazon.com/images/I/71gjJZ4Df2L._AC_UL320_.jpg", 77.90, 0));
//        dataHB.put("38HB", new Product("38HB", "COACH Signature Medium Charlie Backpack", "https://m.media-amazon.com/images/I/41a8R4dBDIL._AC_UL320_.jpg", 324.54, 0));
//        dataHB.put("39HB", new Product("39HB", "Billabong Women's Roadie Backpack, Black/Green, One Size", "https://m.media-amazon.com/images/I/711oU5iohIL._AC_UL320_.jpg", 45.05, 0));
//        dataHB.put("40HB", new Product("40HB", "Vera Bradley Women's Performance Twill Campus Backpack", "https://m.media-amazon.com/images/I/91MVythqlWL._AC_UL320_.jpg", 123.75, 0));
//        dataHB.put("41HB", new Product("41HB", "Kenneth Cole Reaction Manhattan Colombian Leather Slim 16 Laptop & Tablet RFID Business Backpack, Cognac, Medium", "https://m.media-amazon.com/images/I/81X596QchVL._AC_UL320_.jpg", 345.98, 0));
//    }
//}