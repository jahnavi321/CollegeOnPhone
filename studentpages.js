import React from 'react';
import { StyleSheet, Text, Image , TextInput, KeyboardAvoidingView,Button} from 'react-native';
import View from 'react-native-view'
import StudentProfile from './studentprofile.js'
import Timetable from './StudentPages/timetable.js'
import AssignProj from './StudentPages/assignProj.js'
import Req from './StudentPages/req.js'
import Marks from './StudentPages/displaymarks.js'
import Home from './StudentPages/Home.js'
import Fav from './StudentPages/fav.js'
import CReq from './StudentPages/classReschedule.js'
import Check from './StudentPages/check.js'
//

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
								?(<Check/>)
								: (
									(this.props.Name === "Timetable")
									?(<Timetable/>)
									:(
										(this.props.Name === "Pre-class requirements")
										?(<Req/>)
										:(
											(this.props.Name === "Marks")
											?(<Marks/>)
											:(
												(this.props.Name === "Assignments/projects")
												?(<AssignProj/>)	
												:(
													(this.props.Name === "Favorites")
													?(<Fav/>)
													:(<CReq/>)
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