enum RestMethod {
  get, post, patch, delete, put 
}
extension RequestMethodExt on RestMethod{
  String toStringMethot() {
    String str;
    switch (this) {
      case RestMethod.get:
        str = 'get'.toUpperCase();
        break;
      case RestMethod.post:
        str = 'post'.toUpperCase();
        break;
      case RestMethod.put:
        str = 'put'.toUpperCase();
        break;
      case RestMethod.delete:
        str = 'delete'.toUpperCase();
        break;
      case RestMethod.patch:
        str = 'patch'.toUpperCase();
        break;
    }
    return str;
  }
}