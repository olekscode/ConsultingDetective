Class {
	#name : #SherlockMethodRecommendationPresenter,
	#superclass : #SherlockRecommendationPresenter,
	#instVars : [
		'missingMethodLabel',
		'commitTable',
		'isPublicRadioYes',
		'isPublicRadioNo',
		'replacementsList',
		'submitButton'
	],
	#category : #ConsultingDetective
}

{ #category : #specs }
SherlockMethodRecommendationPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		spacing: 3;
		add: (SpBoxLayout newVertical
			add: #missingMethodLabel height: self labelHeight;
			add: #commitTable;
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
SherlockMethodRecommendationPresenter >> displayCommitTable [

	commitTable commit: recommendation blamedCommit
]

{ #category : #'as yet unclassified' }
SherlockMethodRecommendationPresenter >> displayMissingMethodLabel [
	| text |
	
	text := String streamContents: [ :stream |
		stream
			nextPutAll: 'Method ';
			nextPutAll: recommendation method signature;
			nextPutAll: ' is missing in new version.' ].

	missingMethodLabel label: text.
]

{ #category : #'as yet unclassified' }
SherlockMethodRecommendationPresenter >> displayRecommendation [

	self displayMissingMethodLabel.
	self displayCommitTable.
	self displayReplacementsList.
	
]

{ #category : #'as yet unclassified' }
SherlockMethodRecommendationPresenter >> displayReplacementsList [
	
	replacementsList items: recommendation replacements
]

{ #category : #initialization }
SherlockMethodRecommendationPresenter >> initializePresenters [

	super initializePresenters.
	
	missingMethodLabel := self newLabel.
	commitTable := self instantiate: CommitTablePresenter.
	
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
