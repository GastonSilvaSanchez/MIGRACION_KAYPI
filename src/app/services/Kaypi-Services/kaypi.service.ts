import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ConfigurationService } from '../Configuracion/configuration.service';
import { DatabaseService } from '../DataBase/database.service';

@Injectable({
	providedIn: 'root'
})
export class KaypiServices {
	path: String;
	CONFIG: any;
	estadoDescarga = false;

	constructor(
		public http: HttpClient,
		public configuration: ConfigurationService,
		private dataBaseServices: DatabaseService
	) {
		this.getConfiguration();
	}

	getConfiguration() {
		this.CONFIG = this.configuration.getConfig();
		this.path = this.CONFIG.localhost + this.CONFIG.pathJsons;
  }

	getDataServices(pathData, nameData): any {
		return new Promise((resolve, reject) => {
			this.http.get(this.path + pathData).subscribe(
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

	getDataBaseServices(nameData): any {
		return new Promise((resolve, reject) => {
			this.dataBaseServices.getDataKaypiByName(nameData).then(
				data => {
					resolve(data);
				}
			).catch(error => {
				console.error(error);
				reject(null);
			});
		}).catch(error => {
			console.error(error);
		});
	}

	getOnData(pathData, nameData, value, field) {
		return new Promise((resolve, reject) => {
			this.getDataBaseServices(nameData)
				.then(data => {
					const result = data.filter(current => {
						return current[field] === value;
					});
					resolve(result[0]);
				})
				.catch(err => {
					console.error(err);
					reject(null);
				});
		});
	}

	getOnDataByList(list, value, field) {
		return new Promise((resolve, reject) => {
			const result = list.filter(current => {
				return current[field] === value;
			});
			resolve(result[0]);
		});
	}

	getDataServer(path) {
		return new Promise((resolve, reject) => {
			this.http.get(path).subscribe(
				data => {
					resolve(data);
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

	getLinesByPoints(pointOne: any, pointTwo: any) {
		return new Promise((resolve, reject) => {
			this.getDataBaseServices('Lineas').then(
				data => {
					const result = this.linesBySelection(pointOne, pointTwo, data);
					resolve(result);
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

	private linesBySelection(pointOne, ponitTwo, lines) {
		const listaDireccion = this.getLineasSegunDireccion(
			lines,
			pointOne,
			ponitTwo
		);
		const listaConMenosDistancia = this.getLineasConMenosDistancias(
			listaDireccion
		);
		return listaConMenosDistancia;
	}

	private getLineasSegunDireccion(lista, puntoInicio, puntoFin) {
		const listaLineas = [];
		let listaPuntos = [];
		for (let i = 0; i < lista.length; i++) {
			for (let j = 0; j < lista[i].Rutas.length; j++) {
				const p1 = this.getPuntoCercanoV2(lista[i].Rutas[j], puntoInicio);
				const p2 = this.getPuntoCercanoV2(lista[i].Rutas[j], puntoFin);

				listaPuntos = [];
				listaPuntos = lista[i].Rutas[j].Puntos;

				const posicion1 = listaPuntos.findIndex(
					x => x.lat === p1.lat && x.lng === p1.lng
				);
				const posicion2 = listaPuntos.findIndex(
					x => x.lat === p2.lat && x.lng === p2.lng
				);

				if (posicion1 < posicion2) {
					const distanciaI =
						Math.sqrt(
							Math.pow(Math.abs(p1.lat) - Math.abs(puntoInicio.lat()), 2) +
							Math.pow(Math.abs(p1.lng) - Math.abs(puntoInicio.lng()), 2)
						) * 100000;
					const distanciaF =
						Math.sqrt(
							Math.pow(Math.abs(p2.lat) - Math.abs(puntoFin.lat()), 2) +
							Math.pow(Math.abs(p2.lng) - Math.abs(puntoFin.lng()), 2)
						) * 100000;
					const distanciaT = distanciaI + distanciaF;
					if (distanciaT <= 1500) {
						if (!listaLineas.some(x => x === lista[i])) {
							listaLineas.push({
								Linea: {
									Nombre: lista[i].Nombre,
									Categoria: lista[i].Categoria,
									Ruta: lista[i].Rutas[j]
								},
								Distancia: distanciaT
							});
						}
					}
				}
			}
		}
		return listaLineas;
	}

	private getLineasConMenosDistancias(lista) {
		const listaDistancia = lista;

		const sortedArray: Array<any> = listaDistancia.sort((n1, n2) => {
			if (n1.Distancia > n2.Distancia) {
				return 1;
			}

			if (n1.Distancia < n2.Distancia) {
				return -1;
			}

			return 0;
		});
		if (sortedArray.length > this.CONFIG.maxLines) {
			sortedArray.length = this.CONFIG.maxLines;
		}
		const finalArray = [];
		sortedArray.forEach(element => finalArray.push(element.Linea));
		return finalArray;
	}

	private getPuntoCercanoV2(ruta, punto) {
		let puntoCercano = null;
		let distancia = Number.MAX_VALUE;
		ruta.Puntos.forEach(element => {
			const calculo = Math.sqrt(
				Math.pow(element.lat - punto.lat(), 2) +
				Math.pow(element.lng - punto.lng(), 2)
			);
			if (calculo < distancia) {
				distancia = calculo;
				puntoCercano = element;
			}
		});
		return puntoCercano;
	}

	obtenerLineasPorPunto(point): any {
		return new Promise((resolve, reject) => {
			this.getDataBaseServices('Lineas').then(
				lines => {
					const res = this.getLineasDeUnPuntoConMenosDistancia(lines, point);
					resolve(res);
				}
			);
		}).catch(error => {
			console.error(error);
		});
	}

	getLineasDeUnPuntoConMenosDistancia(lista, puntoIni) {
		const listaDistancia = [];
		for (let k = 0; k < lista.length; k++) {
			for (let h = 0; h < lista[k].Rutas.length; h++) {
				const pI = this.getPuntoCercanoV2(lista[k].Rutas[h], puntoIni);
				const distanciaI = Math.sqrt(
					Math.pow(Math.abs(pI.lat) - Math.abs(puntoIni.lat()), 2) +
					Math.pow(Math.abs(pI.lng) - Math.abs(puntoIni.lng()), 2)
				);
				if (!listaDistancia.some(x => x === lista[k])) {
					listaDistancia.push({ Linea: lista[k], Distancia: distanciaI });
				}
			}
		}

		const sortedArray = listaDistancia.sort((n1, n2) => {
			if (n1.Distancia > n2.Distancia) {
				return 1;
			}

			if (n1.Distancia < n2.Distancia) {
				return -1;
			}

			return 0;
		});
		const listaLineasOficial = [];
		if (sortedArray.length > this.CONFIG.maxLines) {
			sortedArray.length = this.CONFIG.maxLines;
		}
		sortedArray.forEach(element => {
			listaLineasOficial.push(element.Linea);
		});
		const listaLineas = [];
		listaLineasOficial.forEach(element => {
			if (!listaLineas.some(x => x.Nombre === element.Nombre)) {
				listaLineas.push(element);
			}
		});
		return listaLineas;
	}
}
