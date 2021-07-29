import { Injectable } from '@angular/core';
import { ApiserviceService } from './apiservice.service';
import {Observable} from 'rxjs';
import {catchError, map, retry, timeout} from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export abstract class BaseserviceService {

  // GetListPage - pageNum, pageSize and other parameters
  // GetList - ids
  // Get  - id
  // Add - object
  // Update - object
  // Delete - object


  protected url: string = "";

  constructor(private apiService: ApiserviceService) { }

  protected preGetListPage() {
  }

  // getListPage(paramsObject) {
  //   this.preGetListPage();
  //   return this.apiService.getData(this.url, paramsObject);
  // }

  // getListPage(paramsObject)  {
  //   this.preGetListPage();
  //   this.apiService.getData(this.url, paramsObject).subscribe(data => {
  //     console.log(data) ;
  //     // return data ;
  //     return this.postGetListPage(paramsObject)
  //   },
  //   );

  // }

  getListPage(paramsObject:any) : Observable<any> {
    this.preGetListPage();

    return this.apiService.getData(this.url, paramsObject)
      .pipe(
        map(response => {
          return this.postGetListPage(response);
        }),
        catchError(ex => {
          return ex;
        })
      );
     
 }
 protected postGetListPage(responseJson:any) {
  return responseJson;
}


//ADD
 protected preAdd(){

 }
 protected postAdd(response:any){
   return response;

 }
 add(json_key:string,paramsObject:any) : Observable<any> {
  this.preAdd();

  return this.apiService.postData(this.url,json_key, paramsObject)
    .pipe(
      map(response => {
        return this.postAdd(response);
      }),
      catchError(ex => {
        return ex;
      })
    );
}
 

//upadate
protected preUpdate(){

}
protected postUpdate(response:any){
  return response;

}

update(json_key:string,paramsObject:any) : Observable<any> {
 this.preUpdate();

 return this.apiService.postData(this.url,json_key, paramsObject)
   .pipe(
     map(response => {
       return this.postUpdate(response);
     }),
     catchError(ex => {
       return ex;
     })
   );
}

//delete
protected preDelete(){

}
protected postDelete(response:any){
  return response;

}
delete(json_key:string,paramsObject:any) : Observable<any> {
  this.preDelete();
 
  return this.apiService.postData(this.url,json_key, paramsObject)
    .pipe(
      map(response => {
        return this.postDelete(response);
      }),
      catchError(ex => {
        return ex;
      })
    );
 }


//gelist

protected preGetList(){

}
protected postGetList(response:any){
  return response;

}
getList(paramsObject:any) : Observable<any> {
 this.preGetList();

 return this.apiService.getData(this.url, paramsObject)
   .pipe(
     map(response => {
       return this.postGetList(response);
     }),
     catchError(ex => {
       return ex;
     })
   );
}


}