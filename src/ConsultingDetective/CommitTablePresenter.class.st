Class {
	#name : #CommitTablePresenter,
	#superclass : #SpTablePresenter,
	#instVars : [
		'commit'
	],
	#category : #ConsultingDetective
}

{ #category : #accessing }
CommitTablePresenter >> commit: aCommit [

	commit := aCommit.
	
	commit ifNotNil: [ 
		self displayCommit ].
]

{ #category : #'as yet unclassified' }
CommitTablePresenter >> displayCommit [

	self
		columns: { };
		addColumn: ((SpStringTableColumn
			title: ''
			evaluated: [ :assoc | assoc key ])
			width: 80;
			yourself);
		addColumn: (SpStringTableColumn
			title: ''
			evaluated: [ :assoc | assoc value ]);
		items: { 
			'Commit Id' -> commit id .
			'Author' -> commit author .
			'Date' -> commit datetime asDate asString .
			'Message' -> commit comment };
		hideColumnHeaders.
]
