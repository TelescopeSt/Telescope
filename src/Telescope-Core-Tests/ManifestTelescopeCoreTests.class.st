"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestTelescopeCoreTests',
	#superclass : 'PackageManifest',
	#category : 'Telescope-Core-Tests-Manifest',
	#package : 'Telescope-Core-Tests',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestTelescopeCoreTests class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGPackageDefinition #(#'Telescope-Core-Tests')) #'2026-11-23T18:56:52.706506+01:00') )
]
