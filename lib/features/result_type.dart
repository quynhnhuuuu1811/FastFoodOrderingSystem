sealed class Result<T> {
}
class Success<T>extends Result<T>{
  Success(this.data);
  final T data;
}
class Failed<T> extends Result<T>{
  Failed(this.message);
  final String message;
}