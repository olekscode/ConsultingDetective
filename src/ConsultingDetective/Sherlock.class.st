Class {
	#name : #Sherlock,
	#superclass : #SpPresenter,
	#instVars : [
		'recommendations',
		'notebook'
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
		add: #notebook;
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
	
	
]

{ #category : #initialization }
Sherlock >> initializePresenters [
	| classesPage methodsPage |
	super initializePresenters.
	
	classesPage := self instantiate: SherlockClassPagePresenter. 
	methodsPage := self instantiate: SherlockMethodsPagePresenter.
	
	classesPage recommendations: recommendations.
	methodsPage recommendations: recommendations.
	
	notebook := self newNotebook
		addPage: (self newNotebookPage
			title: 'Step 1: Missing classes';
			presenterProvider: [ classesPage ];
			yourself);
		addPage: (self newNotebookPage
			title: 'Step 2: Missing methods with replacements';
			presenterProvider: [ methodsPage ];
			yourself);
		addPage: (self newNotebookPage
			title: 'Step 3: Missing methods without replacements';
			presenterProvider: [ methodsPage ];
			yourself);
		yourself.
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
