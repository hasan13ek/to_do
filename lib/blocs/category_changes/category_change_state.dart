abstract class CategoryChangeState{}



class Initial extends CategoryChangeState{}

class LoadInSuccess extends CategoryChangeState{
  int index;
  LoadInSuccess({required this.index});
}