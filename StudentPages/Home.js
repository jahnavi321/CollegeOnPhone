import React, { Component } from 'react';
import {Dimensions, ScrollView, View, Animated, Image,Easing} from 'react-native';
import { Container, StyleSheet, Header, Content, Card, CardItem, Left, Text, Right, Body} from 'native-base';
import MAIcon from 'react-native-vector-icons/MaterialIcons'
const axios = require('axios');

const {width: WIDTH} = Dimensions.get('window')

class FadeInView extends React.Component {
  state = {
    fadeAnim: new Animated.Value(0),  // Initial value for opacity: 0
  }

  componentDidMount() {
    Animated.timing(                  // Animate over time
      this.state.fadeAnim,            // The animated value to drive
      {
        toValue: 1,                   // Animate to opacity: 1 (opaque)
        duration: 3000,              // Make it take a while
      }
    ).start();                        // Starts the animation
  }

  
  render() {
    let { fadeAnim } = this.state;

    return (
      <Animated.View                 // Special animatable View
        style={{
          ...this.props.style,
          opacity: fadeAnim,         // Bind opacity to animated value
        }}
      >
        {this.props.children}
      </Animated.View>
    );
  }
}


export default class Home extends Component {
  constructor(props){
    super(props);
    this.state={
      dummycount:20,
      starPress:false,
      starPress1:false,
      array : []
    }
  }

  cardData = (res) =>{
    console.log(res.status,"inside function");
    if(res.status == 200){
      console.log(res.data);
      
      let array2=res.data;
      //array2= res.data;
      //array2 = [{'key1':'value1','key11':'value11'},{'key1':'value2','key11':'value22'}];
      //let starPressarray: [];
      count = Object.keys(res.data).length;
      for(let i=0;i<count;i++){
        array2[i]['starPress'] = false;
      }
      console.log(array2);
      this.setState({array:array2})
      // this.setState( { dummycount: count });
      // for(let i=0;i<count;i++){
      //   starPressarray.push(false);
      // }
      
       //console.log(length(res.data[2]["SlNo"]));
    }
    else{
      console.log(res.status);
    }
  }

  starfun1 = (i) =>{
    let localarray=[];
     localarray = this.state.array;
      localarray[i]['starPress'] = false;
      this.setState({array:localarray});
      console.log("posted_false");
      
      count = Object.keys(localarray).length;
        
        localarray[i]['student_id'] = 1;
      
      console.log(localarray[i]);
      res =  axios.post("http://192.168.43.137:8000/api/post_favourites/",[localarray[i]]);
  }

  starfun2 = (i) =>{
    let localarray=[];
     localarray = this.state.array;
      localarray[i]['starPress'] = true;
      this.setState({array:localarray});
      console.log("posted_true");
      
      count = Object.keys(localarray).length;
      
        localarray[i]['student_id'] = 1;
      
      console.log(localarray[i]);
      res =  axios.post("http://192.168.43.137:8000/api/post_favourites/",[localarray[i]]);
  }


   handlePress = async () => {
    let self=this;
    console.log("entered function");

    await axios.get("http://192.168.43.137:8000/api/events/").then(res => {
      self.cardData(res);
    })
    //let array2 = [{'key1':'value1','key11':'value11'},{'key1':'value2','key11':'value22'}];

    //this.setState({array:array2})
    
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
              <Text>{self.state.array[i]["event_type"]}</Text> 
              <Right style={{paddingRight:0.5}}>
              
              {self.state.array[i]["starPress"]
                ?(<MAIcon name='star' size={40} color='#563947' onPress={ () =>self.starfun1(i) } />)
                :(<MAIcon name='star-border' size={30} color='#563947' onPress={ () =>self.starfun2(i) } />)
              }
              </Right>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.5)' }}>
              <Body>
                <Text style={{ fontSize: 10}}>{self.state.array[i]["post_time"]}</Text>
                <Text style={{ fontSize: 22}}>
                  {self.state.array[i]["event_name"]}
                </Text> 
                <Text style={{ fontSize: 18}}>
                  {self.state.array[i]["description"]}
                </Text> 
                
                  
              </Body>
            </CardItem>
            <CardItem style={{ backgroundColor: '#ffffff' }} header>
            <Text style={{ fontSize: 18}}>
                  Timings: {self.state.array[i]["event_datetime"]}
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



