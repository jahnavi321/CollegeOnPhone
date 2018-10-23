import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View, Image,
  TouchableOpacity, ScrollView
} from 'react-native';

import CardFlip from 'react-native-card-flip';


export default class StudentProfile extends Component<Props> {
  render() {
    return (
      <ScrollView>
      <View style={styles.container}>
        <CardFlip style={styles.cardContainer} ref={(card) => this.card = card} >
          <TouchableOpacity activeOpacity={1} style={[styles.card, styles.card1]} onPress={() => this.card.flip()} >
            <View style={{alignItems: 'center',justifyContent: 'center',flex: 1}}>
              <Image style={{ width:180, height:180, borderRadius:180/2}} source={require('./assets/college/college2.jpg')}/>
              <Text style={{fontSize:34, color: 'rgba(232,172,144,1)'}}>{`\n`}Name</Text>
            </View>
          </TouchableOpacity>
          <TouchableOpacity activeOpacity={1} style={[styles.card, styles.card2]} onPress={() => this.card.flip()} >
          
          <Text style={{fontSize:66}}>Scroll me plz</Text>
          <Text style={{fontSize:66}}>Scroll me plz</Text>
          <Text style={{fontSize:66}}>Scroll me plz</Text>
          <Text style={{fontSize:66}}>Scroll me plz</Text>
          
          </TouchableOpacity>
        </CardFlip>
      </View>
      </ScrollView>
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
    borderRadius: 5,
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
    backgroundColor: 'rgba(205,98,106,0.4)',
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