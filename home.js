import React from 'react';
import { Animated, StyleSheet, Text, View , Image , TextInput, ImageBackground,Dimensions, KeyboardAvoidingView,Button,TouchableOpacity} from 'react-native';
import {
  createStackNavigator,
} from 'react-navigation';
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

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
            user:'',
            id:0,
            test:false,
        };
  }
  static navigationOptions = {
    title: 'IIITS',
    headerStyle:{ backgroundColor: '#563947'},
    headerTitleStyle:{ color: '#d4e7c2'},
};
  render() {
    const { navigate } = this.props.navigation;

    return ( 
      
        <ImageBackground source={require('./assets/college/college2.jpg')}  style={{flex: 1,height: '100%' ,width: '100%',alignItems: 'center', justifyContent: 'center'}} >
              <View style={styles.container}>

                <View>
                  <Text style={{fontSize:35,fontWeight:'bold',color:'#563947',textAlign:'auto'}}>CollegeOnPhone</Text>
                  <Text>{`\n`}</Text>
                </View>
                <View>
                  <Image source={require('./assets/logo.png')} style={styles.image} />
                  <Text>{`\n\n`}</Text>
                </View>

                <View>
                <FadeInView>
                <TouchableOpacity>
                  

                  <Button
                      style={{width:600,justifyContent: 'center'}}
                      onPress={() =>
                                navigate('StudentLogin', { name: 'Jane' })}
                      title="Student login"
                      color="#cd626a"
                      accessibilityLabel="Student"/>
                      </TouchableOpacity>
                  </FadeInView>
                
                
                
                 
                </View>
              </View>
            </ImageBackground>
        );
      }
}

const styles = StyleSheet.create({
  WebViewStyle:
 {
    justifyContent: 'center',
    alignItems: 'center',
    flex:1,
    //marginTop: (Platform.OS) === 'ios' ? 20 : 0
 },
  backgroundImage: {
    resizeMode: 'cover', // or 'stretch'
  },
  image: {
    width: 130, 
    height: 150,
    justifyContent: 'center',
    alignItems: 'center',
  },
  container: {
    flex: 1,
    //backgroundColor:'#563947',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
