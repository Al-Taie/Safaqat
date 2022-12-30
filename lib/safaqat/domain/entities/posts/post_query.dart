
class PostQuery {
  int pageSize;
  int pageNumber;
  int type;

  PostQuery({this.pageSize = 1000, required this.pageNumber, this.type = 0});
}
