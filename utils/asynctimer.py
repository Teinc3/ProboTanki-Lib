import asyncio
from typing import Awaitable, Any, TypeVar

T = TypeVar('T')


def asynctimer(awaitable: Awaitable[T], delay: float) -> asyncio.Task[T]:
    """
    Asynchronous timer that creates a separate task from the main event loop, that will run the given coroutine after a specified delay.
    
    Parameters:
        awaitable (Awaitable): An awaitable (usually coroutine) to run after the delay.
        delay (float): The delay in seconds before running the awaitable.
    """

    async def wrapper():
        await asyncio.sleep(delay)
        return await awaitable

    return asyncio.create_task(wrapper())


__all__ = ['asynctimer']