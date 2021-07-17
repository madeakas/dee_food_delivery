import 'package:flutter/material.dart';
import 'package:dee_food_delivery/food_entity.dart';
import 'package:dee_food_delivery/detail.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.view_headline,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Resto Dee',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Pacifico',
            fontSize: 24,
            //     fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.filter_list),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Filter')
                    ],
                  ),
                  Text('List menu pilihan terbaik'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView(
              children: foodEntity.map((food) {
                return FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(foodEntity: food);
                    }));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0)),
                          child: Image.asset(
                            food.imageAsset,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    food.nama,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\Rp ' + food.harga,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    food.rating,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          color: Colors.greenAccent,
                                          child: Text(
                                            'Gratis Antar',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                    ],
                                  ),
                                  Bookmark()
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  bool isBookmark = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isBookmark ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
      onPressed: () {
        setState(() {
          isBookmark = !isBookmark;
        });
      },
    );
  }
}

var foodEntity = [
  FoodEntity(
      imageAsset: 'assets/images/sate_lilit.jpg',
      nama: 'Sate Lilit',
      harga: '25.000',
      rating: '4.9',
      deskripsi:
          'Kuliner paling identik di Bali adalah sate lilit. Sate ini terbuat dari daging babi, ikan, daging sapi, ayam, atau bahkan kura-kura yang dicincang, kemudian dicampur dengan parutan kelapa, santan, jeruk nipis, bawang merah, dan merica. Daging cincang yang telah berbumbu dilekatkan pada sebuah bambu atau tebu, kemudian dipanggang di atas arang. Tidak seperti sate lainnya yang dibuat dengan tusuk sate yang sempit dan tajam, tusuk sate lilit justru berbentuk datar dan lebar. Permukaan yang lebih luas memungkinkan daging cincang untuk melekat. Istilah lilit dalam bahasa Bali dan Indonesia berarti membungkus, sesuai dengan cara pembuatan sate lilit ini.'),
  FoodEntity(
      imageAsset: 'assets/images/es_kuwet.jpg',
      nama: 'Es Kuwet',
      harga: '15.000',
      rating: '4.7',
      deskripsi:
          'Bicara minuman khas, Bali punya minuman khas yang sudah sangat terkenal salah satunya adalah es kuwet. Minuman ini mirip dengan es campur. Perpaduan antara beberapa jenis buah dengan kelapa, seperti belewah dan biji selasih. Minuman khas Bali ini sangat mudah ditemukan dan cocok buat suasana Bali yang panas.'),
  FoodEntity(
      imageAsset: 'assets/images/es_daluman.jpg',
      nama: 'Es Daluman',
      harga: '10.000',
      rating: '4.6',
      deskripsi:
          'Es daluman merupakan minuman khas Bali yang wajib kamu coba saat berkunjung ke sini. Es daluman ini sebenarnya dikenal dengan nama es cincau. Ya, daluman adalah cincau hijau yang memiliki khasiat untuk memperlancar buang air besar. Biasanya sajian es daluman ini disajikan dengan siraman gula merah, kuah santan, dan juga es batu. Kamu bisa menemukan kesegaran es daluman ini di setiap rumah makan yang menjual makanan khas Bali.'),
  FoodEntity(
      imageAsset: 'assets/images/ayam_betutu.jpg',
      nama: 'Ayam Betutu',
      harga: '50.000',
      rating: '4.7',
      deskripsi:
          'Ayam betutu menjadi andalan masyarakat Bali dan favorit bagi para pengunjung. Keistimewaan dari kuliner khas ini yaitu bumbu base genep. Bumbu base genep merupakan bumbu khas Bali yang terdiri dari bawang merah dan putih, cabai, kemiri, terasi, jahe, lengkuas, kunir, kencur, daun salam, daun jeruk, dan serai yang dihaluskan dan ditumis. Selain bumbu, keunikan ayam betutu Bali yaitu pada cara penyajiannya, di mana daun singkong dimasukkan ke dalam perut ayam setelah dilumur dengan bumbu genep di atasnya.'),
  FoodEntity(
      imageAsset: 'assets/images/lawar.jpg',
      nama: 'Lawar',
      harga: '50.000',
      rating: '4.8',
      deskripsi:
          'Lawar terbuat dari campuran sayuran, daging cincang, dan bumbu khas Bali. Uniknya, penyebutan lawar ini tergantung jenis bahan yang digunakan. Misal menggunakan sayur nangka muda, maka disebut lawar nangka. Selain berisi sayur, ada juga lawar yang dibuat dari daging cincang bercampur dengan sayur, seperti lawar daging babi dan ayam.'),
  FoodEntity(
      imageAsset: 'assets/images/es_loloh.jpg',
      nama: 'Es Loloh Cem Cem',
      harga: '10.000',
      rating: '4.6',
      deskripsi:
          'Minuman khas Bali selanjutnya adalah es loloh. Dalam bahas Bali, Loloh artinya adalah jamu. Namun Loloh ini berbeda dari jamu pada umumnya. Minuman khas Bali yang satu ini memiliki rasa pedas, manis, asam, dan asin yang tercampur menjadi satu. Tak banyak orang juga yang menyebut minuman ini dengan Loloh Cemcem karena mengandung daun Cemcem. Minuman ini dipercaya bisa membantu menurunkan tekanan darah dan melancarkan pencernaan, serta baik juga untuk ibu menyusui.'),
  FoodEntity(
      imageAsset: 'assets/images/tipat_blayag.jpg',
      nama: 'Tipat Blayag',
      harga: '30.000',
      rating: '4.5',
      deskripsi:
          'Tipat blayag mirip seperti ketupat. Biasanya, tipat blayag disajikan dengan bumbu khas seperti pecal dan gado-gado, dengan tambahan sayur kangkung, suwiran ayam, dan tauge. Bahan-bahan bumbu yang digunakan untuk tipat blayag terdiri dari bawang merah, kunyit, serai, dan kaldu ayam untuk kuahnya.'),
  FoodEntity(
      imageAsset: 'assets/images/sate_plecing.jpg',
      nama: 'Sate Plecing',
      harga: '35.000',
      rating: '4.6',
      deskripsi:
          'Bumbu Sambal Plecing mungkin kamu tahu sebagai peneman makanan bakar seperti ikan atau ayam Taliwang, yang merupakan masakan barbeque kebanggaan Nusantara. Sama halnya untuk Sate Plecing, bumbu tersebut klop sekali berpadu dengan rasa char atau gosong pada daging ayam atau babi pada sate ini.'),
  FoodEntity(
      imageAsset: 'assets/images/tipat_cantok.jpg',
      nama: 'Tipat Cantok',
      harga: '25.000',
      rating: '4.4',
      deskripsi:
          'Bayangkan gado-gado bercampur dengan ketoprak diatas piringmu. Menarik? Tipat dengan topping berbagai sayuran rebus, seperti kacang panjang, tauge, kangkung, dan ditambah potongan tahu goreng, lalu dicampur dengan bumbu kacang kemudian ditabur bawang dan kacang tanah goreng ini cukup umum ditemukan di kaki lima maupun gerobak keliling di seluruh pulau Bali.'),
];
