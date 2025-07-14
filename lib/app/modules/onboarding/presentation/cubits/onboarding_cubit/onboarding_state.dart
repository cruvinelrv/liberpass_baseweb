class OnboardingState {
  final String nome;
  final String email;
  final String senha;
  final String cidadeOrigem;
  final String cidadeDestino;
  final String? objetivo;
  final String? error;

  OnboardingState({
    this.nome = '',
    this.email = '',
    this.senha = '',
    this.cidadeOrigem = '',
    this.cidadeDestino = '',
    this.objetivo,
    this.error,
  });

  OnboardingState copyWith({
    String? nome,
    String? email,
    String? senha,
    String? cidadeOrigem,
    String? cidadeDestino,
    String? objetivo,
    String? error,
  }) {
    return OnboardingState(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      cidadeOrigem: cidadeOrigem ?? this.cidadeOrigem,
      cidadeDestino: cidadeDestino ?? this.cidadeDestino,
      objetivo: objetivo ?? this.objetivo,
      error: error,
    );
  }
}
