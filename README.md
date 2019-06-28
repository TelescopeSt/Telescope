# Telescope

Master: [![Build Status](https://travis-ci.org/TelescopeSt/Telescope.svg?branch=master)](https://travis-ci.org/TelescopeSt/Telescope)
Development: [![Build Status](https://travis-ci.org/TelescopeSt/Telescope.svg?branch=development)](https://travis-ci.org/TelescopeSt/Telescope)


Telescope is an engine for efficiently creating meaningful visualizations. The purpose is to help the user concentrate on the problem at hand rather than understanding the nitty-gritty of a drawing library. It does so by exposing to the user to a few concepts of the domain of visualization: nodes and their contents, layouts, interactions, and update mechanism. For example, the user does not have to worry about the creation of composite or simple nodes, the engine handles it. 

The user can create a model of visualization and then render it via a connector to a visualization framework.

**Note: Telescope is not usable by itself. It needs to come with at least one connector. You can find the list of connectors [later in this document](#connectors).**

# Documentation

## Version management 

This project use semantic versionning to define the releases. This mean that each stable release of the project will get associate a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

When a release contains only bug fixes, the patch number increase. When the release contains new features backward compatibles, the minor version increase. When the release contains breaking changes, the major version increase. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

## Install Telescope

To install Telescope on your Pharo image you can just execute the following script:

```Smalltalk
    Metacello new
    	githubUser: 'TelescopeSt' project: 'Telescope' commitish: 'v2.x.x' path: 'src';
    	baseline: 'Telescope';
    	onWarningLog;
		onUpgrade: [ :e | e useIncoming ];
    	load
```

To add Telescope to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'Telescope'
    	with: [ spec repository: 'github://TelescopeSt/Telescope:v2.x.x/src' ]
```

Note that you can replace the v2.x.x tag by a branch as #master or #development or a tag as #v1.0.0, #v1.? or #v1.0.x or a commit SHA.

## Connectors

As explained previously, Telescope works with connector to render visualizations. We will list here the official Telescope's connectors.

### CytoscapeJs

The CytoscapeJs connector of Telescope is available at: [https://github.com/TelescopeSt/TelescopeCytoscape](https://github.com/TelescopeSt/TelescopeCytoscape)

This connector works with Seaside in order to render web visualizations.

<img src="https://raw.githubusercontent.com/TelescopeSt/Telescope/development/resources/cytoscape.gif" style="width: 75%">

### Roassal

A Roassal connector was initialized but we did not get the manpower to maintain it. 

If someone wants to revive this connector, the last version we got was in this commit: [9fafc43ade53f8d16e40c82dffbccd2371f3851d](https://github.com/TelescopeSt/Telescope/commit/9fafc43ade53f8d16e40c82dffbccd2371f3851d)

## Examples

Examples can be found in the CytoscapeJs connector repository.

## Smalltalk versions compatibility

| Telescope version 	| Compatible Pharo versions 	|
|-------------------	|---------------------------	|
| v1.x.x	   		   	| Pharo 61, 70                 	|
| v2.x.x	   		   	| Pharo 61, 70, 80             	|
| development      		| Pharo 61, 70, 80             	|

## Contact

If you have any question or problem do not hesitate to open an issue or contact cyril (a) ferlicot.me or guillaume.larcheveque (a) gmail.com

