import 'package:flutter_app/Classes/institute.dart';
import 'package:flutter_app/Models/manage_institute_model.dart';

class ViewUsageInstituteModel {

  Future<List<Institute>> getData() async
  {
    ManageInstituteModel model = ManageInstituteModel();
    return await model.getData();
  }

}
