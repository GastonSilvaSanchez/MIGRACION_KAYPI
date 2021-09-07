import { Injectable } from '@angular/core';
import { CallNumber } from '@ionic-native/call-number/ngx';
import { ToastController } from '@ionic/angular';
import { LoadingController } from '@ionic/angular';
import { TranslateService } from '@ngx-translate/core';

@Injectable({
  providedIn: 'root'
})
export class ToolsService {
  loading: any;

  constructor(
    private translate: TranslateService,
    private callNumber: CallNumber,
    private toastController: ToastController,
    private loadingController: LoadingController
  ) {}

  callPhone(number) {
    return this.callNumber.callNumber(number, true);
  }

  translateValue(value) {
    let translateVal = '';
    this.translate.get(value).subscribe(data => {
      translateVal = data;
    });
    return translateVal;
  }

  async createToast(
    mensaje: string,
    tiempo: number,
    botonClose: boolean,
    position
  ) {
    const toast = await this.toastController.create({
      message: mensaje,
      duration: tiempo,
      closeButtonText: 'Ok',
      position: position,
      showCloseButton: botonClose
    });
    toast.present();
  }

  async presentLoading(mensaje, time) {
    const loading = await this.loadingController.create({
      message: mensaje,
      duration: time
    });
    await loading.present();
  }

  async showStaticLoading() {
    this.loading = await this.loadingController.create({
      message: this.translateValue('Cargando')
    });
    this.loading.present();
  }

  async closeStaticLoading() {
    this.loading.dismiss();
  }
}
