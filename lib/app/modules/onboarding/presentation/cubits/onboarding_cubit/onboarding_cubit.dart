import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());

  void updateNome(String nome) => emit(state.copyWith(nome: nome));
  void updateEmail(String email) => emit(state.copyWith(email: email));
  void updateSenha(String senha) => emit(state.copyWith(senha: senha));
  void updateCidadeOrigem(String cidade) => emit(state.copyWith(cidadeOrigem: cidade));
  void updateCidadeDestino(String cidade) => emit(state.copyWith(cidadeDestino: cidade));
  void updateObjetivo(String objetivo) => emit(state.copyWith(objetivo: objetivo));

  Future<void> criarUsuarioNoFirebase() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.email,
        password: state.senha,
      );
      emit(state.copyWith(error: null));
      await salvarDadosNoFirestore();
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> salvarDadosNoFirestore() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;
      await FirebaseFirestore.instance.collection('pessoas').doc(user.uid).set({
        'nome': state.nome,
        'email': state.email,
        'cidadeOrigem': state.cidadeOrigem,
        'cidadeDestino': state.cidadeDestino,
        'objetivo': state.objetivo,
        'uid': user.uid,
        'criadoEm': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      // Opcional: tratar erro de gravação no Firestore
    }
  }
}
