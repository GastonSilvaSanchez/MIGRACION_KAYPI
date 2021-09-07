import { Component, OnInit, OnDestroy, AfterViewInit } from '@angular/core';
import { Platform, AlertController } from '@ionic/angular';
import { Router } from '@angular/router';
import { ToolsService } from '../services/Tools/tools.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.page.html',
  styleUrls: ['./menu.page.scss']
})
export class MenuPage implements OnInit, OnDestroy, AfterViewInit {
  appPages: any = [];
  backButtonSubscription;

  constructor(
    private platform: Platform,
    private router: Router,
    private alertController: AlertController,
    private toolServices: ToolsService
  ) {
    this.appPages = [
      {
        title: 'IrDesdeMiUbicacion',
        url: '/search-lines/""',
        icon: 'navigate'
      },
      {
        title: 'BusquedaDeLineas',
        url: '/lines',
        icon: 'bus'
      },
      {
        title: 'RadioMovil',
        url: '/radio-taxi',
        icon: 'car'
      },
      {
        title: 'PuntosEstrategicos',
        url: '/strategic-points',
        icon: 'pricetags'
      },
      {
        title: 'Directorios',
        url: '/directories',
        icon: 'folder'
      },
      {
        title: 'NoticiasTrafico',
        url: '/news',
        icon: 'paper'
      },
      {
        title: 'Parqueos',
        url: '/parkings',
        icon: 'warning'
      },
      {
        title: 'Configuracion',
        url: '/configuration',
        icon: 'construct'
      },
      {
        title: 'Ayuda',
        url: '/help',
        icon: 'help-circle'
      },
      {
        title: 'AcercaDe',
        url: '/about',
        icon: 'information-circle'
      }
    ];
  }

  ngOnInit() {}

  ngAfterViewInit() {
    this.backButtonSubscription = this.platform.backButton.subscribe(() => {
      if (this.router.url === '/menu') {
        this.showExitAlert();
      }
    });
  }

  ngOnDestroy() {
    this.backButtonSubscription.unsubscribe();
  }

  async showExitAlert() {
    const prompt = await this.alertController.create({
      header: this.toolServices.translateValue(
        'Menu.Salir'
      ),
      message: this.toolServices.translateValue(
        'Menu.MensajeSalir'
      ),
      buttons: [
        {
          text: this.toolServices.translateValue('Botones.Cancelar'),
          handler: () => {}
        },
        {
          text: this.toolServices.translateValue('Botones.Aceptar'),
          handler: () => {
            navigator['app'].exitApp();
          }
        }
      ]
    });
    await prompt.present();
  }
}
