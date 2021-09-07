import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { DatabaseService } from '../services/DataBase/database.service';

@Component({
  selector: 'app-configuration',
  templateUrl: './configuration.page.html',
  styleUrls: ['./configuration.page.scss']
})
export class ConfigurationPage implements OnInit {
  language: string;
  style: string;
  config: any;
  languages = [
    { nombre: 'Castellano', valor: 'es' },
    { nombre: 'Ingles', valor: 'en' },
    { nombre: 'Portugues', valor: 'pt' }
  ];

  styles = [
    { nombre: 'Kaypi', valor: 'cbba' },
    { nombre: 'Univalle', valor: 'univalle' },
    { nombre: 'Oscuro', valor: 'dark' },
    { nombre: 'Rojo', valor: 'danger' },
    { nombre: 'Verde', valor: 'success' },
    { nombre: 'Amarillo', valor: 'warning' }
  ];

  update: boolean;
  univalle: boolean;

  constructor(
    private configuration: ConfigurationService,
    private dataBaseServices: DatabaseService
  ) {}

  ngOnInit() {
    this.getConfiguration();
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
    this.getStyle();
    this.getLanguage();
  }

  getStyle() {
    this.style = this.styles.filter(sty => {
      return sty.valor === this.config.styleApp;
    })[0].valor;
  }

  getLanguage() {
    this.language = this.languages.filter(lang => {
      return lang.valor === this.config.lenguageDefault;
    })[0].valor;
  }

  setLanguage(lang) {
    this.configuration.setLanguage(lang);
    this.setConfigDataBase();
  }

  setStyle(sty) {
    this.configuration.setConfig('styleApp', sty);
    this.setConfigDataBase();
  }

  setConfigDataBase() {
    try {
      const config = {
        idioma: this.configuration.config.lenguageDefault,
        actualizacion: this.update ? 1 : 0,
        tema: this.configuration.config.styleApp
      };
      this.configuration.config.updateData = this.update ? 1 : 0;
      this.dataBaseServices
        .updateConfig(config)
        .catch(error => console.error(error));
    } catch (err) {}
  }
}
