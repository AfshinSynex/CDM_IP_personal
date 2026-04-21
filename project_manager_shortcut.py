#!/usr/bin/env python3
"""
Vivado Project Manager Wrapper

This script allows you to call the central project_manager.py from your project root, regardless of platform.
"""
import os
import sys

# Path to the submodule script (adjust if you use a different folder)
SCRIPT_PATH = os.path.join(os.path.dirname(__file__), 'tools', 'vivado-project-manager', 'project_manager.py')

if not os.path.isfile(SCRIPT_PATH):
    print(f"Error: project_manager.py not found at {SCRIPT_PATH}")
    sys.exit(1)

# Set __file__ so the main script works as expected
globals_dict = {'__name__': '__main__', '__file__': SCRIPT_PATH}
with open(SCRIPT_PATH, 'rb') as f:
    code = compile(f.read(), SCRIPT_PATH, 'exec')
    exec(code, globals_dict)
