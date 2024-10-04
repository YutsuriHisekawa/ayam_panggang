class OrderItem {
  final int id;
  final String title;
  final int price;
  final String imageUrl;

  OrderItem({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}

// Data pesanan
final List<OrderItem> orderData = [
  OrderItem(
    id: 1,
    title: 'Ayam Panggang',
    price: 45000,
    imageUrl:
        'https://img.kurio.network/KHnU40LdXpEdIlK9e64yu9Hf8KQ=/1200x1200/filters:quality(80)/https://kurio-img.kurioapps.com/22/01/09/dd41c0fe-ff1c-498d-b35f-ec959150e7e1.jpe', // placeholder image
  ),
  OrderItem(
    id: 2,
    title: 'Nasi Goreng',
    price: 15000,
    imageUrl:
        'https://www.masakapahariini.com/wp-content/uploads/2022/03/nasi-goreng-rempah-500x300.jpg',
  ),
  OrderItem(
    id: 3,
    title: 'Teh Manis',
    price: 5000,
    imageUrl:
        'https://www.astronauts.id/blog/wp-content/uploads/2023/03/Beberapa-Resep-Es-Teh-Manis-Yang-Enggak-Ngebosenin-Untuk-Buka-Puasa.jpg',
  ),
];
