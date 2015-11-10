The idea of the connection flow graph is to have a set of starting nodes and place them at different horizontal levels according to their incoming/outgoing connections. The difference with flow graph is that the computation for levels is done by the visualization and the connections are shown to the nodes beyond their immediate neighbors. Since the visualization can represent incoming and outgoing connections, the root is placed leftMost for outgoing and rightMost for incoming connections. 

edgeDirection: #incoming or #outgoing
nextProperty = property to get next level elements (applicable to both incoming and outgoing)
entry Point: the starting point of the graph
