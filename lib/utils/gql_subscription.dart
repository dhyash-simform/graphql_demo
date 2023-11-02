class GqlSubscription {
  static const String liftStatusChange = '''
  subscription {
     liftStatusChange{
      id
      name
      status
    }
  }
  ''';
}
