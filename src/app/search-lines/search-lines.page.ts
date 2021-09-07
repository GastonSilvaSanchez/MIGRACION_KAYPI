import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { ActivatedRoute } from '@angular/router';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { ToolsService } from '../services/Tools/tools.service';

declare var google;

@Component({
	selector: 'app-search-lines',
	templateUrl: './search-lines.page.html',
	styleUrls: ['./search-lines.page.scss']
})
export class SearchLinesPage implements OnInit {
	@ViewChild('map') mapElement: ElementRef;
	map: any;
	config: any;
	pathImages: any;
	resultLines: any = [];
	pointOne: any;
	pointTwo: any;
	listMarks: any = [];
	flightPath: any;
	positionSlide = 0;
	intervar: any;
	sentido: any;
	markerLocation: any = null;

	constructor(
		private servicio: KaypiServices,
		private configuration: ConfigurationService,
		private activatesRouter: ActivatedRoute,
		private geolocation: Geolocation,
		private tool: ToolsService
	) { }

	ngOnInit() {
		this.getConfiguration();
		const data = this.activatesRouter.snapshot.params.data;
		if (data) {
			this.getParamas(data);
		}
		this.initMap();
	}

	private getParamas(data) {
		data = JSON.parse(data);
		if (data.type === 'Lines') {
			this.getLinesByPoint(data.point);
		} else if (data.type === 'Point') {
			this.viewPoint(data.nameData, data.value, data.point, data.pointData);
		}
	}

	private viewPoint(nameData, value, point, pointData) {
		this.servicio
			.getOnData(
				this.config.pathsData.pathStrategicPoints,
				nameData,
				value,
				'Nombre'
			)
			.then(() => {
				const latLng = new google.maps.LatLng(pointData.lat, pointData.lng);
				if (point === 'pointOne') {
					this.setPointOne(latLng);
				} else if (point === 'pointTwo') {
					this.setPointTwo(latLng);
				}
			});
	}

	private getConfiguration() {
		this.config = this.configuration.getConfig();
		this.pathImages = this.config.localhost.replace('/assets', '') + this.config.pathFolderImage;
	}

	private initMap() {
		const latLng = new google.maps.LatLng(
			this.config.map.lat,
			this.config.map.lng
		);
		const mapOptions = {
			controls: {
				compass: true,
				myLocationButton: true,
				indoorPicker: true
			},
			center: latLng,
			zoom: this.config.map.zoom,
			animation: google.maps.Animation.DROP,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			disableDefaultUI: true
		};
		this.map = new google.maps.Map(this.mapElement.nativeElement, mapOptions);
		google.maps.event.addListener(this.map, 'click', e => {
			if (!this.pointOne || !this.pointTwo) {
				this.clickMapa(e.latLng);
			}
		});
		this.addYourLocationButton(this.map);
	}

	private clickMapa(punto) {
		if (!this.pointOne) {
			this.setPointOne(punto);
		} else {
			this.setPointTwo(punto);
		}
		if (this.pointTwo && this.pointOne) {
			this.getLinesByPoints(this.pointOne, this.pointTwo);
		}
	}

	async getLocation() {
		this.tool.presentLoading('Cargando...', 2000);
		this.geolocation.getCurrentPosition({ enableHighAccuracy: true }).then((resp) => {
			const latLng = new google.maps.LatLng(
				resp.coords.latitude,
				resp.coords.longitude
			);
			var icon = {
				url: "../../assets/img/gpstwo.png",
				scaledSize: new google.maps.Size(15, 15),
				origin: new google.maps.Point(0, 0),
				anchor: new google.maps.Point(0, 0)
			};
			if (this.markerLocation)
        		this.markerLocation.setMap(null);
			this.markerLocation = new google.maps.Marker({
				map: this.map,
				icon: icon,
				position: latLng
			});
			this.map.setCenter(latLng);
			return;
			//this.clickMapa(latLng);
		}).catch((error) => {
			console.error('Error getting location', error);
		});
	}

	setPointOne(point) {
		this.pointOne = point;
		const img = '/BusquedaUbicacion/Marcadores/marcadorIni.png';
		this.addMarker(point, img);
	}

	setPointTwo(point) {
		this.pointTwo = point;
		const img = '/BusquedaUbicacion/Marcadores/marcadorFin.png';
		this.addMarker(point, img);
	}

	addMarker(point, img) {
		const marker = new google.maps.Marker({
			position: point,
			icon: this.pathImages + img,
			map: this.map
		});
		this.map.panTo(point);
		this.listMarks.push(marker);
	}

	private getLinesByPoints(pointOne, pointTwo) {
		this.servicio.getLinesByPoints(pointOne, pointTwo).then(data => {
			this.resultLines = data;
			if (this.resultLines.length > 0) {
				this.cargarRuta(this.resultLines[this.positionSlide].Ruta);
			}
		});
	}

	private getLinesByPoint(point) {
		const latLng = new google.maps.LatLng(point.lat, point.lng);
		this.servicio.obtenerLineasPorPunto(point).then(data => {
			this.resultLines = data;
			if (this.resultLines.length > 0) {
				this.cargarRuta(this.resultLines[this.positionSlide].Ruta);
			}
		});
	}

	limpiarMarcadoresEnMapa() {
		for (let i = 0; i < this.listMarks.length; i++) {
			this.listMarks[i].setMap(null);
		}
		this.pointTwo = null;
		this.pointOne = null;
		this.listMarks = [];
		this.resultLines = [];
		this.positionSlide = 0;
		if (this.flightPath) {
			this.flightPath.setMap(null);
		}
		if (this.intervar) {
			window.clearInterval(this.intervar);
			this.intervar = null;
		}
	}

	private cargarRuta(ruta) {
		const lineSymbol = {
			path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
			scale: 3,
			strokeColor: '#488aff'
		};
		this.flightPath = new google.maps.Polyline({
			path: ruta.Puntos,
			icons: [
				{
					icon: lineSymbol,
					offset: '100%'
				}
			],
			geodesic: true,
			strokeColor: '#1858de',
			strokeOpacity: 1.0,
			strokeWeight: 2
		});
		this.sentido = ruta.Sentido;
		this.flightPath.setMap(this.map);
		this.animateCircle(this.flightPath);
	}

	slideChangedNext() {
		this.positionSlide++;
		this.cargarRuta(this.resultLines[this.positionSlide].Ruta);
	}

	slideChanged() {
		this.flightPath.setMap(null);
		if (this.intervar) {
			window.clearInterval(this.intervar);
		}
	}

	slideChangedBefore() {
		this.positionSlide--;
		this.cargarRuta(this.resultLines[this.positionSlide].Ruta);
	}

	private animateCircle(line) {
		let count = 0;
		this.intervar = window.setInterval(function () {
			count = (count + 1) % 200;
			const icons = line.get('icons');
			icons[0].offset = count / 2 + '%';
			line.set('icons', icons);
		}, 20);
	}

	addYourLocationButton(map) {
		var controlDiv = document.createElement('div');

		var firstChild = document.createElement('button');
		firstChild.style.backgroundColor = '#fff';
		firstChild.style.border = 'none';
		firstChild.style.outline = 'none';
		firstChild.style.width = '28px';
		firstChild.style.height = '28px';
		firstChild.style.borderRadius = '2px';
		firstChild.style.boxShadow = '0 1px 4px rgba(0,0,0,0.3)';
		firstChild.style.cursor = 'pointer';
		firstChild.style.marginRight = '10px';
		firstChild.style.padding = '0px';
		firstChild.title = 'Your Location';
		controlDiv.appendChild(firstChild);

		var secondChild = document.createElement('div');
		secondChild.style.margin = '5px';
		secondChild.style.width = '18px';
		secondChild.style.height = '18px';
		secondChild.style.backgroundImage = 'url(https://maps.gstatic.com/tactile/mylocation/mylocation-sprite-1x.png)';
		secondChild.style.backgroundSize = '180px 18px';
		secondChild.style.backgroundPosition = '0px 0px';
		secondChild.style.backgroundRepeat = 'no-repeat';
		secondChild.id = 'you_location_img';
		firstChild.appendChild(secondChild);

		firstChild.addEventListener('click', async () => {
			var imgX = '0';
			var animationInterval = setInterval(() => {
				if (imgX == '-18') imgX = '0';
				else imgX = '-18';
			}, 500);
			if (navigator.geolocation) {
				var aux = await this.getLocation();
				clearInterval(animationInterval);
			}
			else {
				clearInterval(animationInterval);
			}
		});
		controlDiv['index'] = 1;
		map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(controlDiv);
	}
}
