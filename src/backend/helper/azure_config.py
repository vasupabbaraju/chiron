import os
from dotenv import find_dotenv, load_dotenv 

class AzureConfig:
    def __init__(self):
        env_path = find_dotenv()
        load_dotenv(env_path, override=True)
        self.azure_endpoint: str = os.getenv("AZURE_OPENAI_API_ENDPOINT")
        self.azure_openai_api_key: str = os.getenv("AZURE_OPENAI_API_KEY")
        self.azure_openai_chat_deployment: str = os.getenv("AZURE_OPENAI_API_DEPLOYMENT_NAME")
        self.azure_openai_chat_api_version: str = os.getenv("AZURE_OPENAI_API_VERSION")
        self.use_supervisor: bool = os.getenv("USE_SUPERVISOR") == "True"
