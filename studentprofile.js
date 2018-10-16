import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TouchableOpacity
} from 'react-native';

import CardFlip from 'react-native-card-flip';


export default class StudentProfile extends Component<Props> {
  render() {
    return (
      <View style={styles.container}>
        <CardFlip style={styles.cardContainer} ref={(card) => this.card = card} >
          <TouchableOpacity activeOpacity={1} style={[styles.card, styles.card1]} onPress={() => this.card.flip()} >
            <Text style={styles.label}>AB</Text>
          </TouchableOpacity>
          <TouchableOpacity activeOpacity={1} style={[styles.card, styles.card2]} onPress={() => this.card.flip()} >
            <Text style={styles.label}>CD</Text>
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
    backgroundColor: 'rgba(232,172,144,1)',
  },
  card2: {
    backgroundColor: 'rgba(205,98,106,1)',
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