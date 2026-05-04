#!/bin/bash

# List of Python scripts and their labels
declare -A script_labels=(
    ["test_generator.py"]="test"
)

# Number of times each script should run
N=1

# Seed for reproducible random numbers
SEED=6215

# Iterate over each Python script
for script in "${!script_labels[@]}"; do
    label=${script_labels[$script]}
    echo "Running $script ($label) $N times starting with seed $SEED..."
    current_seed=$((SEED + N))
    output_name="${label}.txt"
    python "utils/$script" --seed "$current_seed" > "tests/$output_name"
    echo "Output saved to tests/$output_name with seed $current_seed"
done

echo "All scripts executed."
