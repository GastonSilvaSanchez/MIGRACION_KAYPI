import 'package:flutter/material.dart';
import  'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:puntosestaticos_mapa/bloc/mapa/mapa_bloc.dart';
import 'package:puntosestaticos_mapa/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:puntosestaticos_mapa/widgets/widgets.dart';

class MapaPage extends StatefulWidget {

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  //final _ubicacionBloc = new MiUbicacionBloc();

  @override
  void initState() {
    //context.bloc<MiUbicacionBloc>().
    //_ubicacionBloc.iniciarSeguimiento();
    BlocProvider.of<MiUbicacionBloc>(context).iniciarSeguimiento();
    super.initState();
  }

  @override
  void dispose() {
    //_ubicacionBloc.cancelarSeguimiento();
    BlocProvider.of<MiUbicacionBloc>(context).cancelarSeguimiento();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<MiUbicacionBloc, MiUbicacionState>(
            //bloc: _ubicacionBloc,
            builder: ( _ , state) => crearMapa(state)
          ),

          Positioned(
            top: 15,
            child: SearchBar(),
          ),
          MarcadorManual()

        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          BtnUbicacion(),
          BtnMiRuta(),
          BtnSeguirUbicacion()

        ],
      ),

   );
  }

  Widget crearMapa(MiUbicacionState  state) {
    if(!state.existeUbicacion ) return Text('buscadoo');
    
    final mapaBloc =  BlocProvider.of<MapaBloc>(context);

    mapaBloc.add(OnNuevaUbicacion(state.ubicacion as LatLng));
   
    final CameraPosition camaraInicio = CameraPosition(
    target: state.ubicacion as LatLng,
    zoom: 15,
  );
    

   return BlocBuilder<MapaBloc, MapaState>(
     builder: (context, state) {
       return GoogleMap(
        
        initialCameraPosition: camaraInicio,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) => {
          mapaBloc.initMap(controller)
        },
        polylines: mapaBloc.state.polylines.values.toSet(),
        onCameraMove: ( cameraPosition ) {
            // cameraPosition.target = LatLng central del mapa
            mapaBloc.add( OnMovioMapa( cameraPosition.target ));
          },
        
        
      );
  
     },
   ); 

    
}

}