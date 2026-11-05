# 10. Querying and updating

## Requests

A group is a collection of drawables, but a visualization has levels: groups in groups, composite nodes in composite nodes, visible nodes and hidden ones. A *request* walks through these levels. It starts with `obtain`, which any group, composite node or collection of drawables understands, and is built by chaining messages:

```smalltalk
visualization obtain recursively nodes.
```

A request has three kinds of messages, which come in this order:

1. **The scope**, which says which levels the request goes through:

   | Message | Goes through |
   |---|---|
   | `recursively` | The groups and the composite nodes, all the levels |
   | `groupRecursively` | The sub groups, and stops at the composite nodes |
   | `compositeRecursively` | The composite nodes, and stops at the groups |

2. **The strategies**, optional, which say which of the drawables are kept:

   | Message | Keeps |
   |---|---|
   | `visibles` | The drawables which are visible |
   | `lowestVisibles` | The lowest visible ones: the children of an expanded composite node, and not the composite node itself; a collapsed composite node, and not its children |

3. **The result**, which answers a collection: `all`, `nodes`, `simpleNodes`, `compositeNodes` and `groups`, or iterates: `nodesDo:`, `nodesSelect:`, `simpleNodesDo:`, `compositeNodesSelect:`, `groupsDo:`, `groupsSelect:`...

```smalltalk
visualization obtain recursively nodes.                       "all the nodes, at every level"
visualization obtain recursively lowestVisibles nodes.        "the ones which are displayed"
visualization obtain recursively nodesSelect: [ :node | node entity isInteger ].
```

`nodesDo:`, `nodesSelect:` and `nodesCollect:` also exist directly on groups, for their own nodes and the ones of their sub groups, without composite children, and `allNodesRecursively` includes them. The requests are what a legend uses to find the nodes to describe (chapter 8).

## The state of a drawable

Every drawable has a `state`, a dictionary which your interactions and the actions of Telescope use to remember things about it: the expansion of a node, what an action customized, the group a node came from. Use it for what is about the drawable and not the model:

```smalltalk
node state at: #visited put: true.
node state at: #visited ifAbsent: [ false ].
```

The entity belongs to the model. If you need to keep information about the node, `state` is the place.

## The update cycle

A visualization is first built (`buildVisualization` for a template), then *generated* by a connector, which makes the elements which draw the nodes. After this, the model changes: a click adds nodes, a style is changed, a layout is replaced. Telescope tracks what changed with two marks on each drawable:

| Mark | Set by | Meaning |
|---|---|---|
| Update required | `requireUpdate` | The drawable has to be drawn again: its style, its label, its connections |
| Layout application required | `requireLayoutApplication` | The group has to place its nodes again |
| Both | `requireUpdateAndLayoutApplication` | |

Then the visualization is updated with `visualization update`. The connector looks at the marks and updates what needs it, and clears them.

What sets the marks for you:

- adding or removing a node or a connection, changing the entity of a node (`entity:`), moving a node to another group, hiding or showing a drawable, and replacing the layout of a group with `layout:`;
- the actions of the interactions, which update the visualization when they are done.

What does not, and needs `requireUpdate` on the drawable, then `visualization update`: changing a style sheet of a displayed drawable, and changing a layout in place (`layout angle: 40`: use `requireLayoutApplication`).

```smalltalk
visualization addNodeFromEntity: 4.
visualization update.               "the new node appears"

node styleSheet backgroundColor: Color green.
node requireUpdate.
visualization update.               "the node is green"

visualization layout angle: 40.
visualization requireLayoutApplication.
visualization update.               "the nodes are placed again"
```

`update` can be sent to any drawable, to update it and what it contains. The Bloc connector animates the nodes which move or appear.

## Removing, hiding

| Message | What it does |
|---|---|
| `node remove` | Removes it from its group. A node takes its connections with it |
| `connection removed` | Removes a connection |
| `drawable hide`, `show` | The drawable is still in the model, but not displayed |
| `drawable isVisible` | Whether it is shown |
| `group removeAll` | Removes everything from the group |
| `group removeEntity: anEntity` | Removes the node of the entity |
| `visualization close` | Closes the window |

## Notifying the user

`visualization notify: 'text'` asks the connector to show a message to the user.

## The camera

`visualization replaceCameraWhenUpdating` is an option for the connectors which have a camera: it asks them to put the camera back when the visualization is updated, and the connector decides what it means. The Bloc connector does not use it: it fits the visualization in the window when it opens and when a layout applied again moves or adds nodes, and the auto fit button of its toolbar turns that off (chapter 11).
