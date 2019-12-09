"""
Allow an object to alter its behavior when its internal state changes. 
"""
import carActionEvent
#import carExitEvent
import abc
import random


class Context:
    """
    Define the interface for camera/simulation
    """

    def __init__(self, state):
        self._state = state
    
    def request(self):
        self._state.handle(self)


class State(metaclass=abc.ABCMeta):
    """
    Define an interface for encapsulating the behavior associated with a
    particular state of the Context (entering or exiting)
    """

    @abc.abstractmethod
    def handle(self):
        pass


class entering(State):
    """
    Implements entering state, triggers carEntryEvent to database
    """

    def handle(self):
        #print("entering")
        carActionEvent.carEntryEvent()
        pass


class exiting(State):
    """
    Implements exiting state, triggers carExitEvent to database
    """
    
    def handle(self):
        #print("exiting")
        carActionEvent.carExitEvent()
        pass


def main():
    current_state = random.choice([entering, exiting]) #random entering/exiting action
    context = Context(current_state)
    context.request()


if __name__ == "__main__":
    main()


