Class {
	#name : #Sherlock,
	#superclass : #SpPresenter,
	#instVars : [
		'recommendations',
		'methodsList',
		'methodPresenter'
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
		add: #methodsList;
		add: #methodPresenter;
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
	
	methodsList whenSelectionChangedDo: [ 
		self displayMethod: methodsList selectedItem ].
]

{ #category : #'as yet unclassified' }
Sherlock >> displayMethod: aMethod [

	methodPresenter method: aMethod
]

{ #category : #initialization }
Sherlock >> initializePresenters [
	super initializePresenters.
	
	methodsList := self newList
		display: [ :recommendation | recommendation method ];
		yourself.
		
	methodPresenter := self instantiate: SherlockMethodPresenter.
	
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

	methodsList items: recommendations
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
