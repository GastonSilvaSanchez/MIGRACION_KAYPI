import { Component, OnInit } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToolsService } from '../services/Tools/tools.service';

@Component({
  selector: 'app-line-information',
  templateUrl: './line-information.page.html',
  styleUrls: ['./line-information.page.scss'],
})
export class LineInformationPage implements OnInit {

  line: any = {Pasajes: [], Horarios: [], Calle: [], Telefonos: []};
  config: any;
  nameData: string = "Lineas";

  constructor(private servicio: KaypiServices, 
    private configuration: ConfigurationService, 
    private activatesRouter: ActivatedRoute,
    private router: Router,
    private toolServices: ToolsService) { }

  ngOnInit() {
    this.getConfiguration();
    this.getLine(this.activatesRouter.snapshot.params.nameLine);
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  async getLine(value) {
    await this.toolServices.showStaticLoading();
    this.servicio.getOnData(this.config.pathsData.pathLines, this.nameData, value, "Nombre").then(data => {
      this.line = data;
      this.toolServices.closeStaticLoading();
    }).catch(error => {
      this.toolServices.closeStaticLoading();
    });
  }

  showRoutes() {
    var data = { name: this.nameData, type: "one", value: this.line.Nombre, field: "Nombre"};
    this.router.navigate(['location/', JSON.stringify(data)]);
  }

  callNumber(number) {
    this.toolServices.callPhone(number).then(data => {
    }).catch(err => console.error(err));
  }
}
