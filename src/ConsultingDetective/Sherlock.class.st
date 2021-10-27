Class {
	#name : #Sherlock,
	#superclass : #SpPresenter,
	#instVars : [
		'recommendations',
		'recommendationsList',
		'recommendationPresenter'
	],
	#category : #ConsultingDetective
}

{ #category : #accessing }
Sherlock class >> defaultExtent [
	^ 1000@700
]

{ #category : #specs }
Sherlock class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		spacing: 5;
		add: #recommendationsList;
		add: #recommendationPresenter;
		yourself.
]

{ #category : #accessing }
Sherlock class >> defaultTitle [
	^ 'Sherlock'
]

{ #category : #'world menu' }
Sherlock class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: 'Sherlock')
		parent: #Tools;
		action: [ self open ];
		order: 15;
		help: 'A tool for helping library developers detect breaking changes and reduce their negative impact on clients';
		icon: (self iconNamed: #glamorousSearch).
]

{ #category : #examples }
Sherlock class >> open [
	<example>
	self new openWithSpec
]

{ #category : #initialization }
Sherlock >> buildToolbar [
	^ self toolbarActions 
		asToolbarPresenterWith: [ :presenter | 
			presenter 
				displayMode: SpToolbarDisplayMode modeIconAndLabel;
				addStyle: 'stToolbar' ]
]

{ #category : #initialization }
Sherlock >> connectPresenters [
	super connectPresenters.
	
	recommendationsList whenSelectionChangedDo: [ 
		self displayRecommendation: recommendationsList selectedItem ].
]

{ #category : #'as yet unclassified' }
Sherlock >> displayRecommendation: aRecommendation [

	recommendationPresenter recommendation: aRecommendation
]

{ #category : #initialization }
Sherlock >> initializePresenters [
	super initializePresenters.
	
	recommendationsList := self newList
		display: [ :recommendation | recommendation method ];
		yourself.
		
	recommendationPresenter := self instantiate: SherlockMethodRecommendationPresenter.
	
	recommendations ifNotNil: [
		self showMethods ]
]

{ #category : #initialization }
Sherlock >> initializeWindow: aWindowPresenter [
	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter
		title: self class defaultTitle;
		initialExtent: self class defaultExtent;
		toolbar: self buildToolbar.
]

{ #category : #initialization }
Sherlock >> setModelBeforeInitialization: aCollectionOfRecommendations [

	recommendations := aCollectionOfRecommendations
]

{ #category : #'as yet unclassified' }
Sherlock >> showMethods [

	recommendationsList items: recommendations
]

{ #category : #building }
Sherlock >> toolbarActions [
	^ CmCommandGroup forSpec
		register: (CmCommandGroup forSpec
			register: (DetOpenCommand forSpecContext: self);
			register: (DetSaveCommand forSpecContext: self);
			register: (DetLoadProjectCommand forSpecContext: self);
			yourself);
		yourself
]
