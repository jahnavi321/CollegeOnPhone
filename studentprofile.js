import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View, Image,
  TouchableOpacity, ScrollView
} from 'react-native';

import CardFlip from 'react-native-card-flip';
const axios = require('axios');

export default class StudentProfile extends Component<Props> {
  constructor(props){
    super(props);
    this.state={
      array : [],
      gdict: {}
    }
  }
  studentData = (res) =>{
    let count = Object.keys(res).length;
    let temp = res.data;
    let array2=[];
    dict={};
    console.log(temp);
    for(let i=0;i<count;i++){
      if(temp[i]["slno"]===3){
        console.log("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        dict["name"]= temp[i]["name"];
        dict["dob"]= temp[i]["dob"];
        dict["email"]= temp[i]["email"];
        dict["mobilenum"]= temp[i]["mobilenum"];
        dict["studentdegree"]= temp[i]["studentdegree"];
        dict["student_id"]= temp[i]["student_id"];
        if(temp[i]["deptid"]===2){
          dict["deptname"]= "CSE";
        }
        else if(temp[i]["deptid"]===3){
          dict["deptname"]= "ECE";
        }
        else{
          dict["deptname"]= "ALL";
        }
        array2.push(dict);
        console.log(array2);
        break;
      }
    }
    this.setState({array:array2});
    this.setState({gdict:dict});
    console.log(this.state.gdict);
  }



  handlePress = async () => {
    let self=this;
    console.log("entered function");

    await axios.get("http://192.168.43.137:8000/api/student/").then(res => {
      self.studentData(res);
      //console.log("Hit API ___________________________");
    })
    //let array2 = [{'key1':'value1','key11':'value11'},{'key1':'value2','key11':'value22'}];

    //this.setState({array:array2})
    
  }

  componentWillMount(){
    this.handlePress();
  }


  render() {
    let self=this;
    return (
     
      <View style={styles.container}>
        <CardFlip style={styles.cardContainer} ref={(card) => this.card = card} >
          <TouchableOpacity activeOpacity={1} style={[styles.card, styles.card1]} onPress={() => this.card.flip()} >
            <View style={{alignItems: 'center',justifyContent: 'center',flex: 1}}>
              <Image style={{ width:180, height:180, borderRadius:180/2}} source={require('./assets/college/college2.jpg')}/>
              <Text style={{fontSize:34, color: 'rgba(232,172,144,1)'}}>{`\n`}{this.state.gdict['name']}</Text>
            </View>
          </TouchableOpacity>
          <TouchableOpacity activeOpacity={1} style={[styles.card, styles.card2]} onPress={() => this.card.flip()} >
          
          <View style ={{ paddingTop:10, justifyContent:'center', alignItems:'center', backgroundColor:'rgba(205,98,106,0.8)', width:300}}>
          <Text style={{fontSize:28}}>{this.state.gdict['name']}</Text></View>
          <View style ={{alignItems:'center', justifyContent:'center', paddingTop:15}}>
          <Text style={{fontSize:22}}>Student ID:{this.state.gdict['student_id']}</Text>
          <Text style={{fontSize:20}}>{this.state.gdict['email']}</Text>
          <Text style={{fontSize:22}}>ph no:{this.state.gdict['mobilenum']}</Text>
          <Text style={{fontSize:22}}>Dept:{this.state.gdict['deptname']}</Text>
          <Text style={{fontSize:22}}>DoB:{this.state.gdict['dob']}</Text>
          </View>
          </TouchableOpacity>
        </CardFlip>
      </View>
      
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    //backgroundColor: '#F5FCFF',
  },
  cardContainer:{
    width: 300,
    height: 400,
    
  },
  card:{
    width: 300,
    height: 400,
    backgroundColor: '#FE474C',
    borderRadius: 25,
    shadowColor: 'rgba(0,0,0,0.5)',
    shadowOffset: {
      width: 0,
      height: 1
    },
    shadowOpacity:0.5,
  },
  // card: {
  // 	width: 300,
  // 	height: 400,
  //   borderWidth: 1,
  //   borderRadius: 2,
  //   borderColor: '#ffffff',
  //   borderBottomWidth: 0,
  //   shadowColor: '#000',
  //   shadowOffset: { width: 0, height: 2 },
  //   shadowOpacity: 0.8,
  //   shadowRadius: 2,
  //   elevation: 1,
  //   marginLeft: 5,
  //   marginRight: 5,
  //   marginTop: 10,
  // },
  card1: {
    backgroundColor: 'rgba(86,57,71,1)', 
  },
  card2: {
    backgroundColor: 'rgba(205,98,106,0.3)',
    // justifyContent: 'center',
    // alignItems: 'center',

  },
  label: {
    lineHeight: 400,
    textAlign: 'center',
    fontSize: 55,
    fontFamily: 'System',
    color: '#ffffff',
    backgroundColor: 'transparent',
  },
});