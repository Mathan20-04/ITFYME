import { Component, EventEmitter, HostListener, OnInit, Output } from '@angular/core';
import { Subject } from 'src/app/model/subject.model';
import { SubjectserviceService } from 'src/app/service/subjectservice.service';

@Component({
  selector: 'app-subjectlist',
  templateUrl: './subjectlist.component.html',
  styleUrls: ['./subjectlist.component.css']
})
export class SubjectlistComponent implements OnInit {

  public subjectList : Array<Subject> = [] ; // stores all the subject instances in the Array
  pageNum : number = 1 ;
  pageSize : number = 50;
  numPage: number = 1 ;

  @Output() subjectSelected = new EventEmitter<Subject>();

  constructor(private stSvc: SubjectserviceService) { } // I need subjectService for fetching the subjects

  // component life cycle learn
  ngOnInit(): void {
    this.getData(); // please fetch my data so that i can bind the data to subjectlist view
  }

  selected(item: Subject) {
    this.subjectSelected.emit(item);
  }


  getData() {
    let param:any= {} ;
    param['page_num'] = this.pageNum ;
    param['page_size'] = this.pageSize;

    // call the service method to fetch the data
    this.stSvc.getListPage(param).subscribe(
      data => {
       console.log(data);
       this.subjectList = data ;
      },
      error1 => {
        console.log(error1);
      }
    );
  }
  @HostListener('window:scroll', ['$event'])
  onScrollDown(event:any) {
    console.log(this.numPage);
    console.log(this.pageNum);
    if (this.numPage <= this.pageNum) {
      this.pageNum++ ;
      this.getData();
    }
    console.log("scrolled!!!")
    console.log(event);
  }
}
