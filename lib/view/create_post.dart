import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              const Gap(60),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: Card(
                    shadowColor: Colors.black54,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://themeskills.com/wp-content/uploads/2015/07/pinned-sticky-post.png'))),
              ),
              const Gap(20),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Enter a Description'),
              ),
              const Gap(20),
              ElevatedButton(onPressed: () {}, child: const Text('Post'))
            ],
          ),
        ),
      ),
    );
  }
}
