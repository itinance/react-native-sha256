/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import { StyleSheet, Text, TextInput, View} from 'react-native';
import { sha1, sha256 } from 'react-native-sha256';

type Props = {};
export default class App extends Component<Props> {

  state = {
    text: 'Test',
    sha256: '',
    sha1: '',
  }

  componentDidMount() {
    this.calcHashes(this.state.text);
  }

  calcHashes = (subject) => {
    this.setState({text: subject});

    sha256(subject).then( hash => {
      this.setState({
        sha256: hash
      })
    })

    sha1(subject).then( hash => {
      this.setState({
        sha1: hash
      })
    })
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to Hashes</Text>

        <TextInput
          style={{height: 40, width: 200, borderColor: 'gray', borderWidth: 1}}
          onChangeText={(text) => this.calcHashes(text)}
          value={this.state.text}
        />

        <Text style={styles.label}>SHA 256:</Text>
        <Text style={styles.hash}>{this.state.sha256}</Text>

        <Text style={styles.label}>SHA 1:</Text>
        <Text style={styles.hash}>{this.state.sha1}</Text>

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
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },

  label: {
    marginTop: 24,
    fontWeight: 'bold',
  },

  hash: {
    width: '80%',
  }
});
