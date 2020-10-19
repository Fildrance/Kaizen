import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { RootComponent } from './root.component';

import { SideNavInnerToolbarModule, SingleCardModule } from './layouts';

import { ScreenService, AppInfoService } from './shared/services';

@NgModule({
  declarations: [
    RootComponent
  ],
  imports: [
    BrowserModule,
    SideNavInnerToolbarModule,
    SingleCardModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [ScreenService, AppInfoService],
  bootstrap: [RootComponent]
})
export class RootModule { }
