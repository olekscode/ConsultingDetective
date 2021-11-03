Class {
	#name : #SherlockClassPagePresenter,
	#superclass : #SherlockPagePresenter,
	#category : #ConsultingDetective
}

{ #category : #initialization }
SherlockClassPagePresenter >> initializePresenters [
	super initializePresenters.
	
	recommendationsList display: [ :recommendation | recommendation method methodClass ].
		
	recommendationPresenter := self instantiate: SherlockClassRecommendationPresenter.
]
