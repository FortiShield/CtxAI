from backend.utils.extension import Extension


class AgentOsContext(Extension):

    async def execute(self, system_prompt: list[str] = [], **kwargs):
        prompt = self.agent.read_prompt("fw.agent_os.reference.md")
        if prompt:
            system_prompt.append(prompt)
