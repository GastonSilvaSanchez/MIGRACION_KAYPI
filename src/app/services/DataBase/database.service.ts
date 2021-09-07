import { Injectable } from '@angular/core';
import { SQLite, SQLiteObject } from '@ionic-native/sqlite/ngx';
import { HttpClient } from '@angular/common/http';
import { ConfigurationService } from '../Configuracion/configuration.service';

@Injectable({
	providedIn: 'root'
})
export class DatabaseService {
	db: SQLiteObject = null;
	config: any;
	versionApp: any;

	constructor(
		private sqlite: SQLite,
		private configServices: ConfigurationService,
		private http: HttpClient
	) {}

	createDatabase() {
		try {
			this.sqlite
				.create({
					name: this.configServices.config.nameDataBasePhone,
					location: 'default'
				})
				.then(db => {
					this.setDatabase(db);
					this.createTable().then(data => {
						this.getConfigFromDataBase().then(dataThree => {
						})
					})
				})
				.then(() => {
					this.getVersionApp().then(data => {
						this.setDataBaseDefault().then(result => {
						}).catch(error => {
							console.error("Error:" + error.message);
						})
						
					});
				})
				.catch(error => {
					console.error(error);
				});
		} catch (err) { }
	}

	setDatabase(db: SQLiteObject) {
		if (this.db === null) {
			this.db = db;
		}
	}

	createTable() {
		let sql =
			'CREATE TABLE IF NOT EXISTS misPuntos(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, lat REAL, lng REAL)';
		let sql2 =
			'CREATE TABLE IF NOT EXISTS version(id INTEGER, versionDatos REAL, versionApp REAL)';
		let sql3 =
			'CREATE TABLE IF NOT EXISTS config(id INTEGER, idioma TEXT, actualizacion INTEGER, tema TEXT)';
		let sql4 =
			'CREATE TABLE IF NOT EXISTS dataKaypi(id INTEGER, name TEXT, info TEXT)';
		this.db.executeSql(sql4, []);
		this.db.executeSql(sql3, []);
		this.db.executeSql(sql2, []);
		return this.db.executeSql(sql, []);
	}

	getPoinst() {
		let sql = 'SELECT * FROM misPuntos';
		return this.db
			.executeSql(sql, [])
			.then(response => {
				const misPuntos = [];
				for (let index = 0; index < response.rows.length; index++) {
					misPuntos.push(response.rows.item(index));
				}
				return Promise.resolve(misPuntos);
			})
			.catch(error => Promise.reject([]));
	}

	getDataKaypiByName(name: string) {
		return new Promise((resolve, reject) => {
			let sql = 'SELECT * FROM dataKaypi WHERE name=?';
			return this.db
				.executeSql(sql, [name])
				.then(response => {
					var dataKaypi = null;
					for (let index = 0; index < response.rows.length; index++) {
						dataKaypi = response.rows.item(index);
					}
					resolve(JSON.parse(dataKaypi['info']));
				})
				.catch(error => reject(null));
		});
	}

	setDataBaseDefault() {
		return new Promise((resolve, reject) => {
			this.getVersionApp().then((version: any) => {
				if (version.versionDatos === 1) {
					Promise.all([
						this.getDataServices(this.configServices.config.pathsData.pathLines, 'Lineas'),
						this.getDataServices(this.configServices.config.pathsData.pathStrategicPoints, 'PuntosEstrategicos'),
						this.getDataServices(this.configServices.config.pathsData.pathRadioTaxis, 'RadioMoviles'),
						this.getDataServices(this.configServices.config.pathsData.pathDirectories, 'Directorios'),
						this.getDataServices(this.configServices.config.pathsData.pathParking, 'Parqueos')
					]).then(data => {
						let sql = 'INSERT INTO dataKaypi(id, name, info) VALUES(?,?,?)';
						Promise.all([
							this.db.executeSql(sql, [1, 'Lineas', JSON.stringify(data[0])]),
							this.db.executeSql(sql, [2, 'PuntosEstrategicos', JSON.stringify(data[1])]),
							this.db.executeSql(sql, [3, 'RadioMoviles', JSON.stringify(data[2])]),
							this.db.executeSql(sql, [4, 'Directorios', JSON.stringify(data[3])]),
							this.db.executeSql(sql, [5, 'Parqueos', JSON.stringify(data[4])])
						]).then(dataTwo => {
							resolve(true);
						}).catch(error => reject(false))
					}).catch(error => reject(false))
				}
			})
		});
	}

	updateDataKaypi() {
		return new Promise((resolve, reject) => {
			var path = this.configServices.config.host + '/Update/Json/';
			Promise.all([
				this.getDataServer(path + 'Lineas','Lineas'),
				this.getDataServer(path + 'PuntosEstrategicos', 'PuntosEstrategicos'),
				this.getDataServer(path + 'RadioMoviles', 'RadioMoviles'),
				this.getDataServer(path + 'Directorios', 'Directorios'),
				this.getDataServer(path + 'Parqueos', 'Parqueos')
			]).then(data => {
				let sql = 'UPDATE dataKaypi SET info=? WHERE id=?';
				if (data[0]) {
					Promise.all([
						this.db.executeSql(sql, [JSON.stringify(data[0]), 1]),
						this.db.executeSql(sql, [JSON.stringify(data[1]), 2]),
						this.db.executeSql(sql, [JSON.stringify(data[2]), 3]),
						this.db.executeSql(sql, [JSON.stringify(data[3]), 4]),
						this.db.executeSql(sql, [JSON.stringify(data[4]), 5])
					]).then(dataTwo => {
						resolve(true);
					}).catch(error => reject(false))
				} else {
					reject(false);
				}
			}).catch(error => reject(false))
		});
	}

	getPointById(id) {
		let sql = 'SELECT * FROM misPuntos WHERE id=?';
		return this.db
			.executeSql(sql, [id])
			.then(response => {
				var misPuntos = [];
				for (let index = 0; index < response.rows.length; index++) {
					misPuntos.push(response.rows.item(index));
				}
				return Promise.resolve(misPuntos);
			})
			.catch(error => Promise.reject([]));
	}

	addPoint(point: any) {
		let sql = 'INSERT INTO misPuntos(nombre, lat, lng) VALUES(?,?,?)';
		return this.db.executeSql(sql, [point.nombre, point.lat, point.lng]);
	}

	deletePoint(point: any) {
		let sql = 'DELETE FROM misPuntos WHERE id=?';
		return this.db.executeSql(sql, [point.id]);
	}

	updatePoint(point: any) {
		let sql = 'UPDATE misPuntos SET nombre=?, lat=?, lng=? WHERE id=?';
		return this.db.executeSql(sql, [
			point.nombre,
			point.lat,
			point.lng,
			point.id
		]);
	}

	updateConfig(config: any) {
		let sql =
			'UPDATE config SET idioma=?, actualizacion=?, tema=? WHERE id=?';
		return this.db.executeSql(sql, [
			config.idioma,
			config.actualizacion,
			config.tema,
			1
		]).catch(error => console.error(error));
	}

	getConfiguracion() {
		return new Promise((resolve, reject) => {
			let sql = 'SELECT * FROM config';
			return this.db
				.executeSql(sql, [])
				.then(response => {
					var configuracion = null;
					for (let index = 0; index < response.rows.length; index++) {
						configuracion = response.rows.item(index);
					}
					if (!configuracion) {
						this.setConfiguration().then(data => {
							this.getConfiguracion();
						});
					} else {
						resolve(configuracion);
					}
				})
				.catch(error => reject(null));
		});
	}

	setConfiguration() {
		let sql2 = 'INSERT INTO config(id, idioma, actualizacion, tema) VALUES(?,?,?,?)';
		return this.db.executeSql(sql2, [
			1,
			this.configServices.config.lenguageDefault,
			this.configServices.config.updateData,
			this.configServices.config.styleApp
		]).catch(error => console.error(error));
	}

	getVersionApp() {
		return new Promise((resolve, reject) => {
			let sql = 'SELECT * FROM version';
			return this.db
				.executeSql(sql, [])
				.then(response => {
					var version = null;
					for (let index = 0; index < response.rows.length; index++) {
						version = response.rows.item(index);
					}
					if (version == null) {
						let sql = 'INSERT INTO version(id, versionDatos, versionApp) VALUES(?,?,?)';
						this.db.executeSql(sql, [1, 1.0, 1.0]);
						this.getVersionApp();
					}
					resolve(version);
				})
				.catch(error => { console.error(error); reject(null); });
		});
	}

	updateVersionApp(version: any) {
		let sql = 'UPDATE version SET versionDatos=?, versionApp=? WHERE id=?';
		return this.db.executeSql(sql, [
			version.versionDatos,
			version.versionApp,
			1
		]).catch(error => console.error(error));
	}

	getConfigFromDataBase() {
		return new Promise((resolve, reject) => {
			this.getConfiguracion().then(data => {
				this.configServices.setLanguage(data['idioma']);
				this.configServices.setConfig('lenguageDefault', data['idioma']);
				this.configServices.setConfig('updateData', data['actualizacion']);
				this.configServices.setConfig('styleApp', data['tema']);
				this.getVersionApp().then(dataTwo => {
					this.configServices.setConfig('versionDatos', dataTwo['versionDatos']);
					resolve(true);
				});
			}).catch(error => { console.error(error); reject(false); })
		});
	}

	getDataServices(pathData, nameData): any {
		var path = this.configServices.config.localhost + this.configServices.config.pathJsons;
		return new Promise((resolve, reject) => {
			this.http.get(path + pathData).subscribe(
				data => {
					resolve(data[nameData]);
				},
				error => {
					console.error(error);
					reject(null);
				}
			);
		}).catch(error => {
			console.error(error);
		});
	}

	getDataServer(path, name) {
		return new Promise((resolve, reject) => {
			this.http.get(path).subscribe(
				data => {
					resolve(data[name]);
				},
				error => {
					console.error(error);
					reject(null);
				}
			);
		}).catch(error => {
			console.error(error);
		});
	}
}
