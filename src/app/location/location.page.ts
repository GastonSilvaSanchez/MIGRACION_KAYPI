import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { ActivatedRoute, Router } from '@angular/router';
import { DatabaseService } from '../services/DataBase/database.service';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { ToolsService } from '../services/Tools/tools.service';

declare var google;

@Component({
  selector: 'app-location',
  templateUrl: './location.page.html',
  styleUrls: ['./location.page.scss'],
})
export class LocationPage implements OnInit {

  @ViewChild('map') mapElement: ElementRef;
  map: any;
  config: any;
  markers: any = [];
  flightPath: any;
  pathImages: string;
  polylines: any = [];
  typs: any = {
    ALL: "all",
    ONE: "one"
  }
  intervar: any;
  line: any = { Rutas: [] };
  sentido: string;
  point: any;
  positionSlide: number = 0;
  resultLines: any = [];
  title: string = "Localizacion";
  namePoint: string = "";
  isEdit: boolean = false;
  data: any;
  markerLocation: any = null;

  constructor(private servicio: KaypiServices,
    private configuration: ConfigurationService,
    private activatesRouter: ActivatedRoute,
    private router: Router,
    private dataBaseServices: DatabaseService,
    private geolocation: Geolocation,
    private toolService: ToolsService) {
    this.data = JSON.parse(this.activatesRouter.snapshot.params.data);
  }

  ngOnInit() {
    this.getConfiguration();
    this.getInformacion(this.data);
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
    this.pathImages = this.config.localhost.replace('/assets', '') + this.config.pathFolderImage;
    this.initMap();
  }

  async getLocation() {
    this.toolService.presentLoading('Cargando...', 2000);
    this.geolocation.getCurrentPosition({ enableHighAccuracy: true }).then((resp) => {
      let latLng = new google.maps.LatLng(resp.coords.latitude, resp.coords.longitude);
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
      //this.clickMap(latLng);
    }).catch((error) => {
      console.error('Error getting location', error);
    });
  }

  getInformacion(data) {
    if (data) {
      switch (data.name) {
        case "Lineas":
          this.getRoutesLines(data);
          break;
        case "PuntosEstrategicos":
          this.getStrategicPoints(data);
          break;
        case "Trafico":
          this.getTraficNews(data);
          break;
        case "RadioMoviles":
          this.getRadioTaxi(data);
          break;
        case "Directorios":
          this.getDirectoriePoint(data);
          break;
        case "MisPuntos":
          this.getMyPoints(data);
          break;
        case "Parqueos":
          this.getParqueos(data);
          break;
      }
    }
  }

  initMap() {
    let latLng = new google.maps.LatLng(this.config.map.lat, this.config.map.lng);
    let mapOptions = {
      controls: {
        compass: true,
        myLocationButton: true,
        indoorPicker: true
      },
      center: latLng,
      zoom: this.config.map.zoom,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      disableDefaultUI: true
    };
    this.map = new google.maps.Map(this.mapElement.nativeElement, mapOptions);
    this.addYourLocationButton(this.map);
  }

  listenMap() {
    google.maps.event.addListener(this.map, 'click', e => {
      this.clickMap(e.latLng);
    });
  }

  clickMap(latLng) {
    if (this.isEdit) {
      if (this.markers.length > 0) {
        this.markers[0].setMap(null);
        this.markers = [];
      }
      var marker = new google.maps.Marker({
        position: latLng,
        icon: this.pathImages + '/PuntosEstrategicos/Marcadores/Marcador.png',
        map: this.map
      });
      this.markers.push(marker);
      this.map.panTo(latLng);
    }
  }

  async getRoutesLines(data) {
    if (data.point) {
      this.getLinesByPoint(data.point).then(data => {
        this.resultLines = data;
        this.showRoute(this.resultLines[0].Rutas[0]);
      });
    } else {
      this.getOne(this.config.pathsData.pathLines, data.name, data.value, data.field).then(line => {
        this.line = line;
        this.title = data.value;
        this.resultLines.push(this.line);
        this.changeRoute(this.line.Rutas[0].Sentido);
      });
    }
  }

  async getStrategicPoints(data) {
    var points = [];
    if (data.type === this.typs.ALL) {
      points = await this.getAll(this.config.pathsData.pathStrategicPoints, data.name);
    } else if (data.type === this.typs.ONE) {
      points.push(await this.getOne(this.config.pathsData.pathStrategicPoints, data.name, data.value, data.field));
    }
    this.showMarkers(points, '/PuntosEstrategicos/Marcadores/', 'Punto', 'Marcador.png', null);
    this.point = points[0];
    this.title = data.value;
  }

  async getDirectoriePoint(data) {
    var points = [];
    this.title = data.nameDirectorie || 'Directorio';
    this.getOneDataByList(data.nameCategory, data.nameDirectorie).then(res => {
      points.push(res);
      this.showMarkers(points, '/PuntosEstrategicos/Marcadores/', 'Punto', 'Marcador.png',
        `${data.nameCategory}:${data.nameDirectorie}`);
      this.point = points[0];
    });
  }

  async getParqueos(data) {
    var points = await this.getAll(this.config.pathsData.pathParking, data.name);
    this.title = data.name;
    points.forEach(item => {
      item.parqueos.forEach(parqueo => {
        this.showParqueos(parqueo, item.color);
      });
    });
  }

  async getRadioTaxi(data) {
    var taxis = [];
    if (data.type === this.typs.ALL) {
      taxis = await this.getAll(this.config.pathsData.pathRadioTaxis, data.name);
      taxis.forEach(item => {
        this.showMarkers(item['Paradas'], '/RadioMoviles/', null, 'marcadorTaxiA.png', item.Nombre);
      });
    } else if (data.type === this.typs.ONE) {
      taxis.push((await this.getOne(this.config.pathsData.pathRadioTaxis, data.name, data.value, data.field))['Paradas']);
      this.showMarkers(taxis[0], '/RadioMoviles/', null, 'marcadorTaxiA.png', data.value);
      this.title = data.value;
    }
  }

  async getTraficNews(data) {
    var traficNews: any = await this.getData('/Trafico/GetTraficos');
    var trafic = await traficNews.Noticias.filter(traf => {
      return traf[data.field] === data.value;
    });
    this.showPolyLine([{ Puntos: trafic[0].Puntos, tipo: trafic[0].Tipo, color: null }]);
  }

  async getAll(pathData, nameData) {
    await this.toolService.showStaticLoading();
    return await this.servicio.getDataBaseServices(nameData).then(data => {
      this.toolService.closeStaticLoading();
      return data;
    }).catch(error => {
      this.toolService.closeStaticLoading();
    });
  }

  async getLinesByPoint(point) {
    var latLng = new google.maps.LatLng(point.lat, point.lng);
    var marker = new google.maps.Marker({
      position: latLng,
      icon: this.pathImages + "/BusquedaUbicacion/Marcadores/marcadorIni.png",
      map: this.map
    });
    return await this.servicio.obtenerLineasPorPunto(latLng).then(data => {
      return data;
    });
  }

  async getOne(pathData, nameData, value, field) {
    await this.toolService.showStaticLoading();
    return await this.servicio.getOnData(pathData, nameData, value, field).then(data => {
      this.toolService.closeStaticLoading();
      return data;
    }).catch(error => {
      this.toolService.closeStaticLoading();
    });
  }

  async getData(path) {
    return await this.servicio.getDataServer(this.config.host + path).then(data => {
      return data;
    });
  }

  async getOneDataByList(nameCategory, nameDirectorie) {
    return new Promise((resolve, reject) => {
      this.servicio.getOnData(this.config.pathsData.pathDirectories, "Directorios", nameCategory, "NombreCategoria").then(data => {
        this.servicio.getOnDataByList(data["Directorios"], nameDirectorie, "NombreDirectorio").then(data => {
          resolve(data);
        }).catch(err => reject(null));
      });
    }).catch(error => {
      console.error(error);
    })
  }

  async getMyPoints(data) {
    var points = [];
    if (data.type === this.typs.ALL) {
      points = await this.dataBaseServices.getPoinst();
    } else if (data.value !== "") {
      points = await this.dataBaseServices.getPointById(data.value);
      this.title = points[0].nombre;
      this.namePoint = points[0].nombre;
      this.listenMap();
    } else {
      this.listenMap();
      this.isEdit = true;
      this.namePoint = "Nombre del Punto";
      this.point = null;
    }
    this.showMarkers(points, '/PuntosEstrategicos/Marcadores/', null, null, points[0].nombre);
    this.point = points.length > 0 ? points[0] : null;
  }

  showMarkers(markers, pathImageData, field, defaultMarker, name) {
    if (markers) {
      for (let i = 0; i < markers.length; i++) {
        let latLng = new google.maps.LatLng(field ? markers[i][field].lat : markers[i].lat, field ? markers[i][field].lng : markers[i].lng);
        var marker = new google.maps.Marker({
          position: latLng,
          icon: defaultMarker ? (this.pathImages + pathImageData + defaultMarker) :
            (this.pathImages + pathImageData + 'Marcador.png'),
          map: this.map
        });
        if (name) {
          marker = this.addInfoWindow(marker, name);
        } else if (markers[i].Nombre) {
          marker = this.addInfoWindow(marker, markers[i].Nombre);
        }
        this.markers.push(marker);
        if (markers.length === 1) {
          this.map.setCenter(latLng);
          this.map.setZoom(15);
        }
      }
    }
  }

  addInfoWindow (marker, title) {
    var infowindow = new google.maps.InfoWindow({
      content: title
    });
    marker.addListener('click', function() {
      infowindow.open(this.map, marker);
    });
    return marker;
  }

  changeRoute(sentido) {
    var res = this.line.Rutas.filter(route => {
      return route.Sentido === sentido;
    });
    this.showRoute(res[0]);
  }

  showRoute(route) {
    if (this.flightPath)
      this.flightPath.setMap(null);
    if (this.intervar) {
      window.clearInterval(this.intervar);
      this.intervar = null;
    }
    if (route) {
      var lineSymbol = {
        path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
        scale: 3,
        strokeColor: '#488aff'
      };
      var flightPath = new google.maps.Polyline({
        path: route.Puntos,
        icons: [{
          icon: lineSymbol,
          offset: '100%'
        }],
        geodesic: true,
        strokeColor: "#1858de",
        strokeOpacity: 1.0,
        strokeWeight: 2
      });
      this.sentido = route.Sentido;
      flightPath.setMap(this.map);
      this.flightPath = flightPath;
      this.animateCircle(flightPath);
    }
  }

  private animateCircle(line) {
    var count = 0;
    this.intervar = window.setInterval(function () {
      count = (count + 1) % 200;
      var icons = line.get('icons');
      icons[0].offset = (count / 2) + '%';
      line.set('icons', icons);
    }, 20);
  }

  /**
   * Recive Array of objects { tipo: 0 => Polyline (string) : 1 => Polygon(string), puntos: array<lat,lng>, color: "exadecimal"}
   * 
   * @param points 
   */
  showPolyLine(points) {
    points.forEach(element => {
      var fig;
      if (!element.tipo || element.tipo === "0") {
        fig = new google.maps.Polyline({
          path: element.Puntos,
          geodesic: true,
          strokeColor: element.color ? element.color : "#FF0000",
          strokeOpacity: 1.0,
          strokeWeight: 2
        });
      } else {
        fig = new google.maps.Polygon({
          path: element.Puntos,
          geodesic: true,
          strokeColor: element.color ? element.color : "#FF0000",
          strokeOpacity: 0.8,
          strokeWeight: 2,
          fillColor: element.color ? element.color : "#FF0000",
          fillOpacity: 0.35
        });
      }
      fig.setMap(this.map);
      this.polylines.push(fig);
    });
  }

  showParqueos(data, color) {
    let fig;
    fig = new google.maps.Polyline({
      path: data.puntos,
      geodesic: true,
      strokeColor: color || '#FF0000',
      strokeOpacity: 1.0,
      strokeWeight: 2,
      map: this.map
    });
    this.polylines.push(fig);
  }

  searchLineByPoint(pointData, point) {
    let latLng = { lat: pointData.Punto ? pointData.Punto.lat : pointData.lat, lng: pointData.Punto ? pointData.Punto.lng : pointData.lng };
    var data = { type: "Point", nameData: "PuntosEstrategicos", point: point, value: pointData.Nombre, field: "Nombre", pointData: latLng };
    this.router.navigate(['search-lines/', JSON.stringify(data)]);
  }

  slideChangedNext() {
    this.positionSlide++;
    this.showRoute(this.resultLines[this.positionSlide].Rutas[0]);
  }

  slideChanged() {
    this.flightPath.setMap(null);
    if (this.intervar)
      window.clearInterval(this.intervar);
  }

  slideChangedBefore() {
    this.positionSlide--;
    this.showRoute(this.resultLines[this.positionSlide].Rutas[0]);
  }

  savePoint() {
    var point = { id: this.data.value, nombre: this.namePoint, lat: this.markers[0].position.lat(), lng: this.markers[0].position.lng() };
    if (this.data.value === "") {
      this.dataBaseServices.addPoint(point).then(data => {
        this.router.navigate(['strategic-points/']);
      });
    } else {
      this.dataBaseServices.updatePoint(point).then(data => {
        this.router.navigate(['strategic-points/']);
      })
    }
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
