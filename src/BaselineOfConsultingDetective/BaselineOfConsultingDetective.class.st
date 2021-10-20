Class {
	#name : #BaselineOfConsultingDetective,
	#superclass : #BaselineOf,
	#category : #BaselineOfConsultingDetective
}

{ #category : #baselines }
BaselineOfConsultingDetective >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'DeprecationRecommender'
			with: [ spec repository: 'github://olekscode/DeprecationRecommender/src' ].
			
		spec
			baseline: 'FileDialog'
			with: [ spec repository: 'github://Ducasse/file-dialog/repository' ].
		
		"Packages"
		spec 
			package: 'ConsultingDetective' with: [ spec requires: #(DeprecationRecommender FileDialog) ] ].
]
