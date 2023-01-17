
class ContractQuery {
  int pageSize;
  int pageNumber;
  String projectId;

  ContractQuery({this.pageSize = 1000, required this.pageNumber, this.projectId = ''});
}
