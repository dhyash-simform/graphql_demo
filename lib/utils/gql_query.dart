class GqlQuery {
  // TODO(Un-Task-1): Define performing query here ex. character
  static String character = r'''
     query MyQuery($charId: ID!) {
       character(id: $charId) {
         created
         id
         image
         name
         species
         status
         gender
       }
     }
   ''';

  // TODO(Task-3): Define performing query here ex. characters
  static String characters = r'''
    query MyQuery($page: Int!) {
      characters(page: $page) {
        info {
          count
          next
          prev
          pages
        }
        results {
          id
          image
          name
        }
      }
    }
   ''';

  static String lifts = r'''
  query MyQuery($status: LiftStatus) {  
    allLifts(status : $status) {
      id
      name      
      status      
      night      
    } 
  }
  ''';
}
