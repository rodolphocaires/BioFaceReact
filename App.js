/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import { NativeModules, StyleSheet, View, Button, NativeEventEmitter } from 'react-native';

export default class App extends Component {
    constructor() {
        super();
        const faceEvents = new NativeEventEmitter(NativeModules.FaceManager);
        const subscription = faceEvents.addListener('onFaceResult', (faceResult) => {
            this.onFaceResult(faceResult);
        });
    }


    onFaceResult(faceResult) {
        console.log('*** FACE ***');
        console.log(faceResult.version);
        console.log(faceResult.resultCode);
    }

    openBioface() {
        const FaceManager = NativeModules.FaceManager;
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
