import { Component, OnInit } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { ActivatedRoute, Router } from '@angular/router';
import { ToolsService } from '../services/Tools/tools.service';

@Component({
  selector: 'app-directory-information',
  templateUrl: './directory-information.page.html',
  styleUrls: ['./directory-information.page.scss']
})
export class DirectoryInformationPage implements OnInit {
  directory: any = { Telefono: [] };
  config: any;
  nameData = 'Directorios';

  constructor(
    private servicio: KaypiServices,
    private configuration: ConfigurationService,
    private activatesRouter: ActivatedRoute,
    private router: Router,
    private toolServices: ToolsService
  ) {}

  ngOnInit() {
    this.getConfiguration();
    this.getDirectory(
      this.activatesRouter.snapshot.params.nameDirectory,
      this.activatesRouter.snapshot.params.nameSubDirectory
    );
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  async getDirectory(nameDirectory, nameSubDirectory) {
    await this.toolServices.showStaticLoading();
    this.servicio
      .getOnData(
        this.config.pathsData.pathDirectories,
        this.nameData,
        nameDirectory,
        'NombreCategoria'
      )
      .then(data => {
        this.servicio
          .getOnDataByList(
            data[this.nameData],
            nameSubDirectory,
            'NombreDirectorio'
          )
          .then(response => {
            this.directory = response;
            this.toolServices.closeStaticLoading();
          }).catch(error => {
            this.toolServices.closeStaticLoading();
          });
      });
  }

  showPoint() {
    const data = {
      name: 'Directorios',
      type: 'one',
      nameCategory: this.directory.Categoria,
      nameDirectorie: this.directory.NombreDirectorio
    };
    this.router.navigate(['location/', JSON.stringify(data)]);
  }

  callNumber(number) {
    this.toolServices
      .callPhone(number)
      .then(() => {
      })
      .catch(err => console.error(err));
  }
}
