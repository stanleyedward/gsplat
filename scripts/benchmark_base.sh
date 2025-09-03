#!/bin/bash

echo "running both gsplat base and mcmc eval"
bash examples/benchmarks/mcmc.sh
bash examples/benchmarks/basic.sh
echo "done"