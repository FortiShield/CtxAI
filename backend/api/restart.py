from backend.utils.api import ApiHandler, Request, Response

from backend.utils import process

class Restart(ApiHandler):
    async def process(self, input: dict, request: Request) -> dict | Response:
        process.reload()
        return Response(status=200)