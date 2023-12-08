# graphql_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tasks:

- GraphQLClient:
  - It's used to connect GraphQL Server.
  - There 2 parameters which is required by GraphQLClient. --> Link, Cache
  - Link: There are different types of Link is provided by package. 
    - Most commonly used Link is HttpLink. 
    - Also if you want to pass any auth token during request you can pass it with AuthLink Class. 
    - it's also support Dio. 
    - HttpLink takes URL and headers.
  - Cache: For cache there is one class for is called GraphQLCache.
    - They take one store. There are two store are available.
    - By default it takes InMemoryCache (which is NOT persist to disk). 
    - Otherwise you may use Hive DB as Caching.
- GraphQLProvider:
  - As name suggest it's used for providing client to all decedents.
  - Like Query, Mutation, Subscription Widgets.
  - if our app  using one client for all query & mutations. then it's good to wrap it with MaterialApp.
- Query:
  - Query Widget takes two required parameters. --> QueryOptions options, QueryBuilder builder. 
  - QueryOptions:
    - In `document:` here we have to provide our query as Document Node. 
    - if query has any variables which required to during processing query. 
    - then that variables are goes into `variables` in Key, Value Pair. 
    - also if we want to convert JSON response into desired format than we can define in it in `parserFn`. 
    - in case if multiple operations are defined in single query. 
    - and we want to perform single query out of them than we have to define particular query name in `operationName`.
  - QueryBuilder:
    - here builder gives us result, fetchMore, refetch. 
    - result provide us the response was received from server after firing query. 
    - it also provide necessary information like isLoading, hasException, etc. 
    - fetchMore is used for pagination purpose. 
    - refetch is used for refetching the current data or kind of like refreshing page in web.
- Mutation:
  - Mutation Widget takes two required parameters. --> MutationOptions options, MutationBuilder builder.
  - MutationOptions:
    - In `document:` here we have to provide our mutation query as Document Node. 
    - if query has any variables which required to during processing query. 
    - then that variables are goes into `variables` in Key, Value Pair. 
    - in case if multiple operations are defined in single query. 
    - and we want to perform single mutation out of them than we have to define particular query name in `operationName`. 
    - Also `optimisticResult` is allow us to locally predict the result of a mutation before it's confirmed by the server. 
    - And also for updating the UI immediately and later syncing with the server's response.
    - `update` this is used for update the cache based on results.
    - `onCompleted` provide us the the response/result after performing mutation.
  - MutationBuilder:
    - here builder gives us RunMutation runMutation, QueryResult result.
    - result provide us the response was received from server after firing mutation query.
    - it also provide necessary information like isLoading, hasException, etc.
    - runMutation is used for firing mutation query. 
    - And here we can pass the dynamic values for during firing mutation query.
- GraphQL Consumer:
  - This widget is used when we have to use the client directly. 
  - Let's say for example you want to perform some operations like query, mutations from client or updating cache data.
- 
