Class {
	#name : #DetOpenCommand,
	#superclass : #StCommand,
	#category : #ConsultingDetective
}

{ #category : #'accessing - defaults' }
DetOpenCommand class >> defaultDescription [
	^ 'Open the file containing the settings, project history, and recommendation'
]

{ #category : #initialization }
DetOpenCommand class >> defaultIconName [
	^ #glamorousOpen
]

{ #category : #'accessing - defaults' }
DetOpenCommand class >> defaultName [
	^ 'Open'
]

{ #category : #execution }
DetOpenCommand >> execute [
	| openFileDialog modelDictionary |
	
	openFileDialog := FDOpenFileDialog new whenSelected: [ :selectedFile |
		modelDictionary := selectedFile readStreamDo: [ :readStream |
			STON fromStream: readStream ].

		"..." ].
	
	openFileDialog openWithSpec
]
