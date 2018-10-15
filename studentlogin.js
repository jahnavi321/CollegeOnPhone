import React from 'react';
import { Animated, StyleSheet, Text, View , Image, Icon , TextInput, ImageBackground, KeyboardAvoidingView,Button,TouchableOpacity,Dimensions} from 'react-native';
import {
  createStackNavigator,
} from 'react-navigation';
import icons from 'react-native-vector-icons/Ionicons'

const {width: WIDTH} = Dimensions.get('window')
export default class App extends React.Component {
  
  
    constructor(){
      super();
      this.state={
        showPass: true,
        press: false
      }
    }

    showPass = () => {
      if(this.state.press == false){
        this.setState({ showPass: false, press: true})
      }
      else{
        this.setState({ showPass: true, press: false})
      }
    }
    static navigationOptions = {
    title: 'IIITS Student',
    headerStyle:{ backgroundColor: '#563947'},
    headerTitleStyle:{ color: '#d4e7c2'},
};
    render() {
      const { navigate } = this.props.navigation;
    return ( 
              <ImageBackground source={require('./assets/b-11.jpg')} style={styles.backgroundContainer}>
              <KeyboardAvoidingView style={styles.container} behavior="padding" enabled>
              <View style={styles.logocontainer}>
                  <Image source={require('./assets/logo.png')} style={styles.logo}/>
               
              </View>
                
              <View style ={styles.inputcontainer}>
      
                <TextInput
                  style ={styles.input}
                  placeholder={'Username'}
                  placeholderTextColor={'rgba(255,255,255,0.7)'}
                  underlineColorAndroid='transparent'
                />
              </View >

              <View style ={styles.inputcontainer}>
                <TextInput
                  style ={styles.input}
                  securityTextEntry={true}
                  placeholder={'Password'}
                  placeholderTextColor={'rgba(255,255,255,0.7)'}
                  underlineColorAndroid='transparent'
                />
                </View>
                
               <TouchableOpacity onPress={() => navigate('StudentNav', { name: 'Jane' })}style={styles.btnLogin}>
               <Text  style={styles.text}>Login</Text>
               </TouchableOpacity>
               </KeyboardAvoidingView>
              </ImageBackground>
            
        );
      }
}

const styles = StyleSheet.create({
  backgroundContainer: {
    flex: 1,
    //resizeMode: 'cover',
    alignItems: 'center',
    justifyContent: 'center',
  },
  

  logo: {
    width: 80,
    height: 80
  },

  logocontainer: {
    alignItems: 'center',
    marginTop: 30,
    marginBottom: 20
  },

  inputcontainer: {
    marginTop: 10,
  },
  input: {
       width: WIDTH-55,
       height: 45,
       borderRadius: 10,
       fontSize: 16,
       paddingLeft: 45,
       color: 'rgba(255,255,255,1)',
       backgroundColor: 'rgba(0,0,0,0.6)',
       
       marginHorizontal:5

  },
  
  
  btnLogin: {
       width: WIDTH-55,
       height: 45,
       borderRadius: 25,
       alignItems: 'center',
       backgroundColor: 'rgba(205,98,106,0.95)',
       justifyContent:'center',
       marginTop: 20,
       marginBottom: 100
  },

  text:{
    color: 'rgba(255,255,255,0.7)',
    fontSize: 24,
    textAlign: 'center'
  }
});
