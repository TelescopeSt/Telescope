I am a queue that manage the commands scheduling logic. I will group all the adding commands because Cytoscape does not manage correctly child adding to a composite node and also the updating for the same reason. The order is:

1) Removing commands / customizing commands
2) adding commands
3) positioning commands