import React from 'react';
import { StyleSheet, Text, View , Image , TextInput, KeyboardAvoidingView,Button,TouchableOpacity} from 'react-native';
import {
  createStackNavigator,
} from 'react-navigation';


export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
            user:'',
            id:''
        };
  }
  static navigationOptions = {
    title: 'Welcome',
    headerStyle:{ backgroundColor: '#563947'},
    headerTitleStyle:{ color: '#d4e7c2'},
};
  render() {
    const { navigate } = this.props.navigation;
    return ( 
              <View style={styles.container}>
                <View>
                  <Text style={{fontSize:35,fontWeight:'bold',color:'#d4e7c2',textAlign:'auto'}}>CollegeOnPhone</Text>
                  <Text>{`\n`}</Text>
                </View>
                <View>
                  <Image source={require('./assets/logo.png')} style={styles.image} />
                  <Text>{`\n\n`}</Text>
                </View>

                <View>
                <TouchableOpacity>
                  <Button
                      style={ {width:500 }}
                      onPress={() =>
                                navigate('Login', { name: 'Jane' })}
                      title="           Admin           "
                      color="#cd626a"
                      accessibilityLabel="Admin"/>
                  <Text>{`\n`}</Text>
                  <Button
                      style={{width:500}}
                      onPress={() =>
                                navigate('Login', { name: 'Jane' })}
                      title="           Faculty           "
                      color="#cd626a"
                      accessibilityLabel="Faculty"/>
                  <Text>{`\n`}</Text>
                  <Button
                      style={{width:500}}
                      onPress={() =>
                                navigate('Login', { name: 'Jane' })}
                      title="           Student             "
                      color="#cd626a"
                      accessibilityLabel="Student"/>
                      </TouchableOpacity>
                </View>
              </View>
        );
      }
}

const styles = StyleSheet.create({
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
    backgroundColor:'#563947',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
