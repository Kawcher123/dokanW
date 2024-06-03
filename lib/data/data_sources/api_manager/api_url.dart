
class ApiUrl {
  static  String baseUrl = '';
  static  String getRepoList({int page=1, String sort='stars'}) => '${baseUrl}search/repositories?q=Flutter&page=$page&per_page=10&sort=$sort';
}
