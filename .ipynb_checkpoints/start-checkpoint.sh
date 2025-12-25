bash start_ollama.sh
sleep 10
ollama run qwen2:7b &
ollama run llava:13b &
sleep 15
cd qwen2-llava-webui/backend
/root/miniconda/bin/conda run -n open-webui-env --no-capture-output bash start.sh
