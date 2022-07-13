#!/bin/bash

function pymkvenv {
    local path="${1:-.venv}"
    python -m venv .venv "$path" && source "$path/bin/activate"
}

function pyloadenv {
    local path="${1:-.venv}"
    source "$path/bin/activate"
}
