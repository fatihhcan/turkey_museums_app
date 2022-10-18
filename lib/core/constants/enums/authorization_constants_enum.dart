
enum AuthorizationConstants { authorization, bearer }

extension AuthorizationConstantValues on AuthorizationConstants {
  String value({String? accessToken = 'zzBhiX0AhTxMkJYISQFXdIEsaOFeWJImulDXE69JNvBH7kFvrPHehsc0MvJS'}) {
    switch (this) {
      case AuthorizationConstants.authorization:
        return 'Authorization';
      case AuthorizationConstants.bearer:
        return 'bearer $accessToken';
      default:
        throw Exception('Argument not found');
    }
  }
}