Class {
	#name : #SherlockPagePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'recommendations',
		'recommendationsList',
		'recommendationPresenter'
	],
	#category : #ConsultingDetective
}

{ #category : #specs }
SherlockPagePresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		spacing: 5;
		add: #recommendationsList;
		add: #recommendationPresenter;
		yourself.
]

{ #category : #initialization }
SherlockPagePresenter >> connectPresenters [
	super connectPresenters.
	
	recommendationsList whenSelectionChangedDo: [ 
		self displayRecommendation: recommendationsList selectedItem ].
]

{ #category : #'as yet unclassified' }
SherlockPagePresenter >> displayRecommendation: aRecommendation [

	recommendationPresenter recommendation: aRecommendation
]

{ #category : #initialization }
SherlockPagePresenter >> initializePresenters [
	super initializePresenters.
	
	recommendationsList := self newList.
	
	recommendations ifNotNil: [
		self showRecommendations ]
]

{ #category : #accessing }
SherlockPagePresenter >> recommendations: aCollectionOfRecommendations [

	recommendations := aCollectionOfRecommendations.
	
	recommendations ifNotNil: [
		self showRecommendations ].
]

{ #category : #'as yet unclassified' }
SherlockPagePresenter >> showRecommendations [

	recommendationsList items: recommendations
]
