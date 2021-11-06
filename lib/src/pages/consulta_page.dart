import 'package:flutter/material.dart';



class ConsultaPage extends StatefulWidget {
  @override
  _ConsultaPageState createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
  
  String _nombreMascota = '';
  String _duenio = '';
  String _telefono = '';
  String _optRaza = 'Koker';
  String _optSexo = 'Macho';
  String _edadMascota = '';
  String _tipoMastoca = 'Perro';
  String _fecha  = '';

  List ListaMascotas = [];

  List<String> _razas = ['Pastor Aleman', 'Bulldog', 'Koker', 'Labrador', 'Mestizo', 'Otros'];
  List<String> _sexos = ['Macho', 'Hembra'];
  List<String> _tiposMascota = ['Perro', 'Gato', 'Hámsters', 'Pájaros', 'Peces'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examen Parcial'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNombreMascota(),
          Divider(),
          _crearNombrePersona(),
          Divider(),
          _crearTelefonoPersona(),
          Divider(),
          _crearDropdownRaza(),
          Divider(),
          _crearDropdownSexo(),
          Divider(),
          _crearEdadMascota(),
          Divider(),
          _crearDropdownTipo(),
          Divider(),
          _crearFecha( context ),
        ],
      ),
      floatingActionButton: _crearBoton()
    );
  }

  Widget _crearNombreMascota() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Nombre de la mascota',
        labelText: 'Nombre de la mascota',
        suffixIcon: Icon( Icons.pets ),
      ),
      onChanged: (valor){
        setState(() {
          _nombreMascota = valor;
        });
      },
    );

  }
  
  Widget _crearNombrePersona() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Nombre del dueño',
        labelText: 'Nombre del dueño',
        suffixIcon: Icon( Icons.person ),
      ),
      onChanged: (valor){
        setState(() {
          _duenio = valor;
        });
      },
    );

  }

  Widget _crearTelefonoPersona() {

    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Teléfono',
        labelText: 'Teléfono',
        suffixIcon: Icon( Icons.phone ),
      ),
      onChanged: (valor){
        setState(() {
          _telefono = valor;
        });
      },
    );

  }

  Widget _crearEdadMascota() {

    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Edad de la mascota',
        labelText: 'Edad de la mascota',
        suffixIcon: Icon( Icons.pets ),
      ),
      onChanged: (valor){
        setState(() {
          _edadMascota = valor;
        });
      },
    );

  }


  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _razas.forEach( (raza){

      lista.add( DropdownMenuItem(
        child: Text(raza),
        value: raza,
      ));

    });

    return lista;

  }

  Widget _crearDropdownRaza() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),   
        Expanded(
          child: DropdownButton(
            value: _optRaza,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _optRaza = opt;
              });
            },
          ),
        )

      ],
    );
  }

  List<DropdownMenuItem<String>> getSexoDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _sexos.forEach( (sexo){

      lista.add( DropdownMenuItem(
        child: Text(sexo),
        value: sexo,
      ));

    });

    return lista;

  }

  Widget _crearDropdownSexo() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),   
        Expanded(
          child: DropdownButton(
            value: _optSexo,
            items: getSexoDropdown(),
            onChanged: (opt) {
              setState(() {
                _optSexo = opt;
              });
            },
          ),
        )

      ],
    );
  }
  
  List<DropdownMenuItem<String>> getTipoDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _tiposMascota.forEach( (tipo){

      lista.add( DropdownMenuItem(
        child: Text(tipo),
        value: tipo,
      ));

    });

    return lista;

  }

  Widget _crearDropdownTipo() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),   
        Expanded(
          child: DropdownButton(
            value: _tipoMastoca,
            items: getTipoDropdown(),
            onChanged: (opt) {
              setState(() {
                _tipoMastoca = opt;
              });
            },
          ),
        )

      ],
    );
  }
  
  Widget _crearFecha( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento mascota',
        labelText: 'Fecha de nacimiento mascota',
        suffixIcon: Icon( Icons.calendar_today )
      ),
      onTap: (){ 

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
    );

  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
          _fecha = picked.toString();
          _inputFieldDateController.text = _fecha;
      }); 
    }

  }

  Widget _crearBoton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30),
        FloatingActionButton(onPressed: _crearMascota, child: Icon(Icons.add),),
      ],
    );
  }
  
  _crearMascota() {

    Map<String, dynamic> mascota = {
      'nombreMascota': _nombreMascota,
      'nombrePersona': _duenio,
      'telefono': _telefono,
      'raza': _optRaza,
      'sexo': _optSexo,
      'edadMascota': _edadMascota,
      'tipoMascota': _tipoMastoca,
      'nacimiento': _fecha
    };

    ListaMascotas.add(mascota);

    print('---------------------Miremos el Map-------------------');
    print(mascota);
    
    print('---------------------Mascotas-------------------');
    print(ListaMascotas);

    // return ListTile(
    //   title: Text('Nombre es: $_nombre'),
    //   subtitle: Text('Email: $_email'),
    //   trailing: Text(_opcionSeleccionada),
    // );

  }

}