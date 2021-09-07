import { Injectable } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import * as CONFIG from '../../../assets/config.json';
import { Platform } from '@ionic/angular';
import { HttpClient } from '@angular/common/http';

@Injectable({
	providedIn: 'root'
})
export class ConfigurationService {

	config: any = CONFIG['default'];

	constructor(
		private translate: TranslateService,
		public plt: Platform,
		private http: HttpClient
	) {}

	getConfig() {
		return this.config;
	}

	setLanguage(lang) {
		this.translate.use(lang);
		this.setConfig('lenguageDefault', lang);
	}

	setConfig(field, value) {
		this.config[field] = value;
	}

	getVersionNube() {
		return new Promise((resolve, reject) => {
			this.http
				.get(`${this.config.host}${this.config.pathUpdateApp}`)
				.subscribe(
					(data: any) => {
						resolve(parseFloat(data.Version));
					},
					error => {
						console.error(error);
						reject(null);
					}
				);
		});
	}
}
