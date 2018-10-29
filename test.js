// import React from 'react';
// import {
//   Text,
//   View,
// } from 'react-native';
// import Swiper from 'react-native-swiper-animated';

// const styles = {
//   wrapper: {
//     backgroundColor: '#009688',
//   },
//   slide1: {
//     flex: 1,
//     justifyContent: 'center',
//     alignItems: 'center',
//     backgroundColor: '#e91e63',
//   },
//   slide2: {
//     flex: 1,
//     justifyContent: 'center',
//     alignItems: 'center',
//     backgroundColor: '#673ab7',
//   },
//   slide3: {
//     flex: 1,
//     justifyContent: 'center',
//     alignItems: 'center',
//     backgroundColor: '#3f51b5',
//   },
//   text: {
//     color: '#fff',
//     fontSize: 30,
//     fontWeight: 'bold',
//   },
// };

// export default class Test extends React.Component{
// 	render(){
// 		return(

//  <Swiper
//   style={styles.wrapper}
//   smoothTransition
//   loop
// 	>
//   <View style={styles.slide1}>
//     <Text style={styles.text}>Hello Swiper</Text>
//   </View>
//   <View style={styles.slide2}>
//     <Text style={styles.text}>Beautiful</Text>
//   </View>
//   <View style={styles.slide3}>
//     <Text style={styles.text}>And simple</Text>
//   </View>
// </Swiper>
// );
// }
// }

import React, { Component } from 'react';
import {Dimensions, ScrollView, View, Animated, Easing} from 'react-native';
import { Container, StyleSheet, Header, Content, Card, CardItem, Left, Text, Right, Body} from 'native-base';
import MAIcon from 'react-native-vector-icons/MaterialIcons'

const {width: WIDTH} = Dimensions.get('window')

export default class Home extends Component {
  constructor(props){
    super(props);
    this.state={
      starPress:false,
      starPress1:false
    }
  }

  componentWillMount(){
    this.animatedValue =  new Animated.Value(100);

  }

  componentDidMount(){
    Animated.timing(this.animatedValue,{
      toValue: 150,
      duration: 3000,
      easing: Easing.bounce
    }).start()
  }
  render() {
    const animatedStyle = { height: this.animatedValue}
    return (
      <Container style={{ width:WIDTH-30,  borderRadius:10}}>
        <Header />
        <ScrollView>
        <Animated.View style = {[styles.box, animatedStyle]}/>
        <Content>
         
          <Card>
            
            <CardItem style={{ backgroundColor: 'rgba(205,98,106,0.7)' }} header>
              <Text>Admin-01</Text>
            </CardItem>
            <CardItem style={{ backgroundColor: '#dee1e5' }}>
              <Body>
                <Text style={{ fontSize: 10}}>4:01 PM, 24-10-2018</Text>
                <Text style={{ fontSize: 22}}>
                  Sports meet
                </Text>
                <Text>
                  Director sir is our chief guest.
                </Text>
                <Text>
                  Please do attend the meet and cheer for your buddies.
                </Text><Text>
                  Enjoy, Thumps up.
                </Text>
              </Body>
            </CardItem>
            <CardItem style={{ backgroundColor: '#b8bdc4' }} footer>
              <Left>
              <Text>Venue and Timings: Basketball court, 7pm 25-10-2018</Text>
              </Left>
              <Right style={{paddingRight:0.5}}>

              {this.state.starPress
                ?(<MAIcon name='star' size={40} color='#563947' onPress={ () =>this.setState({starPress:false}) } />)
                :(<MAIcon name='star-border' size={40} color='#563947' onPress={ () =>this.setState({starPress:true}) } />)
              }
              </Right>
            </CardItem>
            
         </Card>
         
        <Card>
            
            <CardItem style={{ backgroundColor: 'rgba(205,98,106,0.7)' }} header>
              <Text>Admin-02</Text>
            </CardItem>
            <CardItem style={{ backgroundColor: '#dee1e5' }}>
              <Body>
                <Text style={{ fontSize: 10}}>4:01 PM, 24-10-2018</Text>
                <Text style={{ fontSize: 22}}>
                  Sports meet
                </Text>
                <Text>
                  Director sir is our chief guest.
                </Text>
                <Text>
                  Please do attend the meet and cheer for your buddies.
                </Text><Text>
                  Enjoy, Thumps up.
                </Text>
              </Body>
            </CardItem>
            <CardItem style={{ backgroundColor: '#b8bdc4' }} footer>
              <Left>
              <Text>Venue and Timings: Basketball court, 7pm 25-10-2018</Text>
              </Left>
              <Right style={{paddingRight:0.5}}>

              {this.state.starPress1
                ?(<MAIcon name='star' size={40} color='#563947' onPress={ () =>this.setState({starPress1:false}) } />)
                :(<MAIcon name='star-border' size={40} color='#563947' onPress={ () =>this.setState({starPress1:true}) } />)
              }
              </Right>
            </CardItem>
            
         </Card>
         
         
        </Content>
        
        </ScrollView>
      </Container>

      
    );
  }
}



const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center'
  },

  box: {
    width:300,
    height:300
  }
})
