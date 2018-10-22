import React from 'react';
import { StyleSheet, Text, Image , TextInput, KeyboardAvoidingView,Button} from 'react-native';
import View from 'react-native-view'
import StudentProfile from './studentprofile.js'

export default class Studentpages extends React.Component{
	render(){
		return(
			<View flex vcenter hcenter>
				{(this.props.Name === "Profile") 
					? (<StudentProfile />) 
					: (
						(this.props.Name === "Home")
							? (<Text> Home </Text>)
							: (
								(this.props.Name === "Fee Schedules")
								?(<Text> Fee Schedules </Text>)
								: (
									(this.props.Name === "Timetable")
									?(<Text> Timetable </Text>)
									:(
										(this.props.Name === "Pre-class requirements")
										?(<Text> Pre-class requirements </Text>)
										:(
											(this.props.Name === "Marks")
											?(<Text> Marks </Text>)
											:(
												(this.props.Name === "Assignments/projects")
												?(<Text> Assignments/projects </Text>)	
												:(
													<Text>Class-reschedules</Text>
												)
											)
										)
									)
								)
							)
					) 
				}
            </View>
			);
	}
}