import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { TranslateModule } from '@ngx-translate/core';
import { IonicModule } from '@ionic/angular';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';

import { DirectoryInformationPage } from './directory-information.page';

const routes: Routes = [
  {
    path: '',
    component: DirectoryInformationPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    TranslateModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  providers: [KaypiServices],
  declarations: [DirectoryInformationPage]
})
export class DirectoryInformationPageModule {}
