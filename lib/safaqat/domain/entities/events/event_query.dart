
class EventQuery {
  int pageSize;
  int pageNumber;
  int type;

  EventQuery({this.pageSize = 1000, required this.pageNumber, this.type = 0});
}
