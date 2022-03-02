import 'package:flutter/material.dart';

import 'main_page.dart';

void main()=> runApp(const MainPage());

// void main() => {
//
//   DoKit.runApp(app:DoKitApp(MainPage()),
//       // 是否在release包内使用，默认release包会禁用
//       useInRelease: true,
//       releaseAction: () => {
//         // release模式下执行该函数，一些用到runZone之类实现的可以放到这里，该值为空则会直接调用系统的runApp(MyApp())，
//       })
// };



//
// DoKit.runApp(app:DoKitApp(MyApp()),
// // 是否在release包内使用，默认release包会禁用
// useInRelease: true,
// releaseAction: () => {
// // release模式下执行该函数，一些用到runZone之类实现的可以放到这里，该值为空则会直接调用系统的runApp(MyApp())，
// })
// };
