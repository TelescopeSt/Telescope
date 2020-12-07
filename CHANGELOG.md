<!--
git log --pretty="*%s ([%h](https://github.com/TelescopeSt/Telescope/commit/%H))" v2.3.0...HEAD --grep="Merge pull"
('Content' copyWithRegex: 'Merge pull request #[0-9]+ from [^/]+/[0-9]*' matchesReplacedWith: '') copyReplaceAll: '-' with: ' '
-->

# [v2.3.0](https://github.com/TelescopeSt/Telescope/compare/v2.2.3...v2.3.0) (2020-12-07)

## New Features

* Add an action to create connections with entity ([abc4ff1](https://github.com/TelescopeSt/Telescope/commit/abc4ff1ac8bfa3871fa116c78d1f3f428c6c191d))
* Create a matrix visualization template ([86243ea](https://github.com/TelescopeSt/Telescope/commit/86243ea51a0119d5a3133ecaf79d833dfade7913))

## Enhancement

* Add modularity in cycle dependecies visualization template ([8b48cfc](https://github.com/TelescopeSt/Telescope/commit/8b48cfc31edd73770ea19ee0b7f7c530479d7e56))

## Bug fixes

* Groups are not correctly removed from supergroups ([45ba104](https://github.com/TelescopeSt/Telescope/commit/45ba104aca254c088730e8f58e2b8866b3909461))

## Infrastructure

* Depend on PharoBackwardCompatibility ([7bfd884](https://github.com/TelescopeSt/Telescope/commit/7bfd884fe6bc7655d275188a86133b4811dfb793))

# [v2.2.3](https://github.com/TelescopeSt/Telescope/compare/v2.2.2...v2.2.3) (2020-06-03)

## Enhancement

* TLHideAction should by default hide the current element ([4479f3d](https://github.com/TelescopeSt/Telescope/commit/4479f3df82aa2160dc92e2eb5c35dba008f068de)

# [v2.2.2](https://github.com/TelescopeSt/Telescope/compare/v2.2.1...v2.2.2) (2020-01-09)

## Bug fixes

* BabyMock2 dependency should be removed from the baseline ([959e604](https://github.com/TelescopeSt/Telescope/commit/959e60479b6ed3dcb92879ad90012999cec4d51d))

# [v2.2.1](https://github.com/TelescopeSt/Telescope/compare/v2.2.0...v2.2.1) (2019-11-01)

## Infrastructure

*  Tests migrated from BabyMock 1 and 2 to Mocketry ([6c3de95](https://github.com/TelescopeSt/Telescope/commit/6c3de958a91611e0c30a4b0f9d8132fdd4aa4a64))

# [v2.2.0](https://github.com/TelescopeSt/Telescope/compare/v2.1.0...v2.2.0) (2019-07-02)

## New Features

* Use a DynamicVariable to define the default connector to use ([afa496c](https://github.com/TelescopeSt/Telescope/commit/afa496cb4bda8e030bd3e5eaa386ada84826db1b))
* TLExpandCollapseNodesAction should have setter for expandToOrigin ([721c7de](https://github.com/TelescopeSt/Telescope/commit/721c7ded69d412265fc2bd69bb4ad9e292e0bce7))
* Introduce common Telescope super class for errors ([b9a70f7](https://github.com/TelescopeSt/Telescope/commit/b9a70f744507a7a2a07a025b7388247d7d607bc6))
* Telescope should warn the user in case the only available connector is the Test connector ([31639da](https://github.com/TelescopeSt/Telescope/commit/31639da89886aaf6d8a596f256398d2dc6b4f200))
* Sort dynamic legends alphabetically ([f65c9b5](https://github.com/TelescopeSt/Telescope/commit/f65c9b5c7fdd36d0678308e791835dbb5105e2ed))

## Bug fixes

* TLCycleDependencies should not crash if there is no value for heightBlock and widthBlock ([eb78731](https://github.com/TelescopeSt/Telescope/commit/eb78731204859a544e877577dfa7402547f0780d))
* exampleLayoutsAngle has wrong pragma ([9a29a3f](https://github.com/TelescopeSt/Telescope/commit/9a29a3f640e1a0f0e551e9add5c75a4f3d6c8115))
* Remove dependency to Cytoscape in demo exampleConnectionStyle ([e426550](https://github.com/TelescopeSt/Telescope/commit/e4265509b24c03c56c0f9000fc6d89dc66822b0b))
* Move forCytoscape to Cytoscape ([b634c85](https://github.com/TelescopeSt/Telescope/commit/b634c858acc840f47699093c4dd9f5d65a0c861e))

## Cleanings

* Move layout application in abstract connector ([c7898d8](https://github.com/TelescopeSt/Telescope/commit/c7898d800997201f42a3c1d58069a01d90e5b581))
* Deprecate fullScreenOpening ([4e47d36](https://github.com/TelescopeSt/Telescope/commit/4e47d36a4d18135ae57cea5ade75fdf7da96fa6d))
* Remove dead code ([dccd4a1](https://github.com/TelescopeSt/Telescope/commit/dccd4a124d7e68cd7c13f5c94582a4a08d39fea0))
* Missing super set up and tear down methods ([8078086](https://github.com/TelescopeSt/Telescope/commit/8078086b7451ab71370dfca40d579a13e2659285))
* Test classes should not ends with s ([ba2bcd0](https://github.com/TelescopeSt/Telescope/commit/ba2bcd013bef6bb541e536fc1392949252c4d03f))
* withShapeManager is dead code ([d2f7a4f](https://github.com/TelescopeSt/Telescope/commit/d2f7a4f85f034d84e704f7bd0c0a35a27020b646))

## Infrastructure

* Add Smoke test on demos ([2a788be](https://github.com/TelescopeSt/Telescope/commit/2a788beda3529246b8b561287e478e7a11dad2a8))
* Add demo on node label positions ([56c8a64](https://github.com/TelescopeSt/Telescope/commit/56c8a64a5e92be71886dec97246c8e0215c773b4))
* Debug visualization should not be in Core ([025ff5f](https://github.com/TelescopeSt/Telescope/commit/025ff5f2d871006a5744b52e230b1d37c3fa9e7f))
* Create Telescope VisualizationTemplates Tests package ([237e7a0](https://github.com/TelescopeSt/Telescope/commit/237e7a0c9c2665288df8dbf18f430d758f312f59))
* Remove appveyor from CI since Telescope is OS independant and we have travis ([54fa1b7](https://github.com/TelescopeSt/Telescope/commit/54fa1b78f230a84301476223dcacb155dd38292a))
* Add gitattribute file to ensure st files are Smalltalk ([aea0b1f](https://github.com/TelescopeSt/Telescope/commit/aea0b1f4a147b8e648aa8f789b020348e3878ea1))
* Add Pharo 8 to travis ([aa1ff6b](https://github.com/TelescopeSt/Telescope/commit/aa1ff6b95fbd975393ee58c4535cdbe24317f889))

# [v2.1.0](https://github.com/TelescopeSt/Telescope/compare/v2.0.1...v2.1.0) (2018-12-07)

## Features

* Add polygon descriptions to most nodes shapes ([729961f](https://github.com/TelescopeSt/Telescope/commit/729961fe93fb0441c8736a79f47ec38f715c55af))

## Enhancement

* Add a World Menu entry for Telescope ([939dd46](https://github.com/TelescopeSt/Telescope/commit/939dd46c06aa19cbe83d521d28602334b1c4b8e1))

## Cleaning

* Remove dead methods in TLConnector ([46f7b5b](https://github.com/TelescopeSt/Telescope/commit/46f7b5b2f19bea24f0050b1cd543afefe2590fc4))
* Telescope demos should not depends on Cytoscape connector ([8510408](https://github.com/TelescopeSt/Telescope/commit/8510408c52347776e1d32c6ff13cd97be2203efa))

# [v2.0.1](https://github.com/TelescopeSt/Telescope/compare/v2.0.0...v2.0.1) (2018-12-07)

## Enhancement

* `TLLabel>>polygonPoints` should be in Telescope instead of TelescopeCytoscape ([98e3acc](https://github.com/TelescopeSt/Telescope/commit/98e3accec79aedc1d06666dbb05209d5fdbfff5b))
* Improve `DistributionMap` API ([76d12d0](https://github.com/TelescopeSt/Telescope/commit/76d12d096d48ee37c21d3ac9e0983c33e4112c23))

# [v2.0.0](https://github.com/TelescopeSt/Telescope/compare/v1.1.1...v2.0.0) (2018-11-15)

## Infrastructure

* Migrate to DeepTraverser from github. ([c0d0e56](https://github.com/TelescopeSt/Telescope/commit/c0d0e566c99b7b3b4467fe5f34d38fdc00e368ef))
* Migrate to MooseAlgos from github. ([03355f2](https://github.com/TelescopeSt/Telescope/commit/03355f22729ba33159d33c8eb94945cf2a38255d))

# [v1.1.1](https://github.com/TelescopeSt/Telescope/compare/v1.1.0...v1.1.1) (2018-10-30)

## Enhancement

* Rename `connectIfNotFollowingProperty:` into `#connectIfNotAlreadyFollowingProperty:`. ([84a32a](https://github.com/TelescopeSt/Telescope/commit/84a32a68f0f58af387092501fc70dace62837cdd))

# [v1.1.0](https://github.com/TelescopeSt/Telescope/compare/v1.0.1...v1.1.0) (2018-10-29)

## Features

* Add #connectIfNotFollowingProperty:context: on Connectables. ([1fef711](https://github.com/TelescopeSt/Telescope/commit/1fef711a7c9a8f273ca23f4378b443bfe6ad966f))
* Add sorting strategies for composites and groups ([245df9e](https://github.com/TelescopeSt/Telescope/commit/245df9e533c5e0331d34d4b5fcffdb9f61308c1a))
* Add a default sorting to the TLDistributionMap inner entities ([5a5ea75](https://github.com/TelescopeSt/Telescope/commit/5a5ea75186066a05fe69ad5afab951e4c881bea9))
