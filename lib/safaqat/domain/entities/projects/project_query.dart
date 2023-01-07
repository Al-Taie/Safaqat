
class ProjectQuery {
  int pageSize;
  int pageNumber;
  int convener;

  ProjectQuery({this.pageSize = 1000, required this.pageNumber, this.convener = 0});
}
