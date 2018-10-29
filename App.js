import React from 'react';
import { StyleSheet, Text, View , Image , TextInput, KeyboardAvoidingView,Button,TouchableOpacity} from 'react-native';
import {
  createStackNavigator,
} from 'react-navigation';

import home from './home.js';
import studentlogin from './studentlogin.js';
import adminlogin from './adminlogin.js';
import facultylogin from './facultylogin.js';
import studentnav from './studentnav.js'

const App = createStackNavigator({
     Home: { screen: home },
     StudentLogin: {screen: studentlogin},
     AdminLogin: {screen: adminlogin},
     FacultyLogin: {screen: facultylogin},
     StudentNav: {screen: studentnav}
      });

export default App; 


// brown  
// #563947  rgba(86,57,71,1)

// pink
// #cd626a  rgba(205,98,106,1)

// peech
// #e8ac90  rgba(232,172,144,1)

// cement
// #d4e762 rgba(212,231,98,1)

//cream
//#f5f9d9

// import React, { Component } from 'react';
// const axios = require('axios');
// import { TouchableOpacity, View, ActivityIndicator, Text, Alert} from 'react-native';
// export default class App extends Component {
// handlePress = async () => {
//   let res = await axios.get("http://192.168.43.137:8000/api/admin/1");
//   if(res.status == 200){
//     console.log(res.data);
//     // console.log(res.data[2]["SlNo"]);
//   }
//   else{
//     console.log(res);
//   }
//   res =  await axios.post("http://192.168.43.137:8000/api/post_check/",{
//     "vaishnavi": "bhaishnavi",
//   });
//   if(res.status==200){
//     console.log(res.data);
//   }
//   else{
//     console.log(res);
//   }
  
// }
//   render(){
//   return(
//    <View style={{paddingTop: 50, paddingLeft: 50 }}>
//    <Text> Some other tex--*--t </Text>
//     <Text> Some other text </Text>
//     <TouchableOpacity onPress={this.handlePress}>
//      <Text style={{paddingTop: 50, paddingLeft: 50, color: '#FF0000'}}> Click me to see the name </Text>
//     </TouchableOpacity>
// </View> 
//   );
// }
// }


