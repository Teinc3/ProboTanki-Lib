from enum import Enum, auto


class AutoEnum(Enum):
    def _generate_next_value_(name, _start, _count, _last_values):
        return name

# Exporting auto so we don't have to import it from enum again when we use this 
__all__ = ['AutoEnum', 'auto']