import { Injectable } from '@angular/core';
import { ApiserviceService } from './apiservice.service';
import {HttpParams} from '@angular/common/http';
import {environment} from '../../environments/environment';
import { BaseserviceService } from './baseservice.service';
import { Subject } from '../model/subject.model';


@Injectable({
  providedIn: 'root'
})
export class SubjectserviceService  extends BaseserviceService{

  private _urlSubjectList = 'subject/get-list-object-page';
  private _urlSubjectAdd =  'subject/add';
  private _urlSubjectUpdate =  'subject/update';
  private _urlSubjectDelete =  'subject/delete';
  private _urlSubjectGetlist = 'subject/get-list';

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
    this.url = this._urlSubjectList;
  }

  getModel(obj:any) {
    let subject = new Subject();
    subject.setSubjectid(obj['subjectid']);
    subject.setCode(obj['code']);
    subject.setName(obj['name']);
    // subject.ID = obj['subjectid'];
    // subject.Name= obj['name'];
    // subject.Code = obj['code'];
    return subject ;
  }

  postGetListPage(responseJson:any) {
    console.log(responseJson);
    console.log(responseJson.data.length);
    if (responseJson != null) {
      var subjectList = [];
      for (var i = 0; i < responseJson.data.length; i++) {
        let model = this.getModel(responseJson.data[i]);
        subjectList.push(model);
      }
      return subjectList;
    } else {
      return null;
    }
  }
  preAdd(){
    this.url=this._urlSubjectAdd;
  }
  preGetlist(){
    this.url=this._urlSubjectGetlist;
  }
  preUpdate(){
    this.url=this._urlSubjectUpdate;
  }
  preDelete(){
    this.url=this._urlSubjectDelete;
  }

}