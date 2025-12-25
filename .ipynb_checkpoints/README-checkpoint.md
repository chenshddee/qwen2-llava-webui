# Qwen2-llava-webui
## 1.模型简介

1. qwen2-llava-webui的模型文件用于社区镜像jupyterlab-qwen2-llava-webui:pytorch2.1.0-py3.10-cuda12.1-model以启动应用服务
2. 该应用服务提供开箱即用的LLM对话、文件对话、多模态对话、语音转文本等功能
3. 模型文件包含qwen2:7b与llava:13b的4bit量化权重文件，基于ollama启动推理服务
4. qwen2是由阿里巴巴推出的系列大语言模型，接受了29种语言的训练，主要支持中文与英文，7B权重下上下文长度达到128k
![](images/qwen2.jpeg)
5. 🌋 llava是一种新颖的端到端训练的多模态大模型，它结合了视觉编码器和Vicuna，用于通用的视觉和语言理解，拥有更好的视觉推理与OCR能力，为更多场景提供更好的视觉对话
6. llava模型提供一定的对中文的支持能力，可以实现中文的多模态问答，llava模型的结构如下

![](images/llava.jpeg)

## 2.环境检查及依赖补全
### 2.1 环境检查
### 推荐环境：pytorch=2.1.0 python=3.10 
```python
# 检查torch版本
import torch
import os

version = torch.__version__
num = float(version[:3])
assert num >= 1.10
device = "cpu"
# 检查硬件环境
if os.system('rocm-smi 2>/dev/null || hy-smi 2>/dev/null')==0:
    device = "dtk"

elif os.system('nvidia-smi 2>/dev/null')==0: 
    device = "cuda"

print("pytorch version:",version)
print("device =",device)
```
### 2.2 依赖安装
基于社区镜像jupyterlab-qwen2-llava-webui:pytorch2.1.0-py3.10-cuda12.1-model启动，已经包含全部依赖，无需安装其他依赖

## 3. 素材准备
- ollama启动的大模型权重 /models
- 应用相关文件 /open-webui
- NLTK数据 /nltk_data
- 启动脚本 start.sh
- ollama日志记录 ollama-output.log
- ollama启动指令 start_ollama.sh

## 4. 模型推理
- 运行以下代码启动推理webui
- 待日志中出现 INFO: Uvicorn running on http://0.0.0.0:8080
- 即可在Notebook中输入端口号8080访问服务
```python
! sh start.sh
```

webui界面如下
![](images/webui.jpeg)