
class ProjectQuery {
  int pageSize;
  int pageNumber;
  int type;

  ProjectQuery({this.pageSize = 1000, required this.pageNumber, this.type = 0});
}
