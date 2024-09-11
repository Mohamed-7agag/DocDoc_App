import 'package:dartz/dartz.dart';
import 'package:doctors_app/core/errors/failure.dart';

import '../models/specialiazation_model/specialization_model.dart';

abstract class SpecializationRepo {
  Future<Either<Failure, SpecializationModel>> getSpecializationList();
}
