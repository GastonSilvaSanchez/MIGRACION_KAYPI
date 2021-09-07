import { Component, OnInit } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToolsService } from '../services/Tools/tools.service';

@Component({
  selector: 'app-strategic-point-information',
  templateUrl: './strategic-point-information.page.html',
  styleUrls: ['./strategic-point-information.page.scss'],
})
export class StrategicPointInformationPage implements OnInit {

  point: any = {Calles: []};
  config: any;
  nameData: string = "PuntosEstrategicos";

  constructor(private servicio: KaypiServices,
    private configuration: ConfigurationService,
    private activatesRouter: ActivatedRoute,
    private router: Router,
    private toolServices: ToolsService) { }

  ngOnInit() {
    this.getConfiguration();
    this.getPoint(this.activatesRouter.snapshot.params.namePoint);
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  async getPoint(value) {
    await this.toolServices.showStaticLoading();
    this.servicio.getOnData(this.config.pathsData.pathStrategicPoints, this.nameData, value, "Nombre").then(data => {
      this.point = data;
      this.toolServices.closeStaticLoading();
    }).catch(error => {
      this.toolServices.closeStaticLoading();
    });
  }

  showPoint() {
    var data = { name: this.nameData, type: "one", value: this.point.Nombre, field: "Nombre"};
    this.router.navigate(['location/', JSON.stringify(data)]);
  }

  showLines() {
    var data = { name: "Lineas", point: this.point.Punto };
    this.router.navigate(['location/', JSON.stringify(data)]);
  }
}
