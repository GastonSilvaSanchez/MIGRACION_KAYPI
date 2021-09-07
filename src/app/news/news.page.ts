import { Component, OnInit } from '@angular/core';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { ConfigurationService } from '../services/Configuracion/configuration.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-news',
  templateUrl: './news.page.html',
  styleUrls: ['./news.page.scss'],
})
export class NewsPage implements OnInit {

  news: any = { Noticias: [] };
  traficNews: any = { Noticias: [] } ;
  trafic
  config: any;
  selected: string = "Novedades";

  constructor(private kaypiServices: KaypiServices, 
    private configuration: ConfigurationService,
    private router: Router) { }

  ngOnInit() {
    this.getConfiguration();
    this.getNews();
  }

  getConfiguration() {
    this.config = this.configuration.getConfig();
  }

  getNews() {
    var getNews = this.kaypiServices.getDataServer(this.config.host + this.config.pathNews.news);
    var getTrafic = this.kaypiServices.getDataServer(this.config.host + this.config.pathNews.trafic);
    Promise.all([getNews, getTrafic]).then(values => {
      if (values) {
        this.news = values[0];
        this.traficNews = values[1];
      }
    }).catch(err => console.error(err));
  }

  showPoint(trafic) {
    var data = { name: "Trafico", type: "one", value: trafic.titulo, field: "titulo"};
    this.router.navigate(['location/', JSON.stringify(data)]);
  }

}
