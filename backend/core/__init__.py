"""
Ctx AI Core Backend Module

This module contains the core business logic for the Ctx AI framework,
including agent definitions, model configurations, and core utilities.
"""

from .agent import Agent, AgentContext, AgentContextType, AgentConfig, UserMessage
from .models import (
    ModelConfig,
    ModelType,
    LiteLLMChatWrapper,
    LiteLLMEmbeddingWrapper,
    BrowserCompatibleChatWrapper,
    get_chat_model,
    get_embedding_model,
    get_browser_model
)

__all__ = [
    "Agent",
    "AgentContext", 
    "AgentContextType",
    "AgentConfig",
    "UserMessage",
    "ModelConfig",
    "ModelType",
    "LiteLLMChatWrapper",
    "LiteLLMEmbeddingWrapper", 
    "BrowserCompatibleChatWrapper",
    "get_chat_model",
    "get_embedding_model",
    "get_browser_model"
]
