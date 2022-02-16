
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();

}

class _EditPageState extends State<EditPage> {

  final ImagePicker _picker = ImagePicker();
  late PickedFile _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFABBBB),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
              Padding( padding:EdgeInsets.only(right: 40))
            ],
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              //obscureText: true,
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            Container(
              //child: _image == null ? Text('No Image') : Image.asset(_image.path),
              //child: _image == null ? Text('No Image') : Image.file(File(_image.path)),
            ),
            IconButton(
              onPressed: _getImage,
              icon: Icon(Icons.camera_alt_outlined),
            ),
            TextField(
              //obscureText: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                labelText: 'Contents',
              ),
            ),
        ]),
      ),
      bottomNavigationBar: Row(
        children: const <Widget>[],
      ),
    );
  }
  Future _getImage() async{
    PickedFile image = (await _picker.pickImage(source: ImageSource.gallery,
    )) as PickedFile;
    setState(() {
      _image = image;
    });
  }


}
