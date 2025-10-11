import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/specializations_response_model.dart';
import '../../../logic/home_cubit.dart';
import 'speciality_list_view_item.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({super.key, required this.specializationsDataList});

  final List<SpecializationsData?> specializationsDataList;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationId: selectedIndex + 1,
              );
            },
            child: SpecialityListViewItem(
              itemIndex: index,
              specialization: widget.specializationsDataList[index],
              selectedIndex: selectedIndex,
            ),
          );
        },
      ),
    );
  }
}
