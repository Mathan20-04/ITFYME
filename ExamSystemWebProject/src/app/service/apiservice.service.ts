import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '../../environments/environment';
import {Observable} from 'rxjs';
import {catchError, map, retry, timeout} from 'rxjs/operators';
//import { HttpClient, HttpParams } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ApiserviceService {
  private httpClient;
  private baseURL = environment.BASE_URL;

  constructor(http: HttpClient) {
    this.httpClient = http;
  }

  // private buildHttpParams(params: any) : HttpParams {
  //   let httpParam = new HttpParams ;
  //   for (const key in params) {
  //     httpParam.set(key, params[key]) ;
  //   }
  //   return httpParam;
  // }

  getData(url:any, params:any) : Observable<any> {
    //httpparam : HttpParams = this.buildHttpParams(params) ;
    var data = null ;
    try {
      return this.httpClient.get(this.baseURL + url).pipe(
        map(response => {
          let a:any = response;
          if (a['response_object'] === undefined) {
            data = response;
          } else {
            data = a['response_object'];
          }
          return data;
        }),
        catchError(ex => {
          return ex;
        })
      );
    } catch (e) {
      throw(e);
    }
   }

  postData(url:any, json_key:string,  param:any) {
    var formDAtaObject: any = new FormData();
    formDAtaObject.append(json_key, JSON.stringify(param));
    return this.httpClient.post(this.baseURL + url,formDAtaObject).pipe(
      map(response =>{
        return response;
      }),
      catchError(ex=>{
        return ex;
      })
    );

    // this.httpClient.post(this.baseURL + url, formDAtaObject);
  }
}
