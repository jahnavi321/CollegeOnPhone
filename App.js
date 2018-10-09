import React from 'react';
import { StyleSheet, Text, View , Image , TextInput, KeyboardAvoidingView,Button,TouchableOpacity} from 'react-native';
import {
  createStackNavigator,
} from 'react-navigation';

import home from './home.js';
import login from './login.js';

const App = createStackNavigator({
     Home: { screen: home },
     Login: { screen: login },
      });

export default App; 
