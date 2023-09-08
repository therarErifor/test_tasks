class Resp <TData>{
  final TData? data;
  final Object? error;

  Resp(this.data, this.error);

  factory Resp.fromError(Object error) => Resp(null, error);

  factory Resp.fromData(TData data) => Resp(data, null);

  bool get isSuccessTheResp{
    return error == null;
  }
}