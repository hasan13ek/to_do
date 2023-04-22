import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do/blocs/todo/todo_bloc.dart';
import 'package:to_do/blocs/todo/todo_event.dart';
import 'package:to_do/data/models/fake_model.dart';
import 'package:to_do/screens/single_category_page.dart';
import 'package:to_do/widgets/category_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 8.r,
          right: 8.r,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.82,
            crossAxisSpacing: 0,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: 6,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, int index) {
            return ZoomTapAnimation(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 26.r,
                  left: 12.r,
                  right: 12.r,
                ),
                child: CategoryItemWidget(
                  imageUrl: FakeModel.images[index],
                  categoryName: FakeModel.categories[index],
                  color: FakeModel.colorsTwo[index],
                ),
              ),
              onTap: () {
                BlocProvider.of<TodoBloc>(context).add(GetSingleTaskById(category: FakeModel.categories[index]));
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SingleCategoryScreen()));
              },
            );
          },
        ),
      ),
    );
  }
}
