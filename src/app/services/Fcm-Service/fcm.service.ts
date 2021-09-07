import { Injectable } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { Firebase } from '@ionic-native/firebase/ngx';
import { AngularFirestore } from 'angularfire2/firestore';
import { ConfigurationService } from '../Configuracion/configuration.service';
import { Platform } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class FcmService {
  path: string;
  httpOptions: { headers: HttpHeaders } = {
    headers: new HttpHeaders({
      'Content-Type': 'application/x-www-form-urlencoded'
    })
  };
  usuario: any;
  loader: any;
  CONFIG: any;

  constructor(
    public http: HttpClient,
    public firebaseNative: Firebase,
    public afs: AngularFirestore,
    private platform: Platform,
    public configuration: ConfigurationService
  ) {
    this.getConfiguration();
  }

  getConfiguration() {
    this.CONFIG = this.configuration.getConfig();
    this.path = this.CONFIG.host + this.CONFIG.pathPushToken;
  }

  async getToken() {
    let token;
    if (this.platform.is('android')) {
      token = await this.firebaseNative.getToken();
    }
    if (this.platform.is('ios')) {
      token = await this.firebaseNative.getToken();
      await this.firebaseNative.grantPermission();
    }
    if (this.platform.is('cordova')) {
    }
    return this.saveTokenToFirestore(token);
  }

  private saveTokenToFirestore(token: any) {
    if (!token) {
      return;
    }
    const devicesRef = this.afs.collection('devices');
    const docData = {
      token
    };
    this.insertToken(token);
    return devicesRef.doc(token).set(docData);
  }

  listenToNotifications() {
    return this.firebaseNative.onNotificationOpen();
  }

  insertToken(token): Promise<any> {
    return new Promise((resolve, reject) => {
      const body: HttpParams = new HttpParams().set('tokenValor', token);
      this.http.post(this.path, body, this.httpOptions).subscribe(
        data => {
          resolve(data);
        },
        () => {
          reject(null);
        }
      );
    });
  }
}
