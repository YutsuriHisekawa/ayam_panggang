class MenuData {
  final String image;
  final String title;
  final String description;
  final int price;
  final String estimasi;
  final double rating;

  MenuData({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.estimasi,
    required this.rating,
  });
}

List<MenuData> getFoodItems() {
  return [
    MenuData(
      image:
          'https://img.kurio.network/KHnU40LdXpEdIlK9e64yu9Hf8KQ=/1200x1200/filters:quality(80)/https://kurio-img.kurioapps.com/22/01/09/dd41c0fe-ff1c-498d-b35f-ec959150e7e1.jpe',
      title: 'Ayam Panggang',
      description: 'Ayam panggang dengan bumbu marinasi spesial.',
      price: 45000,
      estimasi: '30 menit',
      rating: 4.5,
    ),
    MenuData(
      image:
          'https://www.masakapahariini.com/wp-content/uploads/2022/03/nasi-goreng-rempah-500x300.jpg',
      title: 'Nasi Goreng',
      description: 'Nasi goreng dengan ayam dan sayuran.',
      price: 30000,
      estimasi: '20 menit',
      rating: 4.7,
    ),
    MenuData(
      image:
          'https://www.masakapahariini.com/wp-content/uploads/2023/03/resep-sambal-tomat.jpg',
      title: 'Sambal',
      description: 'Sambal pedas yang disajikan sebagai sambal pendamping.',
      price: 10000,
      estimasi: '10 menit',
      rating: 4.8,
    ),
    MenuData(
      image:
          'https://kurio-img.kurioapps.com/21/12/20/f712a185-de62-4365-a4a4-6d218b798158.jpe',
      title: 'Sayur Lodeh',
      description: 'Sup sayuran dengan santan.',
      price: 35000,
      estimasi: '25 menit',
      rating: 4.6,
    ),
    MenuData(
      image:
          'https://d1vbn70lmn1nqe.cloudfront.net/prod/wp-content/uploads/2021/11/03020431/7.-Kalori-Kerupuk-Putih-dan-Bahayanya-Jika-Dikonsumsi-Berlebih.jpg',
      title: 'Kerupuk',
      description: 'Kerupuk renyah, sempurna untuk camilan.',
      price: 5000,
      estimasi: '5 menit',
      rating: 4.9,
    ),
    MenuData(
      image:
          'https://d1bpj0tv6vfxyp.cloudfront.net/articles/3be14058-960e-4007-abc1-03e949ccd01b_article_image_url.webp',
      title: 'Tahu Tempe',
      description: 'Tahu goreng dan tempe fermentasi.',
      price: 20000,
      estimasi: '15 menit',
      rating: 4.7,
    ),
    MenuData(
      image:
          'https://asset.kompas.com/crops/J7KOPBoSnx10zYpoFaid0E5_c-0=/2x0:700x465/750x500/data/photo/2023/11/07/654a25a73f416.jpg',
      title: 'Ayam Penyet',
      description: 'Ayam goreng yang dihancurkan disajikan dengan sambal.',
      price: 50000,
      estimasi: '35 menit',
      rating: 4.6,
    ),
    MenuData(
      image:
          'https://www.unileverfoodsolutions.co.id/dam/global-ufs/mcos/SEA/calcmenu/recipes/ID-recipes/salads/nasi-pecel/main-header.jpg',
      title: 'Pecel',
      description: 'Sayuran campur dengan saus kacang.',
      price: 40000,
      estimasi: '30 menit',
      rating: 4.5,
    ),
  ];
}
