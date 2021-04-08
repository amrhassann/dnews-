// child: Row(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//     Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15),
//       child: Expanded(
//         child: CircleAvatar(
//           radius: 65,
//           backgroundImage: (articles[position]
//                       .urlToImage) !=
//                   null
//               ? NetworkImage(
//                   articles[position].urlToImage)
//               : NetworkImage(
//                   'https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg'),
//           backgroundColor: Colors.transparent,
//         ),
//
//         // child: (articles[position].urlToImage) != null
//         //     ? SizedBox(
//         //         width: 190,
//         //         height: 190,
//         //         child: Image.network(
//         //             articles[position].urlToImage),
//         //       )
//         //     : SizedBox(
//         //         width: 90,
//         //         height: 90,
//         //         child: Image.network(
//         //             'Image.network(articles[position].urlToImage),'),
//         //       ),
//       ),
//     ),
//
//     // child: CircleAvatar(
//     //   radius: 60,
//     //   backgroundImage: (articles[position]
//     //               .urlToImage) !=
//     //           null
//     //       ? NetworkImage(
//     //           articles[position].urlToImage)
//     //       : NetworkImage(
//     //           'https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg'),
//     //   backgroundColor: Colors.transparent,
//     // ),
//
//     Expanded(
//         child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15),
//       child: Column(
//         mainAxisAlignment:
//             MainAxisAlignment.spaceAround,
//         children: [
//           Text(articles[position].name),
//           (articles[position].description) != null
//               ? Text(articles[position].description)
//               : Text('we have toting to put in here'),
//           (articles[position].publishedAt) != null
//               ? Text(articles[position].publishedAt)
//               : Text('time is not available')
//         ],
//       ),
//     )),
//   ],
// ),






// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// RaisedButton(
// child: Text('sports'),
// onPressed: (){
// Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen(topSelected:'sports' ,)));
// },
// )
// ],
// )
// ),



