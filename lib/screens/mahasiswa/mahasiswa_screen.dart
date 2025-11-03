import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_riverpod/providers/mahasiswa_provider.dart';

class MahasiswaScreen extends ConsumerWidget {
  const MahasiswaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaController = ref.watch(MahasiswaProvider);

    return StreamBuilder<List<DocumentSnapshot>>(
      stream: ref.read(MahasiswaProvider.notifier).streamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var listAllDocs = snapshot.data ?? [];
          return listAllDocs.isNotEmpty
              ? ListView.builder(
                itemCount: listAllDocs.length,
                itemBuilder:
                    (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Color.fromARGB(255, 248, 248, 248),
                      ),
                      title: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}",
                      ),
                      subtitle: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["npm"]}",
                      ),
                      trailing: IconButton(
                        onPressed: () {},

                        icon: Icon(Icons.more_vert),
                      ),
                    ),
              )
              : Center(child: Text("Data Kosong"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
