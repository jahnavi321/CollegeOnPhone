import React, { Component } from 'react'
import { View, WebView, StyleSheet,Text } from 'react-native'
import {
  createStackNavigator,
} from 'react-navigation';
import StudentNavigation from './studentnav'

var token = '';

class studentlogin extends React.Component {
    constructor(props){
        super(props);
        this.state={value:true,
        }
    }
	static navigationOptions = {
    title: 'IIITS Student',
    headerStyle:{ backgroundColor: '#563947'},
    headerTitleStyle:{ color: '#d4e7c2'},
	};
    _onShouldStartLoadWithRequest = (e) => {
        let myurl = e.url
        console.log(e.url);
        const stripped = e.url.split('/')
        console.log( stripped[stripped.length-1])
        // if(e.url != "http://10.0.80.133:3000/login/5be32df126e7c300158688da" ) {
            
        //     this.setState({value:false})
        
        // }

        if(e.url != "https://serene-wildwood-35121.herokuapp.com/login/5be32df126e7c300158688da" ) {

            token = stripped[stripped.length-1];
            this.setState({value:false})
        
        }
    }
	
    render(){
        return (
            <View>
                {(token == '')
                ?(<View>
                     <Text>
                 </Text>
             <View style={{height: 500}}>
                 <WebView
                 automaticallyAdjustContentInsets={false}
                 source={{ uri: 'https://serene-wildwood-35121.herokuapp.com/login/5be32df126e7c300158688da' }}
                 //source={{ uri: 'http://10.0.80.133:3000/login/5be32df126e7c300158688da'}}
                 onShouldStartLoadWithRequest={this._onShouldStartLoadWithRequest}
                 onNavigationStateChange = {this._onShouldStartLoadWithRequest}
                 />
             </View>

                </View>)
                :(
			<View>
				<StudentNavigation/>
			</View>

) }
               
     
            </View>
        
        )
    }
  
}
export default studentlogin;

const styles = StyleSheet.create({
   container: {
      height: 350,
      alignItems: 'center'  
   }
})
