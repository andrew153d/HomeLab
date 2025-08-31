#!/bin/bash

echo "Starting Ollama..."
/bin/ollama serve &

pid=$!

echo "Waiting for Ollama to start..."
until ollama list > /dev/null 2>&1; do
  sleep 2
done

# List of models to pull
MODELS_TO_PULL=(
  "codegemma:7b"
  "deepseek-r1:14b"
)

for model in "${MODELS_TO_PULL[@]}"; do
  if ollama list | grep -q "$model"; then
    echo "Model $model already available."
  else
    echo "Retrieving model: $model"
    ollama pull "$model"
    echo "Model $model is ready!"
  fi
done

wait $pid
