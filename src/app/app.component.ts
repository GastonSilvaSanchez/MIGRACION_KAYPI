import { Component } from '@angular/core';

import {
	Platform,
	AlertController,
	LoadingController,
	MenuController
} from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { TranslateService } from '@ngx-translate/core';
import { ConfigurationService } from './services/Configuracion/configuration.service';
import { DatabaseService } from './services/DataBase/database.service';
import { ToolsService } from './services/Tools/tools.service';
import { FcmService } from './services/Fcm-Service/fcm.service';
import { tap } from 'rxjs/operators';
import { KaypiServices } from './services/Kaypi-Services/kaypi.service';

@Component({
	selector: 'app-root',
	templateUrl: 'app.component.html',
	styleUrls: ['app.component.scss']
})
export class AppComponent {
	public appPages = [
		{
			title: 'Inicio',
			url: '/menu',
			icon: 'home'
		},
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

	styleApp: String;
	config: any;

	constructor(
		private platform: Platform,
		private splashScreen: SplashScreen,
		private menu: MenuController,
		private translate: TranslateService,
		public configuration: ConfigurationService,
		private dataBaseServices: DatabaseService,
		public fcm: FcmService,
		private db: DatabaseService,
		private alertCtrl: AlertController,
		private loadingCtrl: LoadingController,
		private servicio: KaypiServices,
		private tool: ToolsService,
		private alertController: AlertController
	) {
		this.config = this.configuration.getConfig();
		this.initializeApp();
		this.notifications();
		this.backButtonEvent();
	}

	initializeApp() {
		this.platform.ready().then(() => {
			this.dataBaseServices.createDatabase();
			this.splashScreen.hide();
			this.initTranslate();
			this.getNewVersion();
		});
	}

	getNewVersion() {
		setTimeout(() => {
			this.configuration
				.getVersionNube()
				.then((data: any) => {
					if (data > this.config.versionDatos) {
						if (this.config.updateData === 0) {
							this.actualizarApp(data);
						} else {
							this.actualizacionAutomatica(data);
						}
					}
				})
				.catch(error => {
					console.error(error);
				});
		}, 3000);
	}

	backButtonEvent() {
		this.platform.backButton.subscribe(async () => {
			// close side menua
			try {
				const element = await this.menu.getOpen();
				if (element !== null) {
					this.menu.close();
					return;
				}
			} catch (error) { }
		});
	}

	getConfig() {
		return this.config;
	}

	private initTranslate() {
		this.translate.setDefaultLang(
			this.configuration.getConfig().lenguageDefault
		);
	}

	notifications() {
		this.fcm.getToken();
		this.fcm
			.listenToNotifications()
			.pipe(
				tap(() => {
					//  abrir noticias
				})
			)
			.subscribe();
	}

	async actualizacionAutomatica(version) {
		const loader = await this.loadingCtrl.create({
			message: this.tool.translateValue('Actualizacion.Toast')
		});
		await loader.present();
		this.dataBaseServices.updateDataKaypi().then(async data => {
			loader.dismiss();
			if (data) {
				const secondLoader = await this.loadingCtrl.create({
					message: this.tool.translateValue('Actualizacion.ToastCargandoDatos')
				});
				await secondLoader.present();
				this.configuration.setConfig('versionDatos', parseFloat(version.toString()));
				this.dataBaseServices.updateVersionApp({
					versionDatos: parseFloat(version.toString()),
					versionApp: 1.0
				}).then(data => {
					secondLoader.dismiss();
					this.dataBaseServices.getConfigFromDataBase()
				});
			} else {
				loader.dismiss();
				this.errorActualizacion();
			}
		}).catch(error => {this.errorActualizacion(); loader.dismiss();})
	}

	async actualizarApp(version) {
		const alertActualizacion = await this.alertCtrl.create({
			header: this.tool.translateValue('Actualizacion.TituloMensaje'),
			message: this.tool.translateValue('Actualizacion.ContenidoMensaje'),
			buttons: [
				{
					text: this.tool.translateValue('Botones.Cancelar'),
					handler: data => { }
				},
				{
					text: this.tool.translateValue('Botones.Actualizar'),
					handler: async () => {
						const loader = await this.loadingCtrl.create({
							message: this.tool.translateValue('Actualizacion.Toast')
						});
						await loader.present();
						this.dataBaseServices.updateDataKaypi().then(async data => {
							loader.dismiss();
							if (data) {
								const alertActualizado = await this.alertCtrl.create({
									header: this.tool.translateValue('Actualizacion.TituloAlert'),
									message: this.tool.translateValue('Actualizacion.ContenidoAlert'),
									buttons: [
										{
											text: this.tool.translateValue('Botones.Aceptar'),
											handler: async () => {
												const secondLoader = await this.loadingCtrl.create({
													message:
														this.tool.translateValue('Actualizacion.ToastCargandoDatos')
												});
												await secondLoader.present();
												this.configuration.setConfig('versionDatos', parseFloat(version.toString()));
												this.dataBaseServices.updateVersionApp({
													versionDatos: parseFloat(version.toString()),
													versionApp: 1.0
												}).then(data => {
													secondLoader.dismiss();
													this.dataBaseServices.getConfigFromDataBase()
												});
											}
										}
									]
								});
								await alertActualizado.present();
							} else {
								loader.dismiss();
								this.errorActualizacion();
							}
						}).catch(error => {this.errorActualizacion(); loader.dismiss();});
					}
				}
			]
		});
		await alertActualizacion.present();
	}

	async errorActualizacion() {
		const error = await this.alertCtrl.create({
			header: this.tool.translateValue('Actualizacion.TituloAlertError'),
			message: this.tool.translateValue('Actualizacion.MensajeAlertError'),
			buttons: [
				{
					text: this.tool.translateValue('Botones.Aceptar'),
					handler: data => { }
				},
				{
					text: this.tool.translateValue('Botones.VolverIntentar'),
					handler: data => {
						this.getNewVersion();
					}
				}
			]
		});
		await error.present();
	}

	async showExitAlert() {
		const prompt = await this.alertController.create({
		  header: this.tool.translateValue(
			'Menu.Salir'
		  ),
		  message: this.tool.translateValue(
			'Menu.MensajeSalir'
		  ),
		  buttons: [
			{
			  text: this.tool.translateValue('Botones.Cancelar'),
			  handler: () => {}
			},
			{
			  text: this.tool.translateValue('Botones.Aceptar'),
			  handler: () => {
				navigator['app'].exitApp();
			  }
			}
		  ]
		});
		await prompt.present();
	  }
}
