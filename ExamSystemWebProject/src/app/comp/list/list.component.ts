import { Component, OnInit } from '@angular/core';
import { State } from 'src/app/model/state.model';
import { StateserviceService } from 'src/app/service/stateservice.service';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.css']
})
export class ListComponent implements OnInit {

  public stateList : Array<State> = [] ; // stores all the state instances in the Array
  pageNum : number = 1 ;
  pageSize : number = 500;

  constructor(private stSvc: StateserviceService) { } // I need stateService for fetching the states

  // component life cycle learn
  ngOnInit(): void {
    this.getData(); // please fetch my data so that i can bind the data to list view
  }

  getData() {
    let param:any= {} ;
    param['pageNum'] = this.pageNum ;
    param['pageSize'] = this.pageSize;

    // call the service method to fetch the data
    this.stSvc.getListPage(param).subscribe(
      data => {
       console.log(data);
       this.stateList = data ;
      },
      error1 => {
        console.log(error1);
      }
    );
  }
}
