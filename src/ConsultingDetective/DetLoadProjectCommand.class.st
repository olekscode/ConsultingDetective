Class {
	#name : #DetLoadProjectCommand,
	#superclass : #StCommand,
	#category : #ConsultingDetective
}

{ #category : #'accessing - defaults' }
DetLoadProjectCommand class >> defaultDescription [
	^ 'Load project from Iceberg'
]

{ #category : #'accessing - defaults' }
DetLoadProjectCommand class >> defaultIconName [
	^ #github
]

{ #category : #'accessing - defaults' }
DetLoadProjectCommand class >> defaultName [
	^ 'Select'
]

{ #category : #execution }
DetLoadProjectCommand >> execute [
	(ProjectLoader new
		callback: [ :repository :oldVersionSha |
			context onProjectLoaded: repository oldVersion: oldVersionSha  ];
		yourself)
		openWithSpec.
]
