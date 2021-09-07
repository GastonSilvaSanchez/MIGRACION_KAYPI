import { Component, OnInit } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { Router } from '@angular/router';
import { ToolsService } from '../services/Tools/tools.service';

@Component({
  selector: 'app-radio-taxi',
  templateUrl: './radio-taxi.page.html',
  styleUrls: ['./radio-taxi.page.scss']
})
export class RadioTaxiPage implements OnInit {
  taxis: any;
  config: any;
  nameData: string = 'RadioMoviles';
  visibleTaxis: Array<any>;
  textoSearcher: string = this.toolServices.translateValue(
    'RadioMoviles.Buscar'
  );

  constructor(
    private servicio: KaypiServices,
    private configuration: ConfigurationService,
    private router: Router,
    private toolServices: ToolsService
  ) {}

  ngOnInit() {
    this.getConfiguration();
    this.getPoints();
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  async getPoints() {
    await this.toolServices.showStaticLoading();
    this.servicio.getDataBaseServices(this.nameData).then(data => {
      this.taxis = data;
      this.visibleTaxis = this.taxis;
      this.toolServices.closeStaticLoading();
    }).catch(error => {
      this.toolServices.closeStaticLoading();
    });
  }

  showPoint(taxi) {
    var data = {
      name: this.nameData,
      type: 'one',
      value: taxi.Nombre,
      field: 'Nombre'
    };
    this.router.navigate(['location/', JSON.stringify(data)]);
  }

  showAll() {
    var data = {
      name: this.nameData,
      type: 'all',
      value: 'RadioMoviles',
    };
    this.router.navigate(['location/', JSON.stringify(data)]);
  }

  callNumber(number) {
    this.toolServices
      .callPhone(number)
      .then(data => {})
      .catch(err => console.error(err));
  }

  filterItems(event) {
    this.visibleTaxis = this.taxis;
    const valor = event.target.value;
    if (valor.trim() !== '') {
      this.visibleTaxis = this.visibleTaxis.filter(item => {
        return item.Nombre.toLowerCase().indexOf(valor.toLowerCase()) > -1;
      });
    }
  }
}
