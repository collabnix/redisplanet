# Put this script inside RedisAi main folder.
# Run only after you started a redisai server (view run_redisai_torch.sh).

set -x

redis-cli -x AI.MODELSET m TORCH GPU < ./test/test_data/pt-minimal.pt

redis-cli AI.TENSORSET a FLOAT 2 2 VALUES 2 3 2 3
redis-cli AI.TENSORSET b FLOAT 2 2 VALUES 2 3 2 3

redis-cli AI.MODELRUN m INPUTS a b OUTPUTS c

redis-cli AI.TENSORGET c VALUES
