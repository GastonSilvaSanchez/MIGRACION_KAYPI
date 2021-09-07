import { Component, OnInit } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { LoadingController } from '@ionic/angular';
import { ToolsService } from '../services/Tools/tools.service';

@Component({
  selector: 'app-lines',
  templateUrl: './lines.page.html',
  styleUrls: ['./lines.page.scss']
})
export class LinesPage implements OnInit {
  lineas: Array<any>;
  listaVisible: Array<any>;
  config: any;
  nameData = 'Lineas';
  categorias: Array<any> = [{ nombre: 'Todos', valor: 'Todos' }];
  seleccionado = 'Todos';
  loading: any;
  textoSearcher: string = this.tool.translateValue(
    'BusquedaDeLineas.BarraBusqueda.Lineas'
  );

  constructor(
    private servicio: KaypiServices,
    private configuration: ConfigurationService,
    private loadingController: LoadingController,
    private tool:ToolsService
  ) {}

  ngOnInit() {
    this.getConfiguration();
    this.getLineas();
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  async getLineas() {
    await this.prepareLoading();
    await this.loading.present();
    this.servicio
      .getDataBaseServices(this.nameData)
      .then(data => {
        this.lineas = data;
        this.ordenarLista(this.lineas);
        this.listaVisible = this.lineas;
        this.cargarCategorias();
        this.loading.dismiss();
      }).catch(error => this.loading.dismiss());
  }

  cargarCategorias() {
    this.lineas.forEach(linea => {
      if (!this.categorias.some(line => line.nombre === linea.Categoria)) {
        this.categorias.push({
          nombre: linea.Categoria,
          valor: linea.Categoria
        });
      }
    });
    this.categorias.push({ nombre: 'Zona', valor: 'Zona' });
  }

  async onSelectChange(event) {
    await this.prepareLoading();
    await this.loading.present();
    this.cargarListaVisible(event.detail.value);
    this.loading.dismiss();
  }

  cargarListaVisible(categoria: string) {
    if (this.seleccionado === 'Todos' || this.seleccionado === 'Zona') {
      this.listaVisible = this.lineas;
      if (this.seleccionado === 'Todos') {
        this.textoSearcher = this.tool.translateValue(
          'BusquedaDeLineas.BarraBusqueda.Lineas'
        );
      } else {
        this.textoSearcher = this.tool.translateValue(
          'BusquedaDeLineas.BarraBusqueda.Zonas'
        );
      }
      this.ordenarLista(this.listaVisible);
    } else {
      this.cargarCategoria(categoria);
    }
  }

  ordenarLista(lista) {
    lista.sort((i1, i2) => {
      if (i1.Nombre > i2.Nombre) {
        return 1;
      }
      if (i1.Nombre < i2.Nombre) {
        return -1;
      }
      return 0;
    });
  }

  cargarCategoria(categoria) {
    this.listaVisible = [];
    this.lineas.forEach(linea => {
      if (linea.Categoria === categoria) {
        this.listaVisible.push(linea);
      }
    });
    this.ordenarLista(this.listaVisible);
    this.textoSearcher = this.tool.translateValue(
      'BusquedaDeLineas.BarraBusqueda.' + categoria
    );
  }

  filterItems(event) {
    this.cargarListaVisible(this.seleccionado);
    if (this.seleccionado === 'Zona') {
      const valor = event.target.value;
      if (valor.trim() !== '') {
        this.listaVisible = this.listaVisible.filter(item => {
          for (let i = 0; i < item.ZonasCBBA.length; i++) {
            if (
              item.ZonasCBBA[i].toLowerCase().indexOf(valor.toLowerCase()) > -1
            ) {
              return item;
            }
          }
        });
      }
    } else {
      const valor = event.target.value;
      if (valor.trim() !== '') {
        this.listaVisible = this.listaVisible.filter(item => {
          return (
            item.Nombre.slice(6)
              .toLowerCase()
              .indexOf(valor.toLowerCase()) > -1
          );
        });
      }
    }
  }

  async prepareLoading() {
    this.loading = await this.loadingController.create({
      message: this.tool.translateValue('Cargando')
    });
  }
}
