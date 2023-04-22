import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/blocs/category_changes/category_change_event.dart';
import 'package:to_do/blocs/category_changes/category_change_state.dart';

class CategoryChangeBloc extends Bloc<CategoryChangeEvent,CategoryChangeState>{
  CategoryChangeBloc():super(Initial()){
    on<AddIndex>(addIndex);
  }



  addIndex(AddIndex event,Emitter<CategoryChangeState> emit)async{
    int newIndex = event.newIndex;
    emit(LoadInSuccess(index: newIndex));
  }

}