import { listLazyRoutes } from '@angular/compiler/src/aot/lazy_routes';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DetailComponent } from './comp/detail/detail.component';
import { ListComponent } from './comp/list/list.component';
import { SubjectdetailComponent } from './comp/subjectdetail/subjectdetail.component';

const routes: Routes = [
  {path:"stateList",component : DetailComponent},
  {path:"subjectList",component : SubjectdetailComponent}
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }