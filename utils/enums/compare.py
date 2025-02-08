from enum import Enum


def compare_enums(enum1: Enum, enum2: Enum) -> bool:
    return enum1.__name__ == enum2.__name__ and enum1.value == enum2.value