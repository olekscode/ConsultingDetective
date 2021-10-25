Class {
	#name : #SherlockMethodPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'recommendation',
		'isPublicRadioYes',
		'isPublicRadioNo',
		'missingMethodLabel',
		'commitLabel',
		'replacementsList',
		'submitButton'
	],
	#category : #ConsultingDetective
}

{ #category : #specs }
SherlockMethodPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		spacing: 3;
		add: (SpBoxLayout newVertical
			add: #missingMethodLabel height: self labelHeight;
			add: #commitLabel height: self labelHeight;
			yourself);
		add: (SpBoxLayout newVertical
			add: #isPublicRadioYes height: self labelHeight;
			add: #isPublicRadioNo height: self labelHeight;
			yourself);
		add: (SpBoxLayout newVertical
			add: 'Recommended replacements' height: self labelHeight;
			add: #replacementsList;
			yourself);
		add: '';
		add: (SpBoxLayout newHorizontal
			add: '';
			add: #submitButton width: self buttonWidth;
			yourself) height: self buttonHeight;
		yourself.
]

{ #category : #'as yet unclassified' }
SherlockMethodPresenter >> displayCommitLabel [
	| commit text |
	commit := recommendation blamedCommit.
	
	text := String streamContents: [ :stream |
		stream
			nextPutAll: 'It war removed in on ';
			nextPutAll: commit datetime asDate asString;
			nextPutAll: ' by ';
			nextPutAll: commit author;
			nextPutAll: ' in commit ';
			nextPutAll: commit shortId;
			nextPut: $. ].

	commitLabel label: text.
]

{ #category : #'as yet unclassified' }
SherlockMethodPresenter >> displayMissingMethodLabel [
	| text |
	
	text := String streamContents: [ :stream |
		stream
			nextPutAll: 'Method ';
			nextPutAll: recommendation method signature;
			nextPutAll: ' is missing in new version.' ].

	missingMethodLabel label: text.
]

{ #category : #'as yet unclassified' }
SherlockMethodPresenter >> displayRecommendation [

	self displayMissingMethodLabel.
	self displayCommitLabel.
	self displayReplacementsList.
	
]

{ #category : #'as yet unclassified' }
SherlockMethodPresenter >> displayReplacementsList [
	
	replacementsList items: recommendation replacements
]

{ #category : #initialization }
SherlockMethodPresenter >> initializePresenters [

	super initializePresenters.
	
	missingMethodLabel := self newLabel.
	commitLabel := self newLabel.
	
	isPublicRadioYes := self newRadioButton
		label: 'Yes, this method is part of the API and can be used by clients';
		yourself.
		
	isPublicRadioNo := self newRadioButton
		label: 'No, this method should not be used by clients, so we just removed it';
		yourself.
		
	isPublicRadioYes associatedRadioButtons: { isPublicRadioNo }.
	
	replacementsList := self newList.
	
	submitButton := self newButton
		label: 'Submit';
		yourself.
	
	recommendation ifNotNil: [ 
		self displayRecommendation ].
]

{ #category : #accessing }
SherlockMethodPresenter >> method: aMethod [

	recommendation := aMethod.
	
	recommendation ifNotNil: [ 
		self displayRecommendation ].
]

{ #category : #initialization }
SherlockMethodPresenter >> setModelBeforeInitialization: aRecommendation [

	recommendation := aRecommendation
]
