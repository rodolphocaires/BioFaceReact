/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import { NativeModules, StyleSheet, Text, View, Button, Alert } from 'react-native';

export default class App extends Component {
  openBioface() {
    var FaceManager = NativeModules.FaceManager;
    FaceManager.capture();

    // Alert.alert('BioFace', 'TODO: Abrir BioFace');
  }

  render() {
    return (
      <View style={styles.container}>
        <Button styles={styles.livenessButton} onPress={this.openBioface} title="Abrir Face" color="#329cff" />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  livenessButton: {
    borderRadius: 4
  }
});
