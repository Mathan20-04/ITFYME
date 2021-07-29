import { Injectable } from '@angular/core';
import { ApiserviceService } from './apiservice.service';
import {HttpParams} from '@angular/common/http';
import {environment} from '../../environments/environment';
import { BaseserviceService } from './baseservice.service';
import { State } from '../model/state.model';


@Injectable({
  providedIn: 'root'
})
export class StateserviceService  extends BaseserviceService{

  private _urlStateListpage = 'state/get-list-object-page';
  private _urlStateAdd =  'state/add';
  private _urlStateList = 'state/get-list';

  private baseURL = environment.BASE_URL;

  constructor( api : ApiserviceService) {
    super(api);
  }
  private buildHttpParams(params: any) : Object {
    let httpParam = new HttpParams() ;
    for (const key in params) {
      httpParam.set(key, params[key]) ;
    }
    return httpParam;
  }

  preGetListPage(){
    this.url = this._urlStateListpage;
  }

  getModel(obj:any) {
    let state = new State();
    //state.setStateid(obj['stateid']);
    state.setCode(obj['code']);
    state.setName(obj['name']);
    // state.ID = obj['stateid'];
    // state.Name= obj['name'];
    // state.Code = obj['code'];
    return state ;
  }

  postGetListPage(responseJson:any) {
    console.log(responseJson);
    console.log(responseJson.data.length);
    if (responseJson != null) {
      var stateList = [];
      for (var i = 0; i < responseJson.data.length; i++) {
        let model = this.getModel(responseJson.data[i]);
        stateList.push(model);
      }
      return stateList;
    } else {
      return null;
    }
  }
  preAdd(){
    this.url=this._urlStateAdd;
  }
  preGetlist(){
    this.url=this._urlStateList;
  }

}
