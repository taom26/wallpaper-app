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
    'https://i.pinimg.com/236x/da/4c/e2/da4ce24e4ad19cd5ccb03d13b1216fac.jpg'
  ],
  // Agrega más categorías y sus imágenes aquí
  'Videojuegos': [
    'https://i.pinimg.com/564x/05/9c/65/059c6510af0bcc7096511c5a71447bd9.jpg',
    'https://i.pinimg.com/564x/64/f5/9f/64f59f2dbb5da050e4a6b7128e0cc7d0.jpg',
    'https://i.pinimg.com/564x/a3/61/2a/a3612ac5e4135db5eee98e8c74ee8503.jpg',
    'https://cdn.discordapp.com/attachments/904396958737760337/992890519355142164/20220702_140724.jpg?ex=66621cda&is=6660cb5a&hm=aa787092dfa6f4548ed695b8926f6d22f12d72fc46e3286db640e4eb01784d45&=&format=webp&width=503&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1168063270289166346/20231028_210833.jpg?ex=66629eb1&is=66614d31&hm=4fc130ddf7a14c2fd88ec1d930ac1f0236ac7e4b6e8445240f893dde6bd8647a&=&format=webp&width=503&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1168063284285538335/20231027_233432.jpg?ex=66629eb4&is=66614d34&hm=cce090bf12d941528803aaed726d9a31d92250469dbe6eccd468ea5d8d6655f3&=&format=webp&width=503&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1183613455215886386/20231210_223649.jpg?ex=6662806e&is=66612eee&hm=6cbb1d2f398358c730082d6d8d1fcb9b15614b2fb6a8446c7462865204004560&=&format=webp&width=450&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1183613463663218688/20231210_223652.jpg?ex=66628070&is=66612ef0&hm=029bcd6d090b25ab69b7c2484fd792338b6fdaedb83082503bfb03c23913d97e&=&format=webp&width=420&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1197758139408322600/20240118_232302.jpg?ex=66628b31&is=666139b1&hm=18ce2694d0b77e30cab0e38bb7d338efed0136a0695b9eac90bc4e3eeb7a55e1&=&format=webp&width=386&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1241099098828963950/20240517_134248.jpg?ex=6662039b&is=6660b21b&hm=62c824b3ba250a8c87ed9a480453ab8496e8e11f2d32ca127176c8a3d90be6cc&=&format=webp&width=518&height=671'
  ],
  'Genshin Impact': [
    'https://cdn.discordapp.com/attachments/904396958737760337/904396982997639209/yande-1.jpg?ex=6661dad3&is=66608953&hm=e218b04f97d1549c12469e97c34c2e11f41dcacbae7d058446af7bcf94f71e30&=&format=webp&width=503&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/932469436705804298/95304656_p0.jpg?ex=6661cf16&is=66607d96&hm=5998f04ec8ebd5695765ff9856f84afa2b43773e4d5e8855bfb9ce9c849d57f5&=&format=webp&width=503&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/988851582047236096/20220621_120304.jpg?ex=6661ebcd&is=66609a4d&hm=4fc562444469e843b77dd2af05efcc54a4357a543db166d6c42c8131eedea7cd&=&format=webp&width=503&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1001279014847131769/20220725_190511.jpg?ex=66624ec0&is=6660fd40&hm=37b894a350b81a751f07625e8e1fd17111b8e2c7ffa6b5ede02b1e8e541178a2&=&format=webp&width=503&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1003052575299469453/20220730_163242.jpg?ex=66622b01&is=6660d981&hm=4ade212234f4bd1fa7c9dfa97365d667ce05547eb791313b096040b126ccda46&=&format=webp&width=503&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1025241379162558546/20220929_220255.jpg?ex=6661cfb0&is=66607e30&hm=706b200ab462924199cb9790e35a68945debd8dac6a15414466a3063def54c13&=&format=webp&width=500&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1079814780824588438/20230227_120639.jpg?ex=66629821&is=666146a1&hm=3888a9b295b575598c2dddd315f12667cc0582e89a086ad8bf6021baca49d343&=&format=webp&width=503&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1114374029323812885/20230602_210309.jpg?ex=66626ab0&is=66611930&hm=0490176394a6cecb4f72e343955d7e8de3a2f340f331258082d05fe868df10c2&=&format=webp&width=425&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1124364765200916531/20230629_173859.jpg?ex=66628209&is=66613089&hm=629877b93976dbdbec774ff7c0d1d1a425635458233b4178b9cc71299e7974a1&=&format=webp&width=503&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1128021026903703643/20230710_113112.jpg?ex=6661f772&is=6660a5f2&hm=5c5c0732805f0f7aa11848be1e5ac00e85639519a48507d3fa64f18ffee02f75&=&format=webp&width=503&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1178361552819200061/20231126_104727.jpg?ex=666282f7&is=66613177&hm=15b3ccf79f16140945624437560bbcd188801a36a9d112af609d9e01bf7caf54&=&format=webp&width=410&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1179256881701732448/20231128_220514.jpg?ex=6662790e&is=6661278e&hm=76895353dcda632cd6fe2d0283d5e04ad94aa90def4a4356dae1fef8a7a8a8ba&=&format=webp&width=487&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1182826064368652328/20231208_164242.jpg?ex=6662461d&is=6660f49d&hm=cbe6e1161662c89ff9b88cc46e14f59de2dee5ecb239bb84b05763badd4d225d&=&format=webp&width=474&height=670',
    'https://media.discordapp.net/attachments/904396958737760337/1184053371712307210/20231212_034408.jpg?ex=66621fe2&is=6660ce62&hm=a6dfc02c64377ce86fff1a9edd50d4ecb85043868834580348ed5b39cc35688e&=&format=webp&width=475&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1194140482968756285/20240108_234712.jpg?ex=666290fd&is=66613f7d&hm=d3eefdc44dcd1f8456a77b69e3177e28857635ca3e41d5960f9f0e1d9ef2b40e&=&format=webp&width=377&height=670'
  ],
  'Anime': [
    'https://i.pinimg.com/564x/91/3e/3f/913e3fbf46a72424e37ff1b82031287d.jpg',
    'https://i.pinimg.com/736x/ff/8f/57/ff8f57cebf24b785026855817f243af1.jpg',
    'https://i.pinimg.com/564x/ef/9d/74/ef9d74fb676c73e96bbf72af71faa333.jpg',
    'https://cdn.discordapp.com/attachments/904396958737760337/904484333333651516/FB_IMG_1635700364465.jpg?ex=66622c2d&is=6660daad&hm=6b62c4ec63c5ea938eb87b3651fecf6bc380cd3080d69e7ea1e72caa50e4faf8&',
    'https://cdn.discordapp.com/attachments/904396958737760337/945538061889048626/2.jpg?ex=6661e431&is=666092b1&hm=2978b635e7e193924d4140dd95bc35fa4ee996deaee1370fc284c9a486961844&',
    'https://cdn.discordapp.com/attachments/904396958737760337/983906164993581106/95736329_p0.jpg?ex=6661ba45&is=666068c5&hm=e10ec5f5ebd406f7b2a0b377ba2db078153159a9c6de1672520368462ef0f44a&',
    'https://media.discordapp.net/attachments/904396958737760337/1001697234678722600/20220726_224420.jpg?ex=6661d9ff&is=6660887f&hm=453d59c45a6e0fe39ff7c2ad60f33f2a884c399bf49e4d6a6e92b36fe868aeff&=&format=webp&width=417&height=670',
    'https://cdn.discordapp.com/attachments/904396958737760337/1001697227162521632/20220726_224419.jpg?ex=6661d9fd&is=6660887d&hm=375fc073f1cd6f0cc9c1b590693ace3298aea820a0ee86f45b708e97cb43ef2a&',
    'https://cdn.discordapp.com/attachments/904396958737760337/1025505563272032327/20220930_153251.jpg?ex=66621cfb&is=6660cb7b&hm=3513f58e1f640d15d8539965c9cbede956d68c25451d9315f65c903aa788ea51&',
    'https://media.discordapp.net/attachments/904396958737760337/1029488491786141706/20221011_092628.jpg?ex=666219df&is=6660c85f&hm=e9363be8d30cac830cab00934c32c1457693301846f22435329721f6d03b722d&=&format=webp&width=474&height=670',
    'https://cdn.discordapp.com/attachments/904396958737760337/1032793730211647609/FfgFxkeaEAAmHBR.jpg?ex=6662429d&is=6660f11d&hm=a076f685706b07e1eb0d74a056674e7abe687c53e09eb9abbce7916298ef0a65&',
    'https://media.discordapp.net/attachments/904396958737760337/1033730447512977408/20221023_044823.jpg?ex=6661b680&is=66606500&hm=35e27df2870ac26d29f8523e88cbeb0e832be4e6019b65580ad70979d8dd2cf4&=&format=webp&width=476&height=670',
    'https://media.discordapp.net/attachments/904396958737760337/1045419226267131955/20221124_012449.jpg?ex=66620c86&is=6660bb06&hm=9da43d608d56c1e3679f1446ed16f931d67d985282fbd6221eb8e6c5075a9791&=&format=webp&width=495&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1114375392007032862/20230602_210812.jpg?ex=66626bf5&is=66611a75&hm=c8810bb39a7da705337fc2515296df0c13848058c14d794fb3d1e4dd35481e22&=&format=webp&width=465&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1117575641907335349/20230611_170618.jpg?ex=666232ec&is=6660e16c&hm=c79bdc1fea40b2137393bdf34986a38fefb92564e9ce13f1ddbbf1013d3d79b1&',
    'https://media.discordapp.net/attachments/904396958737760337/1123836715426119680/20230628_234506.jpg?ex=66629080&is=66613f00&hm=260ee0e3bc2698d7c3a2729f88a30c8c61275f5f45fb8491c0e167fffd74cc52&=&format=webp&width=534&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1125138145642553384/20230702_114437.jpg?ex=6662068d&is=6660b50d&hm=3d80ccf0dcd61fc5dddb72aa8363ead6a00bae740c54f77fdd587945383d0a61&',
    'https://cdn.discordapp.com/attachments/904396958737760337/1125624335781089350/20230703_220302.jpg?ex=666279da&is=6661285a&hm=a8ef4ec3bd1413981effec39fd841ee08e3bbafbc8f65376e0d6b7ed497c2a6c&',
    'https://cdn.discordapp.com/attachments/904396958737760337/1129131894332719225/20230713_142644.jpg?ex=66620d85&is=6660bc05&hm=df8fdb41bbdf6383fbc5c13f15ec47e5c01a6e2d45239a96f4b3fa3cd94053c7&',
    'https://cdn.discordapp.com/attachments/904396958737760337/1131765764437844090/20230720_205244.jpg?ex=66626801&is=66611681&hm=cd926ccaa575fb4fb942f42cef71be252284c2537d93ac1086ec78d566661adf&',
    'https://cdn.discordapp.com/attachments/904396958737760337/1134176749819801730/20230727_070254.jpg?ex=66629ba9&is=66614a29&hm=d36ae3f26b6c87fa2bf9683cb6af3f424db95ce68c73f71f66d0b1241ea2dd5a&',
    'https://cdn.discordapp.com/attachments/904396958737760337/1134282492321468416/20230727_192900.jpg?ex=66625564&is=666103e4&hm=7e9b89ccca29f3c741c629850e0b1d407b3242f6b5b2e6064f229a7f5d4ec27e&',
    'https://cdn.discordapp.com/attachments/904396958737760337/1135084507603677244/20230730_003952.jpg?ex=66629d53&is=66614bd3&hm=4896d737801eef25a95e1614fba4c8cf968668966e60ce6d4088b272022d72b5&',
    'https://media.discordapp.net/attachments/904396958737760337/1136105301075050516/20230801_201607.jpg?ex=66625f83&is=66610e03&hm=e061378bf259049db9e4f295b190bc0697bb637b2817ee8b677d43b29cd42691&=&format=webp&width=375&height=670',
    'https://media.discordapp.net/attachments/904396958737760337/1139554732663390259/20230811_083735.jpg?ex=666265cc&is=6661144c&hm=442236a0f19009e457aa182547886579ded94056e09b55e6b9ea21b29e7ed49f&=&format=webp&width=521&height=670',
    'https://media.discordapp.net/attachments/904396958737760337/1144830069546700840/20230825_220548.jpg?ex=66627916&is=66612796&hm=5e3d8b1d1fa5b296ad4322c71162a5bf21d170633f8c0d70faf57fa4db817816&=&format=webp&width=338&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1165820596307894335/20231022_201234.jpg?ex=66625f0a&is=66610d8a&hm=b1e5d99bbc534a54fe9a91125174c22508d5f7c4e9d3fd3ea8d98716202eac76&',
    'https://media.discordapp.net/attachments/904396958737760337/1185961802027249784/20231217_095537.jpg?ex=666279bf&is=6661283f&hm=4bdb1d9f880de6502f404bcd176d819e708e88cb78822ecee3d15d86b5b1e4d2&=&format=webp&width=474&height=670',
    'https://media.discordapp.net/attachments/904396958737760337/1187074229208879104/20231219_181600.jpg?ex=66629147&is=66613fc7&hm=7bd371ae84e1d433a374525fec88e9aa180913110ac701bdeed1d359e2503542&=&format=webp&width=474&height=670',
    'https://media.discordapp.net/attachments/904396958737760337/1189720230210064444/20231227_190227.jpg?ex=66624e4e&is=6660fcce&hm=2c32fd960989ab818fd39a3345609e36ef2e08f7287479230d2d438a051fe822&=&format=webp&width=481&height=671',
    'https://cdn.discordapp.com/attachments/904396958737760337/1194783589657755668/20240110_113213.jpg?ex=666244ed&is=6660f36d&hm=84f5e67257cb9aae9c65fa6ddf79d4c1351e8ee17ad250bcb07eedc9fca35494&',
    'https://media.discordapp.net/attachments/904396958737760337/1197289241231757342/20240117_161920.jpg?ex=666227ff&is=6660d67f&hm=ff0a4a7b9bcf7b261d8e41d4a588168f79fe1b83302386153b10654cf7ae1ae8&=&format=webp&width=493&height=670',
    'https://media.discordapp.net/attachments/904396958737760337/1201757997010014228/F_tGd_KaIAAXxyY.png?ex=666297da&is=6661465a&hm=9b44642759acc4d6d17f556397e2437db1ef7cb293198fb3a5d7d00f975c987a&=&format=webp&quality=lossless&width=494&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1201758012021153913/F_tGeKraMAA0RSr.png?ex=666297dd&is=6661465d&hm=5cc5611ac3354da03271c3053a4da5513070229e00c02cab8a5bffccd79e066a&=&format=webp&quality=lossless&width=528&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1241109939527614464/20240517_142609.jpg?ex=66620db4&is=6660bc34&hm=42ef3c0c48895a4d23f0ddfb3ee9feba54a44e07416bb7772cce720b5b51b19d&=&format=webp&width=369&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1243223839995859084/20240522_221924.jpg?ex=66627e2d&is=66612cad&hm=bd66a0b03e3782e3a07be434faa5c3d4bb8ac625214c44be1663010df26a3ea5&=&format=webp&width=490&height=670',
    'https://media.discordapp.net/attachments/904396958737760337/1243223850519625789/20240522_221926.jpg?ex=66627e2f&is=66612caf&hm=1da78ab117776c100a66da541af1393f5d2ca3fd8dec5b0fa23f7ca1929ea1c2&=&format=webp&width=494&height=671',
    'https://media.discordapp.net/attachments/904396958737760337/1243223860099158047/20240522_221922.jpg?ex=66627e32&is=66612cb2&hm=b77eb5059ab7207ffa38292023c57600043e1944042ac006d2aab0acfcac5362&=&format=webp&width=490&height=671'
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
