import { Component, OnInit } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-parking-modal',
  templateUrl: './parking-modal.page.html',
  styleUrls: ['./parking-modal.page.scss']
})
export class ParkingModalPage implements OnInit {
  config: any;
  nameData: string = 'Parqueos';
  parkings: any = [];

  constructor(
    private servicio: KaypiServices,
    private configuration: ConfigurationService,
    private router: Router
  ) {}

  ngOnInit() {
    this.getConfiguration();
    this.getParkings();
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  getParkings() {
    this.servicio.getDataBaseServices(this.nameData).then(data => {
      this.parkings = data;
    });
  }

  showParqueos() {
    const data = { name: 'Parqueos' };
    this.router.navigate(['location/', JSON.stringify(data)]);
  }

  hayParqueos(parqueoCategoria) {
    return parqueoCategoria.parqueos.length > 0;
  }

  mostrarDetalles(parqueoCategoria) {
    parqueoCategoria.Expandido = !parqueoCategoria.Expandido;
  }
}
