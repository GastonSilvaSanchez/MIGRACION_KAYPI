import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { ConfigurationService } from './services/Configuracion/configuration.service';

import { HttpClientModule, HttpClient } from '@angular/common/http';
import { TranslateModule, TranslateLoader } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { ToolsService } from './services/Tools/tools.service';
import { FcmService } from './services/Fcm-Service/fcm.service';

import { AngularFireModule } from 'angularfire2';
import { AngularFirestoreModule } from 'angularfire2/firestore';


//Native
import { CallNumber } from '@ionic-native/call-number/ngx';
import { SQLite, SQLiteObject } from '@ionic-native/sqlite/ngx';
import { Firebase } from '@ionic-native/firebase/ngx';
import { Geolocation } from '@ionic-native/geolocation/ngx';

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}

const firebase = {
  apiKey: 'AIzaSyBeGe1x-RoYg4c2yGeq5RXO642owbZrjOo',
  authDomain: 'kaypipush.firebaseapp.com',
  projectId: 'kaypipush',
  storageBucket: 'kaypipush.appspot.com',
  messagingSenderId: '266629492600'
};

@NgModule({
  declarations: [AppComponent],
  entryComponents: [],
  imports: [
    BrowserModule,
    HttpClientModule,
    AngularFireModule.initializeApp(firebase),
    AngularFirestoreModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      }
    }),
    IonicModule.forRoot(),
    AppRoutingModule
  ],
  providers: [
    StatusBar,
    CallNumber,
    SQLite,
    ConfigurationService,
    ToolsService,
    SplashScreen,
    Firebase,
    Geolocation,
    FcmService,
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
