import { Component, OnInit } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { ActivatedRoute, Router } from '@angular/router';

declare var google;

@Component({
  selector: 'app-list-lines',
  templateUrl: './list-lines.page.html',
  styleUrls: ['./list-lines.page.scss'],
})
export class ListLinesPage implements OnInit {

  lines: any;
  config: any;
  points: any;
  pointOne: any;
  pointTwo: any;

  constructor(private servicio: KaypiServices, private configuration: ConfigurationService, private activatesRouter: ActivatedRoute) { 
    this.points = this.activatesRouter.snapshot.params.points;
    this.points = JSON.parse(this.points);
    this.pointOne = this.points.pointOne;
    this.pointTwo = this.points.pointTwo;
  }

  ngOnInit() {
    this.getConfiguration();
    let pOne = new google.maps.LatLng(this.pointOne.lat, this.pointOne.lng);
    let pTwo = new google.maps.LatLng(this.pointTwo.lat, this.pointTwo.lng);
    this.getLines(pOne, pTwo);
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  getLines(pOne, pTwo) {
    this.servicio.getLinesByPoints(pOne, pTwo).then(data => {
      this.lines = data;
    });
  }

}
