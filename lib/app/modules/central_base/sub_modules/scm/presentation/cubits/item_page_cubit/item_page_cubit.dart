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

class ItemLoadingState implements ItemPageStates {
  const ItemLoadingState();
}

class ItemCostState implements ItemPageStates {
  const ItemCostState();
}

class ItemSaleState implements ItemPageStates {
  const ItemSaleState();
}

class ItemPageCubit extends Cubit<ItemPageStates> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  double costPrice = 0.0;
  double salePrice = 0.0;

  ItemPageCubit() : super(ItemInitial());

  void fetchDocuments() {
    firestore.collection('itens_premier').snapshots().listen((snapshot) {
      final documents = snapshot.docs;

      // Atualize o estado do cubit com o estado ItemLoaded contendo a lista de documentos
      emit(ItemLoaded(documents));
    });
  }

  void deleteDocument(String documentId) {
    firestore.collection('itens_premier').doc(documentId).delete();
  }

  void updateDocument(String documentId, Map<String, dynamic> data) {
    firestore.collection('itens_premier').doc(documentId).update(data);
  }

  void addDocument(Map<String, dynamic> data) {
    firestore.collection('itens_premier').add(data);
  }

  void searchDocuments(String search) {
    firestore.collection('itens_premier').where('nome', isGreaterThanOrEqualTo: search).snapshots().listen((snapshot) {
      final documents = snapshot.docs;

      // Atualize o estado do cubit com o estado ItemLoaded contendo a lista de documentos
      emit(ItemLoaded(documents));
    });
  }

  void searchDocumentsByCarrier(String search) {
    firestore.collection('itens_premier').where('carrier', isEqualTo: search).snapshots().listen((snapshot) {
      final documents = snapshot.docs;
      emit(ItemLoaded(documents));
    });
  }

  void calculateCostPrice({required String purchase, required String margin}) {
    emit(const ItemLoadingState());
    final double purchasePrice = double.parse(purchase);
    final double marginCostPrice = double.parse(margin);
    costPrice = purchasePrice + (purchasePrice * (marginCostPrice / 100));
    emit(const ItemCostState());
  }

  void calculateSalePrice({required String sale, required String margin}) {
    emit(const ItemLoadingState());
    final double costPrice = double.parse(sale);
    final double marginProfit = double.parse(margin);
    salePrice = costPrice + (costPrice * (marginProfit / 100));
    emit(const ItemCostState());
  }
}
