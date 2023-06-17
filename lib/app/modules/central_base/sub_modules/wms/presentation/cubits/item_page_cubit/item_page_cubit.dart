import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemPageStates {
  const ItemPageStates();
}

class ItemInitial implements ItemPageStates {}

class ItemLoaded implements ItemPageStates {
  final List<QueryDocumentSnapshot> documents;

  const ItemLoaded(this.documents);
}

class ItemPageCubit extends Cubit<ItemPageStates> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ItemPageCubit() : super(ItemInitial());

  void fetchDocuments() {
    firestore.collection('itens_premier').snapshots().listen((snapshot) {
      final documents = snapshot.docs;

      // Atualize o estado do cubit com o estado ItemLoaded contendo a lista de documentos
      emit(ItemLoaded(documents));
    });
  }
}
