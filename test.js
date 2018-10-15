import React from 'react';
import { StyleSheet, Text, View , Image , TextInput, KeyboardAvoidingView,Button} from 'react-native';

export default class Test extends React.Component{

	render(){
		return(
			<View>
				<Text> {this.props.Name}  Cards will be displayed here.  </Text>
            </View>
			);
	}
}