import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail_page.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  //final _formKey = GlobalKey<FormState>();
  final _namaPasienCtrl = TextEditingController();
  final _noPasienCtrl = TextEditingController();
  final _tgllhrPasienCtrl = TextEditingController();
  final _telpPasienCtrl = TextEditingController();
  final _emailPasienCtrl = TextEditingController();
  final _passwordPasienCtrl = TextEditingController();

  void initState() {
    super.initState();
    setState(() {
      _namaPasienCtrl.text = widget.pasien.namaPasien;
      _noPasienCtrl.text = widget.pasien.noPasien;
      _tgllhrPasienCtrl.text = widget.pasien.tgllhrPasien;
      _telpPasienCtrl.text = widget.pasien.telpPasien;
      _emailPasienCtrl.text = widget.pasien.emailPasien;
      _passwordPasienCtrl.text = widget.pasien.passwordPasien;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ubah Pasien")),
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          children: [
            _fieldNoPasien(),
            _fieldNamaPasien(),
            _fieldTglLhrPasien(),
            _fieldTelpPasien(),
            _fieldEmailPasien(),
            _fieldPasswordPasien(),
            SizedBox(height: 20),
            _tombolUbah()
          ],
        )),
      ),
    );
  }

  _fieldNoPasien() {
    return TextField(
      decoration: InputDecoration(labelText: "NO Pasien"),
      controller: _noPasienCtrl,
    );
  }

  _fieldNamaPasien() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama Pasien"),
      controller: _namaPasienCtrl,
    );
  }

  _fieldTglLhrPasien() {
    return TextField(
      decoration: InputDecoration(labelText: "Tgl Lahir Pasien"),
      controller: _tgllhrPasienCtrl,
    );
  }

  _fieldTelpPasien() {
    return TextField(
      decoration: InputDecoration(labelText: "Telp Pasien"),
      controller: _telpPasienCtrl,
    );
  }

  _fieldEmailPasien() {
    return TextField(
      decoration: InputDecoration(labelText: "Email Pasien"),
      controller: _emailPasienCtrl,
    );
  }

  _fieldPasswordPasien() {
    return TextField(
      decoration: InputDecoration(labelText: "Password Pasien"),
      controller: _passwordPasienCtrl,
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Pasien pasien = Pasien(
              namaPasien: _namaPasienCtrl.text,
              noPasien: _noPasienCtrl.text,
              tgllhrPasien: _tgllhrPasienCtrl.text,
              telpPasien: _telpPasienCtrl.text,
              emailPasien: _emailPasienCtrl.text,
              passwordPasien: _passwordPasienCtrl.text);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PasienDetailPage(pasien: pasien)));
        },
        child: Text("Ubah"));
  }
}
