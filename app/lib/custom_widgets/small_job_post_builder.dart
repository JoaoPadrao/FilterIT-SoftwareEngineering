import 'package:flutter/material.dart';
import 'package:filter_it/data_models/job_post.dart';
import 'package:filter_it/custom_widgets/big_job_post_builder.dart';

class SmallJobPostBuilder extends StatelessWidget {
  final JobPost jobPost;
  final int index;

  const SmallJobPostBuilder({
    Key? key,
    required this.jobPost,
    required this.index,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arrowIconKey = Key('arrowIcon_$index');

    return ListTile(
      leading: Image.network(
        jobPost.company.logoURL.isNotEmpty
            ? jobPost.company.logoURL
            : 'https://static.itjobs.pt/images/logo.png',
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      ),
      title: Text(jobPost.jobTitle),
      subtitle: Text(jobPost.company.companyName),
      trailing: IconButton(
        key: arrowIconKey,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BigJobPostBuilder(jobPost: jobPost),
            ),
          );
        },
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

