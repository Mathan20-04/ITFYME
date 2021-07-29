import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { DetailComponent } from './comp/detail/detail.component';
import { ListComponent } from './comp/list/list.component';
import { SubjectdetailComponent } from './comp/subjectdetail/subjectdetail.component';
import { SubjectlistComponent } from './comp/subjectlist/subjectlist.component';

@NgModule({
  declarations: [
    AppComponent,
    //StateMasterComponent,
    ListComponent,
    DetailComponent,
    SubjectdetailComponent,
    SubjectlistComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
  ],
  // providers: [],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }