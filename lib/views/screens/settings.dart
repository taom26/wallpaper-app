import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

final Map<String, List<String>> categories = {
  'Vehículos': [
    'https://plus.unsplash.com/premium_photo-1677993185885-985af6b425c4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1677993185885-985af6b425c4?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1542282088-fe8426682b8f?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1489824904134-891ab64532f1?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1567808291548-fc3ee04dbcf0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1580273916550-e323be2ae537?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1549399542-7e3f8b79c341?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1514316454349-750a7fd3da3a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1498887960847-2a5e46312788?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1518306727298-4c17e1bf6942?q=80&w=1936&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1541447270888-83e8494f9c06?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1490641815614-b45106d6dd04?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1606220838315-056192d5e927?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1502219422320-9ca47798b75b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1517026575980-3e1e2dedeab4?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1598586958772-8bf368215c2a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjR8fGNhcnxlbnwwfDF8MHx8fDA%3D',
    'https://i.pinimg.com/564x/e7/88/0c/e7880c9e1791917b2aa180f8466bdff1.jpg',
    'https://i.pinimg.com/564x/be/41/9e/be419ef2848147207003aadcb5bdc37a.jpg',
    'https://i.pinimg.com/564x/b5/31/78/b5317860ceef6e17eca011309243af88.jpg'
  ],
  'Animales': [
    // Nueva categoría
    'https://i.pinimg.com/236x/f5/e0/78/f5e0788493a2235ebe07a111826011d6.jpg',
    'https://i.pinimg.com/236x/1c/f1/9f/1cf19fee03ca220f5325bb5b32b4a3e8.jpg',
    'https://i.pinimg.com/236x/d3/46/bf/d346bf34cde4a2ff71d62d95d88139a8.jpg',
    'https://i.pinimg.com/236x/45/6f/5f/456f5fb46bc47cb05a0f5cd4961e6534.jpg',
    'https://i.pinimg.com/236x/bc/8a/ce/bc8ace02408b860500450a0db37e5e54.jpg',
    'https://i.pinimg.com/236x/c8/0e/c3/c80ec3c7b5e764b55b7d7cb7451711b8.jpg',
    'https://i.pinimg.com/236x/79/32/2d/79322d3df8500132499a52b7d58fbcc1.jpg',
    'https://i.pinimg.com/236x/6d/34/7a/6d347ab82610bd9a335aaa17b4b7e014.jpg',
    'https://i.pinimg.com/236x/37/15/c6/3715c6557e57e1a5676b7ce9069d9e33.jpg',
    'https://i.pinimg.com/236x/93/dc/da/93dcdab6dc381925959e875d6bde3efe.jpg',
    'https://i.pinimg.com/236x/77/73/72/77737268cb1784063e6cae64cb94acc0.jpg',
    'https://i.pinimg.com/236x/44/0d/5f/440d5f3671b62a9a00e5bd4597efe879.jpg',
    'https://i.pinimg.com/236x/76/b2/fc/76b2fc376acd2de517f5860f4166c524.jpg',
    'https://i.pinimg.com/236x/44/0d/5f/440d5f3671b62a9a00e5bd4597efe879.jpg',
    'https://i.pinimg.com/236x/a8/6a/89/a86a896f4b8a7413dcad7bc6dca6c396.jpg',
    'https://i.pinimg.com/236x/46/62/d2/4662d2dbc977ed0c331d952701553734.jpg',
    'https://i.pinimg.com/236x/23/41/a3/2341a3005c80bd99911a8190c0fd1b29.jpg',
    'https://i.pinimg.com/236x/2a/dd/e6/2adde65cd50944eec0b0deea974487db.jpg',
    'https://i.pinimg.com/236x/22/91/d2/2291d2d1a400b7e1a18c40761064f08a.jpg',
    'https://i.pinimg.com/236x/29/40/3a/29403af7a10fda2b0a070fedc24e0c8c.jpg',
    'https://i.pinimg.com/236x/36/b1/69/36b1691aff8c77e0066dab555b39f415.jpg',
    'https://i.pinimg.com/236x/35/99/44/3599446501422f6d09ba6e46d211ec5f.jpg',
    'https://i.pinimg.com/236x/dc/ec/a9/dceca943d134c0fce25fd03818452476.jpg',
    'https://i.pinimg.com/236x/49/8f/eb/498febd439b2244fb6a919f9e49e230a.jpg',
    'https://i.pinimg.com/236x/49/8d/11/498d116ac66b0aa4a2d1a0262e5a0543.jpg',
    'https://i.pinimg.com/236x/a5/37/f5/a537f58751325545d065c52b48ba9b38.jpg',
    'https://i.pinimg.com/236x/6e/d2/f3/6ed2f34fa914cee45ebd256231fda39e.jpg',
    'https://i.pinimg.com/236x/9f/eb/6c/9feb6c79c76ddcc345601542d73082c9.jpg',
    'https://i.pinimg.com/236x/40/0e/30/400e302bb0a020cd9385d0dd1c5d35a2.jpg',
    'https://i.pinimg.com/236x/7b/a7/de/7ba7de82e385edf751f91be6cda1f60b.jpg',
    'https://i.pinimg.com/236x/b6/41/1c/b6411c6b75525442d8c9a93dac9bf4b2.jpg',
  ],
  'Deportes': [
    // Nueva categoría
    'https://images.unsplash.com/photo-1591311337241-cecfd26f1da1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fGRlcG9ydGVzfGVufDB8MXwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1558388555-50f0410dd4c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDN8fGRlcG9ydGVzfGVufDB8MXwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1580238053495-97f9f087734b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTF8fGRlcG9ydGVzfGVufDB8MXwwfHx8MA%3D%3D',
    'https://i.pinimg.com/564x/81/41/cb/8141cb605e8ff63b45df98872bd19b44.jpg',
    'https://i.pinimg.com/236x/e0/ad/66/e0ad66d645af29d5d9907949e3922f37.jpg',
    'https://i.pinimg.com/236x/7b/9c/a7/7b9ca73e2edfc93e1cb337e0fc4a55e1.jpg',
    'https://i.pinimg.com/236x/4c/99/f9/4c99f9012162bd366aeff5526a211e8c.jpg',
    'https://i.pinimg.com/236x/e6/9b/ed/e69bed54e6867a2a8c228a4bfdfb20bf.jpg',
    'https://i.pinimg.com/236x/ca/2a/a2/ca2aa2c3225e41c8bbd4744c9a921ec9.jpg',
    'https://i.pinimg.com/236x/fa/15/cd/fa15cde82bfea30c5c51c79e3c2758fb.jpg',
    'https://i.pinimg.com/236x/d4/b2/ff/d4b2ffed51449bf4388e2f135d2d738b.jpg',
    'https://i.pinimg.com/236x/0a/3f/3f/0a3f3fec412cbf9b7681c31bcdf4b935.jpg',
    'https://i.pinimg.com/474x/84/82/57/848257067111af7e9c84ab0eae01809f.jpg',
    'https://i.pinimg.com/236x/8c/a5/83/8ca5834e0227f24fbacea54abeddc6a1.jpg',
    'https://i.pinimg.com/236x/cc/ae/46/ccae4606701c0ffe7b9b3ad485052052.jpg',
    'https://i.pinimg.com/236x/74/10/50/741050a21c8a284ad9f69b358ced4d29.jpg',
    'https://i.pinimg.com/236x/c2/dd/b9/c2ddb9d96e0959183d12228f6c053d5e.jpg',
    'https://i.pinimg.com/474x/7e/2f/d3/7e2fd3e6cd59e7ada9637867a27091c7.jpg',
    'https://i.pinimg.com/474x/51/07/73/5107733d553291219e789d865618f781.jpg',
    'https://i.pinimg.com/236x/91/b2/38/91b23893f6c8ce9c80a4c77de3678fa6.jpg',
    'https://i.pinimg.com/236x/23/05/33/23053304ae7485caf26d48c4b4ac1457.jpg',
    'https://i.pinimg.com/236x/f1/46/9b/f1469b0cb210fd209d925743a487ed16.jpg',
    'https://i.pinimg.com/236x/5c/68/54/5c6854a4a4aee9822c0217c21d07a5ad.jpg',
    'https://i.pinimg.com/236x/87/b4/2f/87b42f028ff4bfc23229c19adba3fa99.jpg',
    'https://i.pinimg.com/236x/97/d7/9b/97d79b3ed231e6e24623e369b32f9b2d.jpg',
    'https://i.pinimg.com/236x/70/67/3a/70673a2ef14a6b42b4cf11fad00a8474.jpg',
    'https://i.pinimg.com/236x/95/f0/b8/95f0b89807f55fccc657a3ed5d309c3d.jpg',
    'https://i.pinimg.com/236x/21/ee/23/21ee23abe79e5b87b4b1a8b1ffd7c346.jpg',
    'https://i.pinimg.com/236x/b5/f1/ec/b5f1eca8de48223d42b886ee6da884a0.jpg',
    'https://i.pinimg.com/236x/c4/50/81/c45081989259f07372021e9933308122.jpg',
    'https://i.pinimg.com/236x/3d/02/fb/3d02fbb348dbfee69a3b8c5188e9a26f.jpg',
    'https://i.pinimg.com/236x/55/20/57/5520570f4337054637789d735505d0c4.jpg',
    'https://i.pinimg.com/236x/da/4c/e2/da4ce24e4ad19cd5ccb03d13b1216fac.jpg',
  ],
  // Agrega más categorías y sus imágenes aquí
  'Videojuegos': [
    'https://i.pinimg.com/564x/05/9c/65/059c6510af0bcc7096511c5a71447bd9.jpg',
    'https://i.pinimg.com/564x/64/f5/9f/64f59f2dbb5da050e4a6b7128e0cc7d0.jpg',
    'https://i.pinimg.com/564x/a3/61/2a/a3612ac5e4135db5eee98e8c74ee8503.jpg',
    'https://cdn.discordapp.com/attachments/904396958737760337/992890519355142164/20220702_140724.jpg?ex=66621cda&is=6660cb5a&hm=aa787092dfa6f4548ed695b8926f6d22f12d72fc46e3286db640e4eb01784d45&'
  ],
  'Genshin Impact': [
    'https://cdn.discordapp.com/attachments/904396958737760337/904396982997639209/yande-1.jpg?ex=6661dad3&is=66608953&hm=e218b04f97d1549c12469e97c34c2e11f41dcacbae7d058446af7bcf94f71e30&',
    'https://cdn.discordapp.com/attachments/904396958737760337/932469436705804298/95304656_p0.jpg?ex=6661cf16&is=66607d96&hm=5998f04ec8ebd5695765ff9856f84afa2b43773e4d5e8855bfb9ce9c849d57f5&',
    'https://cdn.discordapp.com/attachments/904396958737760337/988851582047236096/20220621_120304.jpg?ex=6661ebcd&is=66609a4d&hm=4fc562444469e843b77dd2af05efcc54a4357a543db166d6c42c8131eedea7cd&',
  ],
  'Anime': [
    'https://i.pinimg.com/564x/91/3e/3f/913e3fbf46a72424e37ff1b82031287d.jpg',
    'https://i.pinimg.com/736x/ff/8f/57/ff8f57cebf24b785026855817f243af1.jpg',
    'https://i.pinimg.com/564x/ef/9d/74/ef9d74fb676c73e96bbf72af71faa333.jpg',
    'https://cdn.discordapp.com/attachments/904396958737760337/904484333333651516/FB_IMG_1635700364465.jpg?ex=66622c2d&is=6660daad&hm=6b62c4ec63c5ea938eb87b3651fecf6bc380cd3080d69e7ea1e72caa50e4faf8&',
    'https://cdn.discordapp.com/attachments/904396958737760337/945538061889048626/2.jpg?ex=6661e431&is=666092b1&hm=2978b635e7e193924d4140dd95bc35fa4ee996deaee1370fc284c9a486961844&',
    'https://cdn.discordapp.com/attachments/904396958737760337/983906164993581106/95736329_p0.jpg?ex=6661ba45&is=666068c5&hm=e10ec5f5ebd406f7b2a0b377ba2db078153159a9c6de1672520368462ef0f44a&',
    ''
  ],
  'Aesthetic': [
    'https://i.pinimg.com/564x/91/3e/3f/913e3fbf46a72424e37ff1b82031287d.jpg',
    'https://i.pinimg.com/736x/ff/8f/57/ff8f57cebf24b785026855817f243af1.jpg',
    'https://i.pinimg.com/564x/ef/9d/74/ef9d74fb676c73e96bbf72af71faa333.jpg'
  ],
  'Minimalista': [
    'https://i.pinimg.com/564x/91/3e/3f/913e3fbf46a72424e37ff1b82031287d.jpg',
    'https://i.pinimg.com/736x/ff/8f/57/ff8f57cebf24b785026855817f243af1.jpg',
    'https://i.pinimg.com/564x/ef/9d/74/ef9d74fb676c73e96bbf72af71faa333.jpg'
  ],
  'Películas': [
    'https://i.pinimg.com/564x/e7/25/a5/e725a5f134277a2e26480db498ebdf48.jpg',
    'https://i.pinimg.com/564x/a3/9b/14/a39b14d835001ab7b7d58ff1f906b76f.jpg',
    'https://i.pinimg.com/564x/dd/d0/4e/ddd04eac46d1d15e036d1b4471e26432.jpg'
  ],
};

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorías')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          String category = categories.keys.elementAt(index);
          List<String> images = categories[category]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 3 /
                      4, // Aspect ratio similar al de una pantalla de teléfono
                  enlargeCenterPage: true,
                  pageViewKey:
                      PageStorageKey<String>('carousel_slider_$category'),
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
                items: images
                    .map((item) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullscreenImageGallery(
                                  images: images,
                                  initialIndex: images.indexOf(item),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(item,
                                      fit: BoxFit.cover,
                                      width: 1000.0,
                                      height: double.infinity),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FullscreenImageGallery extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const FullscreenImageGallery(
      {super.key, required this.images, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(images[index]),
            initialScale: PhotoViewComputedScale.contained,
            heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(initialPage: initialIndex),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SettingsPage(),
  ));
}
