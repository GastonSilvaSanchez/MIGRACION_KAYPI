import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../services/Configuracion/configuration.service';

@Component({
  selector: 'app-about',
  templateUrl: './about.page.html',
  styleUrls: ['./about.page.scss'],
})
export class AboutPage implements OnInit {

  config: any;

  constructor(private configuration: ConfigurationService) { }

  ngOnInit() {
    this.getConfiguration();
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }
}
