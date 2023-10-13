import 'package:dartz/dartz.dart';
import 'package:repasse_anou/failures/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;
