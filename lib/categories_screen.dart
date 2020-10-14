import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        padding:  const EdgeInsets.all(25),   //const로 하는 이유가 뭐야?
        //Sliver 는 스크롤 가능한
        //GridDelegate 는 Grid 레이아웃 제공
        //MaxCrossAxisExtent 는 각 그리드 항목에 최대 너비 설정
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // 화면의 크기가 400보다 크면 2개이상씩, 작으면 1개씩 그리드!!
          childAspectRatio: 3 / 2, // 3x2 비율의 각 그리드
          crossAxisSpacing: 20,     //그리드간 가로 간격 공백
          mainAxisSpacing: 20,      //그리드간 세로 간격 공백
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
            catData.id,
            catData.title,
            catData.color,
          ),
        )
            .toList(),
      ),
    );
  }
}
