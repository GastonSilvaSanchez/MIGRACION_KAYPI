import { Component, OnInit } from '@angular/core';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ToolsService } from '../services/Tools/tools.service';

@Component({
  selector: 'app-directories',
  templateUrl: './directories.page.html',
  styleUrls: ['./directories.page.scss']
})
export class DirectoriesPage implements OnInit {
  config: any;
  directories: any;
  nameData = 'Directorios';
  visibleList: Array<any>;

  constructor(
    private configuration: ConfigurationService,
    private servicio: KaypiServices,
    private toolServices: ToolsService
  ) {}

  ngOnInit() {
    this.getConfiguration();
    this.getDirectories();
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  async getDirectories() {
    await this.toolServices.showStaticLoading();
    this.servicio
      .getDataBaseServices(this.nameData)
      .then(data => {
        this.directories = data;
        this.visibleList = this.directories;
        this.toolServices.closeStaticLoading();
      }).catch(error => {
        console.error(error);
        this.toolServices.closeStaticLoading();
      });
  }

  hayDirectorios(directorio) {
    return directorio.Directorios.length > 0;
  }

  mostrarDetalles(categoria) {
    categoria.Expandido = !categoria.Expandido;
  }

  filterItems(event) {
    this.visibleList = this.directories;
    const val = event.target.value;
    if (val && val.trim() !== '') {
      this.visibleList = [];
      for (let i = 0; i < this.directories.length; i++) {
        const obj = {
          NombreCategoria: this.directories[i].NombreCategoria,
          Directorios: [],
          Expandido: true
        };
        this.visibleList.push(obj);
        this.visibleList[i].Directorios = this.directories[
          i
        ].Directorios.filter(item => {
          return (
            item.NombreDirectorio.toLowerCase().indexOf(val.toLowerCase()) >
              -1 || item.Categoria.toLowerCase().indexOf(val.toLowerCase()) > -1
          );
        });
      }
    }
  }
}
