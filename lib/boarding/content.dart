class BoardingData {
  final String imagePath;
  final String title;
  final String description;

  BoardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

List<BoardingData> boardingPages = [
  BoardingData(
    imagePath: 'images/assets/humanphone.png',
    title: 'Order dimana saja!',
    description:
        'Nikmati berbagai pilihan makanan lezat kapan saja dan di mana saja. Cukup pesan dan biarkan kami mengantarkan cita rasa ke depan pintu Anda!',
  ),
  BoardingData(
    imagePath: 'images/assets/ayam.png',
    title: 'Ayam Panggang Menanti!',
    description:
        'Rasakan ayam panggang yang menggugah selera, dimasak dengan sempurna dan diantar segar.',
  ),
  BoardingData(
    imagePath: 'images/logo.png',
    title: 'Ayo Mulai Sekarang!',
    description:
        'Bergabunglah dengan kami hari ini dan eksplorasi dunia kuliner yang ada di ujung jari Anda!',
  ),
];
