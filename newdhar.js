import React, { Component } from 'react';
import { StyleSheet, View, ScrollView, Dimensions, Picker } from 'react-native';
import { Table, TableWrapper, Row } from 'react-native-table-component';
const axios = require('axios');

const {width: WIDTH} = Dimensions.get('window')
export default class Marks extends Component {
  constructor(props) {
    super(props);
    this.state = {
      tableHead: ['category', 'Marks'],
      widthArr: [200, 80],
      studentCourses : [],
      marksarray: [],
      tableDatafinal : []
    }
  }

 category =(res,studentarray, scourseids, scoursenames) => {
  
  let count1 = Object.keys(res.data).length;
  let assnames = res.data;
  let count2 = Object.keys(studentarray).length;
  let count3 = Object.keys(scourseids).length;
  for(let i=0;i<count2;i++){
    for(let j=0;j<count1;j++){
      if(studentarray[i]["assignment_id"] === assnames[j]["slno"]){
        studentarray[i]['category'] = assnames[j]["name"];
        break;
      }
    }
  }
  for(let i=0;i<count2;i++){
    for(let j=0;j<count3;j++){
      if(studentarray[i]["course_id"] === scourseids[j]){
        studentarray[i]['coursename'] = scoursenames[j];
      }
    }
  }
  this.setState({studentCourses:scoursenames});
  this.setState({marksarray:studentarray});
  console.log(assnames);
  

    let tableData = [];
    let count = Object.keys(studentarray).length;
    for(let i=0;i<count;i++){
      const rowData = [];
      if(studentarray[i]["coursename"]==="ASE2"){
        rowData.push(studentarray[i]["category"]);
        rowData.push(studentarray[i]["marks"]);
      }
      tableData.push(rowData);
    }
    this.setState({finaltableData:tableData});
    console.log("-----------------");
    console.log(tableData);
    this.setState({finaltableData:tableData});
  console.log( this.state.finaltableData);
  console.log("-----------------");

 }
 courseNames = (res, studentarray, courseids)=>{
  let self = this;
  //console.log("entered course names function");
 let count1 = Object.keys(res.data).length;
 let count2 = Object.keys(courseids).length;
 let courses = res.data;
 let scoursenames = [];
 let scourseids = [];
 
 
 for(let i=0;i<count1;i++){
  for(let j=0;j<count2;j++){
      if(courses[i]["course_id"]===courseids[j]){
          scourseids.push(courses[i]["course_id"]);
          scoursenames.push(courses[i]["course_name"]);
      }
  }
 }
 
 axios.get("http://192.168.43.137:8000/api/assignments/").then(res => {
        console.log("Hitting 4rd one");
        self.category(res,studentarray, scourseids, scoursenames);
      })
 }
 
 coursesList = (res, studentarray) => {
  let self=this;
  let count = Object.keys(res.data).length;
  let array2 = res.data;
  let courseids=[];
  for(let i=0;i<count;i++){
    if(array2[i]["sid"]===3){
        courseids.push(array2[i]["cid"]);
    }
  }
  axios.get("http://192.168.43.137:8000/api/course/").then(res => {
        console.log("Hitting 3rd one");
        self.courseNames(res,studentarray,courseids);
      })
  }

  marksData = (res) =>{
    let self=this;
    
    if(res.status == 200){
      let array2=res.data;
      let count = Object.keys(res.data).length;
      let studentarray=[];
      for(let i=0;i<count;i++){
        if(array2[i]["student_id"]===3){
            studentarray.push(array2[i]);
        }
      }
      //console.log("marksData done");
      //this.setState({array:array2});
      //console.log(studentarray);
      axios.get("http://192.168.43.137:8000/api/s_c_mapper/").then(res => {
        console.log("Hitting 2nd one");
        self.coursesList(res,studentarray);
      })
    }
    else{
      console.log(res.status);
    }
  }

  handlePress = async () => {
    let self=this;
    //console.log("entered function");

     await axios.get("http://192.168.43.137:8000/api/grades/").then(res => {
      self.marksData(res);
    })
    }
  componentWillMount(){
    this.handlePress();
  }

  render() {
    const state = this.state;
    // let tableData = [];
    // let studentcoursemarks = this.state.marksarray;
    // let count = Object.keys(studentcoursemarks).length;
    // for(let i=0;i<count;i++){
    //   const rowData = [];
    //   if(studentcoursemarks[i]["coursename"]==="ASE"){
    //     rowData.push(studentcoursemarks[i]["category"]);
    //     rowData.push(studentcoursemarks[i]["marks"]);
    //   }
    //   tableData.push(rowData);
    // }
    // console.log(studentcoursemarks,tableData);
    // for (let i = 0; i < 8; i += 1) {
    //   const rowData = [];
    //   for (let j = 0; j < 2; j += 1) {
    //     rowData.push(`${i}${j}`);
    //   }
    //   tableData.push(rowData);
    // }
  let self=this;
    return (
      
     
    
      <View style={styles.container}>

            <Picker
            selectedValue={this.state.language}
            style={{ height: 50, width: 140 }}
            onValueChange={(itemValue, itemIndex) => this.setState({language: itemValue})}>
            <Picker.Item label="ASE" value="ASE" />
            <Picker.Item label="ToC" value="ToC" />
            <Picker.Item label="IR" value="IR" />
            <Picker.Item label="DIP" value="DIP" />
            <Picker.Item label="Stats" value="Stats" />
            <Picker.Item label="DM" value="DM" />
            </Picker>
        <ScrollView horizontal={true}>
          <View>
            <Table borderStyle={{borderColor: '#C1C0B9'}}>
              <Row data={state.tableHead} widthArr={state.widthArr} style={styles.header} textStyle={styles.text}/>
            </Table>
            <ScrollView style={styles.dataWrapper}>
              <Table borderStyle={{borderColor: '#C1C0B9'}}>
                {self.state.finaltableData.map(function(x,i){
                  return (<Row
                      key={index}
                      data={rowData}
                      widthArr={state.widthArr}
                      style={[styles.row, index%2 && {backgroundColor: 'rgba(232,172,144,0.7)'}]}
                      textStyle={styles.text}
                    />)
                 })
               }
              </Table>
            </ScrollView>
          </View>
        </ScrollView>
      </View>
    )
  }
}
 
const styles = StyleSheet.create({
  container: { flex: 1, paddingTop: 60},
  header: { height: 50, backgroundColor: 'rgba(205,98,106,0.7)' },
  text: { textAlign: 'center', fontWeight: '100' },
  dataWrapper: { marginTop: -1 },
  row: { height: 40, backgroundColor: 'rgba(232,172,144,0.5)' }
});