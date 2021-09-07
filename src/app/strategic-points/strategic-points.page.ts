import { Component, OnInit } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { DatabaseService } from '../services/DataBase/database.service';
import { AlertController, LoadingController } from '@ionic/angular';
import { ToolsService } from '../services/Tools/tools.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-strategic-points',
  templateUrl: './strategic-points.page.html',
  styleUrls: ['./strategic-points.page.scss']
})
export class StrategicPointsPage implements OnInit {
  points: Array<any>;
  config: any;
  nameData = 'PuntosEstrategicos';
  seleccion = 'Puntos';
  myPoints: Array<any> = [];
  seleccionado = 'Todos';
  categories: Array<any> = [
    { Nombre: 'Todos', Valor: 'Todos', Imagen: 'Todos.png' }
  ];
  visiblePoints: Array<any>;
  visibleMyPoints: Array<any>;
  loading: any;

  constructor(
    private servicio: KaypiServices,
    private configuration: ConfigurationService,
    private dataBaseServices: DatabaseService,
    private alertController: AlertController,
    private router: Router,
    private toolServices: ToolsService,
    private loadingController: LoadingController
  ) {}

  ngOnInit() {
    this.getConfiguration();
    this.getPoints();
    this.getMyPoints();
  }

  ionViewWillEnter() {
    this.getMyPoints();
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  async getPoints() {
    await this.prepareLoading();
    await this.loading.present();
    this.servicio
      .getDataBaseServices(this.nameData)
      .then(data => {
        this.points = data;
        this.visiblePoints = this.points;
        this.loadCategories();
        this.loading.dismiss();
      }).catch(error => this.loading.dismiss());
  }

  loadCategories() {
    this.points.forEach(point => {
      if (!this.categories.some(cat => cat.Nombre === point.Categoria)) {
        this.categories.push({
          Nombre: point.Categoria,
          Valor: point.Categoria,
          Imagen: point.Imagen
        });
      }
    });
  }

  getMyPoints() {
    try {
      this.dataBaseServices
        .getPoinst()
        .then(data => {
          this.myPoints = data;
          this.visibleMyPoints = this.myPoints;
        })
        .catch(err => (this.seleccion = 'Puntos'));
    } catch (err) {
      this.seleccion = 'Puntos';
    }
  }

  async onSelectChange(event) {
    await this.prepareLoading();
    await this.loading.present();
    this.loadVisibleList(event.detail.value);
    this.loading.dismiss();
  }

  loadVisibleList(selected) {
    this.seleccionado = selected;
    if (this.seleccionado === 'Todos') {
      this.visiblePoints = this.points;
      this.orderList(this.visiblePoints);
    } else {
      this.loadCategory(this.seleccionado);
    }
  }

  loadCategory(categoria) {
    this.visiblePoints = [];
    this.points.forEach(point => {
      if (point.Categoria === categoria) {
        this.visiblePoints.push(point);
      }
    });
    this.orderList(this.visiblePoints);
  }

  orderList(list) {
    list.sort((i1, i2) => {
      if (i1.Nombre > i2.Nombre) {
        return 1;
      }
      if (i1.Nombre < i2.Nombre) {
        return -1;
      }
      return 0;
    });
  }

  filterItems(event) {
    this.loadVisibleList(this.seleccionado);
    const valor = event.target.value;
    if (valor.trim() !== '') {
      this.visiblePoints = this.visiblePoints.filter(item => {
        return item.Nombre.toLowerCase().indexOf(valor.toLowerCase()) > -1;
      });
    }
  }

  filterMisPuntos(evento) {
    this.visibleMyPoints = this.myPoints;
    const value = evento.target.value;
    if (value.trim() !== '') {
      this.visibleMyPoints = this.visibleMyPoints.filter(item => {
        return item.nombre.toLowerCase().indexOf(value.toLowerCase()) > -1;
      });
    }
  }

  async alertDeletedPoint(point) {
    const prompt = await this.alertController.create({
      header:
        this.toolServices.translateValue(
          'PuntosEstrategicos.MisPuntos.TituloAlertEliminar'
        ) +
        "'" +
        point.nombre +
        "'",
      message: this.toolServices.translateValue(
        'PuntosEstrategicos.MisPuntos.ContenidoAlertEliminar'
      ),
      buttons: [
        {
          text: this.toolServices.translateValue('Botones.Cancelar'),
          handler: () => {}
        },
        {
          text: this.toolServices.translateValue('Botones.Eliminar'),
          handler: () => {
            this.deletePoint(point);
          }
        }
      ]
    });
    await prompt.present();
  }

  deletePoint(point) {
    this.dataBaseServices
      .deletePoint(point)
      .then(response => {
        this.getMyPoints();
        this.toolServices.createToast(
          this.toolServices.translateValue(
            'PuntosEstrategicos.MisPuntos.ToastEliminado'
          ),
          3000,
          false,
          'bottom'
        );
      })
      .catch(error => {
        console.error(error);
      });
  }

  showMyPoint(point) {
    const data = { name: 'MisPuntos', type: 'one', value: point.id, field: '' };
    this.router.navigate(['location/', JSON.stringify(data)]);
  }

  addMyPoint() {
    const data = { name: 'MisPuntos', type: 'one', value: '', field: '' };
    this.router.navigate(['location/', JSON.stringify(data)]);
  }

  async prepareLoading() {
    this.loading = await this.loadingController.create({
      message: this.toolServices.translateValue('Cargando')
    });
  }
}
