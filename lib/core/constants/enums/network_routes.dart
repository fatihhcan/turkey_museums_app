enum NetWorkRoutes {
  MUSEUM,
}

extension NetworkRoutesString on NetWorkRoutes {
  String get value {
    switch (this) {
      case NetWorkRoutes.MUSEUM:
        return 'getMuseum?';
      default:
        throw Exception('Route not found');
    }
  }
}
