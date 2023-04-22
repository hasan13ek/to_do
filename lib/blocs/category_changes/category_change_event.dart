abstract class CategoryChangeEvent {}


class AddIndex extends CategoryChangeEvent{
  int newIndex;
  AddIndex({required this.newIndex});
}