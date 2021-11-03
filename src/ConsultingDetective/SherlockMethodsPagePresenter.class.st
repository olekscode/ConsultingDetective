Class {
	#name : #SherlockMethodsPagePresenter,
	#superclass : #SherlockPagePresenter,
	#category : #ConsultingDetective
}

{ #category : #initialization }
SherlockMethodsPagePresenter >> initializePresenters [
	super initializePresenters.
	
	recommendationsList display: [ :recommendation | recommendation method ].
		
	recommendationPresenter := self instantiate: SherlockMethodRecommendationPresenter.
]
