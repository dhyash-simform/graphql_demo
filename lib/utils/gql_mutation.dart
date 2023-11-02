class GqlMutation {
  static const String setLiftStatus = r'''
   mutation SetMutation($id: ID!, $status: LiftStatus!) {
     setLiftStatus(id: $id, status: $status) {
       id
       name
       status
     }
   }
  ''';
}
