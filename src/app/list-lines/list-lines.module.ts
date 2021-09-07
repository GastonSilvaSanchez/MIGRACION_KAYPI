import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';
import { KaypiServices } from '../services/Kaypi-Services/kaypi.service';
import { TranslateModule } from '@ngx-translate/core';

import { ListLinesPage } from './list-lines.page';

const routes: Routes = [
  {
    path: '',
    component: ListLinesPage
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
  declarations: [ListLinesPage]
})
export class ListLinesPageModule {}
