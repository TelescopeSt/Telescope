Class {
	#name : #TelescopeCytoscapeTestsAbstract,
	#superclass : #MochaJSTestCase,
	#instVars : [
		'visu'
	],
	#category : 'Telescope-Cytoscape-Tests-Client'
}

{ #category : #running }
TelescopeCytoscapeTestsAbstract >> defaultVisu [
	self subclassResponsibility 
]

{ #category : #running }
TelescopeCytoscapeTestsAbstract >> drawablesById [
	^ self visualization generator drawablesById 
]

{ #category : #running }
TelescopeCytoscapeTestsAbstract >> requiredLib [
  ^ {JQDeploymentLibrary. CYSFileLibrary}
]

{ #category : #running }
TelescopeCytoscapeTestsAbstract >> setUp: html [
	self wait: 'telescope.onMessageEnd(function(){telescope.removeMessageEnd(this);console.log("mocha run after message telescope"); mocha.run()})'.
	self crLog: testSelector .
	html render: ((TLCytoscapeComponent visualization: self visualization) style: 'height: 500px; width:800px;')
]

{ #category : #running }
TelescopeCytoscapeTestsAbstract >> visualization [
	visu
		ifNil: [ 
			visu:=self defaultVisu].
	^ visu
]

{ #category : #running }
TelescopeCytoscapeTestsAbstract >> visualization: aTLVisu [
	^ visu := aTLVisu
]
