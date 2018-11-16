import React, { Component } from 'react';
import {Dimensions, ScrollView, View, Image,Animated, Easing} from 'react-native';
import { Container, StyleSheet, Header, Content, Card, CardItem, Left, Text, Right, Body} from 'native-base';
import MAIcon from 'react-native-vector-icons/MaterialIcons'
const axios = require('axios');

const {width: WIDTH} = Dimensions.get('window')

export default class AssignProj extends Component {
  constructor(props){
    super(props);
    this.state={
      dummycount:20,
      starPress:false,
      starPress1:false,
      array : []
    }
  }

  coursename = (res) => {
    let count = Object.keys(res.data).length;
    let coursearray = res.data;
    let temparray = this.state.array;

    let count2 = Object.keys(temparray).length;
    
    for(let i=0;i<count2;i++){
      for(let j=0;j<count;j++){
        if(coursearray[j]['course_id']===temparray[i]['course_id']){
          temparray[i]["course_name"] = coursearray[j]['course_name'];
        }
      }
      
    }
    
    this.setState({array:temparray.reverse()});
  }

  cardData = (res) =>{
    let self=this;
    console.log(res.status,"inside function");
    if(res.status == 200){
      console.log(res.data);
      let array2=res.data;
      let count = Object.keys(res.data).length;
      console.log(array2);
      this.setState({array:array2})
      axios.get("http://192.168.43.137:8000/api/course/").then(res => {
      self.coursename(res);
    })
    }
    else{
      console.log(res.status);
    }
  }

  
   handlePress = async () => {
    let self=this;
    console.log("entered function");

    await axios.get("http://192.168.43.137:8000/api/preclassreq/").then(res => {
      self.cardData(res);
    })
    }

  componentWillMount(){
    this.handlePress();
  }

 
  render() {
    let self = this;
    return (
      <View>
      <Container style={{ width:WIDTH-30,  borderRadius:10}} >

        <Header style={{ backgroundColor: '#ffffff'}}/>
        <View style={{alignItems: 'center'}}>
                  <Image source={require('../assets/logo.png')} style={{width: 30,height: 30}}/>
               
        </View>
        <ScrollView>
       
        <Content>
         {self.state.array.map(function(x,i){
          return (<Card key={i}>
            
            <CardItem style={{ backgroundColor: 'rgba(205,98,106,0.7)' }} header>
              <Text>{self.state.array[i]["course_name"]}</Text> 
              
            </CardItem>
            <CardItem style={{ backgroundColor: '#dee1e5' }}>
              <Body>
                <Text style={{ fontSize: 13}}>
                  {self.state.array[i]["post_time"]}
                </Text> 
                </Body>
            </CardItem>

            <CardItem style={{ backgroundColor: '#dee1e5' }}>
              <Body>
                
                 
                <Text style={{ fontSize: 18}}>
                  {self.state.array[i]["content"]}
                </Text> 
                
                  
              </Body>
            </CardItem>
            <CardItem style={{ backgroundColor: '#b6bec6' }} header>
            <Text style={{ fontSize: 18}}>
                  On: {self.state.array[i]["need_day"]}
                </Text>
            </CardItem>
         </Card>)
         })
       }
         
         
        </Content>
        
        </ScrollView>
      </Container>
      </View>
      
    );
  }
}



