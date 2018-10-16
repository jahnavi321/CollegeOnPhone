import React, { Component } from 'react';
import {Text} from 'react-native'
import View from 'react-native-view'
import FallingDrawer from 'react-native-falling-drawer'
import MAIcon from 'react-native-vector-icons/MaterialIcons'
import StudentProfile from './studentprofile.js'
import Test from './test.js'

const renderScreen = (text) => <View flex vcenter hcenter><StudentProfile Name={text} /></View>

const getScreen = (key, name, color, titleColor, hamburgerColor, iconName) => ({
  key,
  name,
  color,
  titleColor,
  hamburgerColor,
  render: () => renderScreen(name),
  customHeader: () => (
    <View row flex vcenter hcenter mdpt>
      <MAIcon name={iconName} size={30} color={titleColor} />
      <View mdpl />
      
     <Text style={{ color: titleColor, fontSize: 18 }}>{name}</Text>
    </View>
  )
})

const SCREENS = [
  getScreen("home1", "Home", "rgba(86,57,71,0.9)", "#fff", "#fff", "home"),
  getScreen("feeschedules", "Fee Schedules", "rgba(232,172,144,1)", "#fff", "#fff", "payment"),
  getScreen("timetable", "Timetable", "rgba(205,98,106,0.4)", "#fff", "#fff", "subtitles"),
  getScreen("preclassrequirements", "Pre-class requirements", "rgba(205,98,106,0.6)", "#fff", "#fff", "timer"),
  getScreen("marks", "Marks", "rgba(205,98,106,0.8)", "#fff", "#fff", "equalizer"),
  getScreen("assignments", "Assignments/projects", "rgba(86,57,71,0.4)", "#fff", "#fff", "edit"),
  getScreen("classreschedules", "Class-reschedules", "rgba(86,57,71,0.5)", "#fff", "#fff", "track-changes"),
  getScreen("profile", "Profile", "rgba(86,57,71,0.7)", "#fff", "#fff", "person"),
  getScreen("home", "Home", "rgba(86,57,71,0.9)", "#fff", "#fff", "home"),
]

export default class StudentNavigation extends Component {
  static navigationOptions = {
    title: 'IIITS Student',
    headerStyle:{ backgroundColor: '#563947'},
    headerTitleStyle:{ color: '#d4e7c2'},
};
	render() {
    return (
      <View flex>
        <FallingDrawer screens={SCREENS} shakeDuration={600} optionCollapseSpeed={80} optionCollapseDelay={100}/>
      </View>
    );
  }
}
