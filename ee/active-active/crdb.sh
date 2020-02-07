# Create the CRDB
echo “”
echo “Creating a CRDB”
docker exec -it redis-node-01 /opt/redislabs/bin/crdb-cli crdb create --name mycrdb --memory-size 5048mb --port 12000 --replication false --shards-count 1 --instance fqdn=cluster1.collabnix.com,username=ajeetraina@gmail.com,password=collab123 --instance fqdn=cluster2.collabnix.com,username=ajeetraina@gmail.com,password=collab123 --instance fqdn=cluster3.collabnix.com,username=ajeetraina@gmail.com,password=collab123
