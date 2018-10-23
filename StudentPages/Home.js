import React, { Component } from 'react';
import {Dimensions, ScrollView} from 'react-native';
import { Container, StyleSheet, Header, Content, Card, CardItem, Text, Body} from 'native-base';
const {width: WIDTH} = Dimensions.get('window')

export default class Home extends Component {
  render() {
    return (
      <Container style={{ width:WIDTH, backgroundColor:'#f5f9d9', borderRadius:10}}>
        <Header />
        <ScrollView>
        <Content>
          <Card>
            <CardItem style={{ backgroundColor: 'rgba(205,98,106,0.7)' }} header>
              <Text>NativeBase fhdjrnjhfjd</Text>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.5)' }}>
              <Body>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text><Text>
                  //Your text here
                </Text>
              </Body>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.7)' }} footer>
              <Text>GeekyAnts fhdjg fdfgjhdf gkjdh</Text>
            </CardItem>
         </Card><Card>
            <CardItem style={{ backgroundColor: 'rgba(205,98,106,0.7)' }} header>
              <Text>NativeBase fhdjrnjhfjd</Text>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.5)' }}>
              <Body>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text><Text>
                  //Your text here
                </Text>
              </Body>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.7)' }} footer>
              <Text>GeekyAnts fhdjg fdfgjhdf gkjdh</Text>
            </CardItem>
         </Card>
         <Card>
            <CardItem style={{ backgroundColor: 'rgba(205,98,106,0.7)' }} header>
              <Text>NativeBase fhdjrnjhfjd</Text>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.5)' }}>
              <Body>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text><Text>
                  //Your text here
                </Text>
              </Body>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.7)' }} footer>
              <Text>GeekyAnts fhdjg fdfgjhdf gkjdh</Text>
            </CardItem>
         </Card>

         <Card>
            <CardItem style={{ backgroundColor: 'rgba(205,98,106,0.7)' }} header>
              <Text>NativeBase fhdjrnjhfjd</Text>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.5)' }}>
              <Body>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text><Text>
                  //Your text here
                </Text>
              </Body>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.7)' }} footer>
              <Text>GeekyAnts fhdjg fdfgjhdf gkjdh</Text>
            </CardItem>
         </Card>
         <Card>
            <CardItem style={{ backgroundColor: 'rgba(205,98,106,0.7)' }} header>
              <Text>NativeBase  fdsfj fdsfh fdsjk fhdjrnjhfjd</Text>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.5)' }}>
              <Body>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text>
                <Text>
                  //Your text here
                </Text><Text>
                  //Your text here
                </Text>
              </Body>
            </CardItem>
            <CardItem style={{ backgroundColor: 'rgba(232,172,144,0.7)' }} footer>
              <Text>GeekyAnts fhdjg  dfd fdjfkk sfsfdfgjhdf gkjdh</Text>
            </CardItem>
         </Card>
        </Content>
        </ScrollView>
      </Container>

      
    );
  }
}