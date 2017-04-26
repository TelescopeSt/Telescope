not working demos
examplePackageHierarchy
	<script: 'self exampleOverallHierarchy open'>
	<tlFilter: #visuTemplate>
	^ TLPackageHierarchy new
		entities: TLDrawable withAllSubclasses;
		nameProperty: #name;
		property: #superclass;
		widthProperty: #numberOfMethods;
		heightProperty: #instSize;
		yourself