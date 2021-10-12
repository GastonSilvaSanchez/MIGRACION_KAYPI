part of 'busqueda_bloc.dart';

@immutable
class BusquedaState {
  final bool selecccionManual;

  BusquedaState({
    this.selecccionManual= false
  });

  BusquedaState copyWith({
    bool? seleccionManual
  }) => BusquedaState(
    selecccionManual: selecccionManual ?? this.selecccionManual
  );
}