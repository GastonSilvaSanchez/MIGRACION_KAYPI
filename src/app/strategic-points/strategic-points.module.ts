import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';
import { TranslateModule } from '@ngx-translate/core';
import { IonicModule } from '@ionic/angular';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { StrategicPointsPage } from './strategic-points.page';

const routes: Routes = [
  {
    path: '',
    component: StrategicPointsPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    TranslateModule,
    RouterModule.forChild(routes)
  ],
  providers:[KaypiServices],
  declarations: [StrategicPointsPage]
})
export class StrategicPointsPageModule {}
