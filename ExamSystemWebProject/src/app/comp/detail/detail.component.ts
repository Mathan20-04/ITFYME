import { Component, OnInit } from '@angular/core';
import { StateserviceService } from 'src/app/service/stateservice.service';
import {ListComponent} from '../list/list.component';
@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css']
})
export class DetailComponent implements OnInit {

 
  public mode: string = 'Start';
  public isDirty: boolean = false;
  public name:string ="name";
  public code:string ="code";
  public id : number=1;



  constructor(private stSvc: StateserviceService) { }

  ngOnInit(): void {
    this.mode = "Start" ;
    console.log(this.mode != 'Start') ; // return false
    this.isDirty = false ;
    console.log(this.name);
    console.log(this.code);
    console.log(this.id);
  }

  addNew() {
    this.mode = 'Add' ;
    this.isDirty = false ;
  }
  Save() {
    this.mode = 'Start' ;
    this.isDirty = false ;
    console.log(this.name+""+this.code+"");
    var param:any={};
    param['name']=this.name;
    param['code']=this.code;
    console.log(param);
    this.stSvc.add("state_json",param).subscribe(
      response=>{
        console.log(response);
      },
      error1=>{
        console.log(error1);
      }
    );
  }
  getList(){
    let param:any={};
    param['ids']="";
    console.log(param);
    this.stSvc.getList(param).subscribe(
     data=>{
        console.log(data);
      },
      error1=>{
        console.log(error1);
      }
    );
  }
  Cancel() {
    if (this.isDirty) {
      if (confirm("Do you want to cancel the operation? ")) {
        this.mode = 'Start';
      }
    } else {
      this.mode = 'Start';
    }
  }
  makeDirty() {
    this.isDirty = true ;
  }
}
