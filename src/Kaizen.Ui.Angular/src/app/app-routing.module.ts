import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';;
import { HomeComponent } from './pages/home/home.component';
import { DxButtonModule, DxTextBoxModule } from 'devextreme-angular';
import { SingleCardModule } from './layouts';
import { CommonModule } from '@angular/common';

const routes: Routes = [
  {
    path: 'home',
    component: HomeComponent
  },
  {
    path: '**',
    redirectTo: 'home'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes), CommonModule, DxTextBoxModule, DxButtonModule, SingleCardModule, DxTextBoxModule],
  exports: [RouterModule],
  declarations: [HomeComponent]
})
export class AppRoutingModule { }
