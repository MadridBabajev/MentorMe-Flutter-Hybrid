enum LottieAnimation {
  loading(name: 'loading'),
  error(name: 'error');

  final String name;

  const LottieAnimation({
    required this.name,
  });
}
