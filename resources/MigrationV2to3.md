# Migration Guide - Telescope v2 to v3

This guide will cover the different breaking changes introduced in Telescope v3.0.0

## Removal of TLMemorizeNodePositionAction

`TLMemorizeNodePositionAction` was an action introduced to save the positions of elements in visualization. It was removed in the v3 without replacement. This decision after trying to use it in production. The interactive property of Telescope make this feature unusable because layouts always update and will overlap with the fixed entities.

