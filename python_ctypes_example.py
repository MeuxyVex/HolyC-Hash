"""Exemple d'integration Python via ctypes pour une future lib native HolyC.

Adapte `LIB_PATH` au fichier partage produit par ton environnement hcc.
"""

from __future__ import annotations

import ctypes
from pathlib import Path

LIB_PATH = Path("./libholyc_hash.so")


def load_library() -> ctypes.CDLL:
    return ctypes.CDLL(str(LIB_PATH.resolve()))


def build_hasher(lib: ctypes.CDLL):
    lib.HashTextHex.argtypes = [ctypes.c_char_p, ctypes.POINTER(ctypes.c_char)]
    lib.HashTextHex.restype = None

    def hash_text(text: str) -> str:
        raw = text.encode("utf-8")
        out = ctypes.create_string_buffer(65)
        lib.HashTextHex(raw, out)
        return out.value.decode("ascii")

    return hash_text


if __name__ == "__main__":
    library = load_library()
    hash_text = build_hasher(library)
    print(hash_text("bonjour tout le monde"))
