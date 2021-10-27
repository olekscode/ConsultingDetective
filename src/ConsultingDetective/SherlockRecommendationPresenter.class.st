Class {
	#name : #SherlockRecommendationPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'recommendation'
	],
	#category : #ConsultingDetective
}

{ #category : #accessing }
SherlockRecommendationPresenter >> displayRecommendation [
	
	self subclassResponsibility
]

{ #category : #accessing }
SherlockRecommendationPresenter >> recommendation: aRecommendation [

	recommendation := aRecommendation.
	
	recommendation ifNotNil: [ 
		self displayRecommendation ].
]

{ #category : #initialization }
SherlockRecommendationPresenter >> setModelBeforeInitialization: aRecommendation [

	recommendation := aRecommendation
]
