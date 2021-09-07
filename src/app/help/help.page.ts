import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';

@Component({
  selector: 'app-help',
  templateUrl: './help.page.html',
  styleUrls: ['./help.page.scss'],
})
export class HelpPage implements OnInit {

  config: any;
  helps: any;
  nameData: string = "Ayudas";
  
  constructor(private configuration: ConfigurationService, private servicio: KaypiServices) { }

  ngOnInit() {
    this.getConfiguration();
    this.getHepls();
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  getHepls() {
    this.servicio.getDataServices(this.config.pathsData.pathHelps, this.nameData).then(data => {
      this.helps = data;
    });
  }
}
