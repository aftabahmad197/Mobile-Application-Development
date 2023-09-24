import 'package:flutter/material.dart';

class ImagesAndIcons extends StatefulWidget {
  const ImagesAndIcons({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ImagesAndIcons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ContainerWithImage(),
            const Divider(),
            const ContainerWithDecorator(),
            const Divider(),
            ContainerWithTextField(),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

// Image
class ContainerWithImage extends StatelessWidget {
  const ContainerWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: AssetImage('asset/images/home.png'),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        ),
        Image(
          image: const AssetImage("asset/images/flutter.jfif"),
          width: MediaQuery.of(context).size.width / 3,
        ),
        const Icon(
          Icons.brush,
          color: Colors.lightBlue,
          size: 48.0,
        )
      ],
    );
  }
}

//Decorator
class ContainerWithDecorator extends StatelessWidget {
  const ContainerWithDecorator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
                color: Colors.grey, blurRadius: 10.0, offset: Offset(0, 10.0))
          ]),
    );
  }
}

class ContainerWithTextField extends StatelessWidget {
  const ContainerWithTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 10.0,
            ),
            decoration: const InputDecoration(
              labelText: 'Notes',
              labelStyle: TextStyle(color: Colors.purple, fontSize: 20.0),
              border: OutlineInputBorder(),
            ),
          ),
          const Padding(padding:
          EdgeInsets.all(10.0)),
          TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 10.0,
            ),
            decoration: const InputDecoration(
              labelText: 'Enter Your Name :',
              labelStyle: TextStyle(color: Colors.purple, fontSize: 20.0),
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
