import 'package:flutter/material.dart';

import '../../data/models/specializations_response_model.dart';
import 'speciality_list_view_item.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({
    super.key,
    required this.specializationsDataList,
  });

  final List<SpecializationsData?> specializationsDataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsDataList.length,
        itemBuilder: (context, index) {
          return SpecialityListViewItem(
            specializationIndex: index,
            specialization: specializationsDataList[index],
          );
        },
      ),
    );
  }
}
