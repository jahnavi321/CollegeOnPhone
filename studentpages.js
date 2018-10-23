import React from 'react';
import { StyleSheet, Text, Image , TextInput, KeyboardAvoidingView,Button} from 'react-native';
import View from 'react-native-view'
import StudentProfile from './studentprofile.js'
import Timetable from './StudentPages/timetable.js'
import Marks from './StudentPages/marks.js'
import Home from './StudentPages/Home.js'

export default class Studentpages extends React.Component{
	render(){
		return(
			<View flex vcenter hcenter>
				{(this.props.Name === "Profile") 
					? (<StudentProfile />) 
					: (
						(this.props.Name === "Home")
							? (<Home/>)
							: (
								(this.props.Name === "Fee Schedules")
								?(<Text> Fee Schedules </Text>)
								: (
									(this.props.Name === "Timetable")
									?(<Timetable/>)
									:(
										(this.props.Name === "Pre-class requirements")
										?(<Text> Pre-class requirements </Text>)
										:(
											(this.props.Name === "Marks")
											?(<Marks/>)
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