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