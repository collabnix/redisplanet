#!/bin/bash

echo “Creating clusters”
docker exec -it redis-node-01 /opt/redislabs/bin/rladmin cluster create name cluster1.collabnix.com username ajeetraina@gmail.com password collab123
docker exec -it redis-node-02 /opt/redislabs/bin/rladmin cluster create name cluster2.collabnix.com username ajeetraina@gmail.com password collab123
docker exec -it redis-node-03 /opt/redislabs/bin/rladmin cluster create name cluster3.collabnix.com username ajeetraina@gmail.com password collab123
