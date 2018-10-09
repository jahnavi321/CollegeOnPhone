import React from 'react';
import { StyleSheet, Text, View , Image , TextInput, KeyboardAvoidingView,Button} from 'react-native';

export default class login extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
            route: 'Login',
            username: '',
            password: ''
        };
  }
  static navigationOptions = {
    title: 'Login',
  };
  render() {
    const { navigate } = this.props.navigation;
    return ( 

              <KeyboardAvoidingView style={styles.container} behavior="padding" enabled>
              <View style={styles.container}>
                <View>
                  <Image source={require('./assets/logo.png')} style={styles.image} />
                  <Text>{`\n`}</Text>
                </View>
              <View>
                <Text style={{fontSize:20,fontWeight:'bold',color:'#d4e7c2',textAlign:'auto'}}>User Name</Text>
                <TextInput
                    style={{width : 300 ,height:40,borderColor: 'gray', borderWidth: 2, borderRadius: 10,textAlign:'center',  marginBottom: 20, fontSize: 18 , backgroundColor:"#f2f2f2"}} 
                    placeholder='Username'
                    autoCapitalize='none'
                    autoCorrect={false} 
                    autoFocus={true} 
                    keyboardType='email-address'
                    value={this.state.username} 
                    onChangeText={(text) => this.setState({ username: text })} />
                <Text style={{fontSize:20,fontWeight:'bold',color:'#d4e7c2',textAlign:'auto'}}>password</Text>
                <TextInput
                    style={{width : 300,width : 300 ,height:40,borderColor: 'gray', borderWidth: 2, borderRadius: 10,textAlign:'center',  marginBottom: 20, fontSize: 18 , backgroundColor:"#f2f2f2",backgroundColor:"#f2f2f2"}} 
                    placeholder='Password'
                    autoCapitalize='none'
                    autoCorrect={false} 
                    secureTextEntry={true} 
                    value={this.state.password} 
                    onChangeText={(text) => this.setState({ password: text })} />
              </View>
              </View>
              </KeyboardAvoidingView>
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
