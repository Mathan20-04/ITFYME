import { Component, OnInit } from '@angular/core';
import { Subject } from 'src/app/model/subject.model';
import { SubjectserviceService } from 'src/app/service/subjectservice.service';
import {SubjectlistComponent} from '../subjectlist/subjectlist.component';
@Component({
  selector: 'app-subjectdetail',
  templateUrl: './subjectdetail.component.html',
  styleUrls: ['./subjectdetail.component.css']
})
export class SubjectdetailComponent implements OnInit {

 
  public mode: string = 'Start';
  public isDirty: boolean = false;
  public name :string="";
  public code :string="";
  public id:number= 1;
  //dropdown
  public subjectlist : Array<Subject> = [] ;
  public subject?: Subject;




  constructor(private stSvc: SubjectserviceService) { }

  ngOnInit(): void {
    this.mode = "Start" ;
    console.log(this.mode != 'Start') ; // return false
    this.isDirty = false ; 
    console.log(this.name);
    console.log(this.code);
    console.log(this.id);
  }

  onSelected(st: Subject) {
    this.mode = "Edit" ;
    this.name =st.getName() ;
    this.code = st.getCode() ;
    this.id = st.getSubjectid();
    console.log(this.mode);
  }

  addNew() {
    this.mode = 'Add' ;
    this.isDirty = false ;
  }
  Save() {
    console.log(this.mode);
    this.isDirty = false ;
    console.log(this.name + " " + this.code + " " );
    var param:any = {} ;
    param['name'] = this.name ;
    param['code'] = this.code ;
    // call the service method to fetch the data
    console.log(param);
    // return ;
    if (this.mode == 'Add') {
      this.stSvc.add("subject_json",param).subscribe(
        response => {
         console.log(response);
        },
        error1 => {
          console.log(error1);
        }
      );
    } else {
      param['subjectid'] = this.id ;
      this.stSvc.update("subject_json",param).subscribe(
        response => {
         console.log(response);
        },
        error1 => {
          console.log(error1);
        }
      );
    }
    this.mode = 'Start' ;
  }

  // Update() {
  //   this.mode = 'Start' ;
  //   this.isDirty = false ;
  //   console.log(this.name+""+this.code+""+this.id.toString);
  //   let param:any={};
  //   param['name']=this.name;
  //   param['code']=this.code;
  //   param['subjectid']=this.id;

  //   this.stSvc.update("subject_json",param).subscribe(
  //   response=>{
  //     console.log(response);
  //   },
  //   error1=>{
  //     console.log(error1);
  //   }
    
  //   );
  // }
  Delete() {
    this.mode = 'Start' ;
    this.isDirty = false ;
    console.log(this.name+""+this.code+""+this.id.toString);
    let param:any={};
    param['subjectid']=this.id;

    this.stSvc.delete("subject_json",param).subscribe(
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
    //console.log(param);
    this.stSvc.getList(param).subscribe(
      data=>{
            console.log(data);
            this.subjectlist=data;
            console.log(this.subjectlist);
          },
          error1=>{
            console.log(error1);
          }
    //  data=>{
    //     console.log(data);
    //   },
    //   error1=>{
    //     console.log(error1);
    //   }
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