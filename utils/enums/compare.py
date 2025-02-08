from enum import Enum


def compare_enums(enum1: Enum, enum2: Enum) -> bool:
    return enum1.name == enum2.name and enum1.value == enum2.value