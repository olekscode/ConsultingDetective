Class {
	#name : #DetSaveCommand,
	#superclass : #StCommand,
	#category : #ConsultingDetective
}

{ #category : #'accessing - defaults' }
DetSaveCommand class >> defaultDescription [
	^ 'Save settings, project history, and recommendation into a file'
]

{ #category : #initialization }
DetSaveCommand class >> defaultIconName [
	^ #glamorousSave
]

{ #category : #initialization }
DetSaveCommand class >> defaultName [
	^ 'Save'
]

{ #category : #execution }
DetSaveCommand >> execute [
	| modelDictionary saveFileDialog |
	
	modelDictionary := { 
		"'settings' -> context settings .
		'projectHistory' -> context projectHistory .
		'recommendations' -> context recommendations"
	} asDictionary.
	
	saveFileDialog := FDSaveFileDialog new whenSelected: [ :selectedFile |
		selectedFile writeStreamDo: [ :writeStream |
			STON put: modelDictionary onStream: writeStream  ] ].
		
	saveFileDialog openWithSpec.
]
