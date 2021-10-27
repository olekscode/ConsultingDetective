Class {
	#name : #SherlockClassRecommendationPresenter,
	#superclass : #SherlockRecommendationPresenter,
	#instVars : [
		'missingClassLabel',
		'commitLabel'
	],
	#category : #ConsultingDetective
}

{ #category : #specs }
SherlockClassRecommendationPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #missingClassLabel height: self labelHeight;
		add: #commitLabel height: self labelHeight;
		add: '';
		yourself.
]

{ #category : #'as yet unclassified' }
SherlockClassRecommendationPresenter >> displayMissingClassLabel [

	
]

{ #category : #'as yet unclassified' }
SherlockClassRecommendationPresenter >> displayRecommendation [

	self displayMissingClassLabel.
	self displayCommitLabel.
]

{ #category : #initialization }
SherlockClassRecommendationPresenter >> initializePresenters [

	super initializePresenters.
	
	missingClassLabel := self newLabel.
	commitLabel := self newLabel.
	
	recommendation ifNotNil: [ 
		self displayRecommendation ].
]
