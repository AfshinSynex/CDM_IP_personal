📋 **Binary Identification Registers** : Version = `0x00000001` | Hash = `0x00000000`

# CDM_v1
[//]: # (AI INSTRUCTIONS: Review the project files to understand the main purpose and replace this comment with a 2-3 sentence summery of the purpose and functionality of this Vivado FPGA project. update the git clone command below with the actual repository URL if you have access.)

### Clone this project

```sh
git clone --recursive <this-repo-url>
cd CDM_v1
python project_manager_shortcut.py
# Select option 2 to recreate the Vivado project
```

### Run the project manager
Vivado FPGA project managed with [vivado-project-manager](https://github.com/synexmedical/vivado_manager).
To start, run:
```sh
python project_manager_shortcut.py
```

## Key Organizational Folder Structure

| Folder | Description |
|--------|-------------|
| `ip_repo/` | Custom IP cores (git submodules) |
| `ip_export/` | Packaged/exported IP cores |
| `user_files/` | Documentation, notes, and user files |
| `tools/` | Build tools and scripts |

## Requirements

- Vivado (in PATH)
- Python 3.6+
- Git
