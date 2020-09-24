# Put this script inside RedisAi main folder.
# Run with 'bash run_redisai_torch.sh'.
# Before running check that the script is executable 'chmod 755 run_redisai_torch.sh'

redis-server --loadmodule install-cpu/redisai.so
