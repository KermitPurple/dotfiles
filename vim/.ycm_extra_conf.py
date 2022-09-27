import subprocess

CPP_EXTENSIONS = [
    'cpp',
    'hpp',
    'h',
]

def get_pkg_config_flags(package: str) -> [str, ...]:
    process = subprocess.Popen(
            f'/bin/zsh -c "pkg-config --libs --cflags {package}"',
            shell=True,
            stdout=subprocess.PIPE
            )
    return process.stdout.read().decode('utf-8').split()

def Settings(**kwargs):
    try:
        extension = kwargs['filename'].split('.')[-1]
    except:
        extension = ''
    flags = [
        '-Iinclude',
        '-Iinc',
        '-Isrc',
    ]
    if extension in CPP_EXTENSIONS:
        flags.append('-xc++')
    return {
        'flags': flags
        + get_pkg_config_flags('raylib')
        + get_pkg_config_flags('ncurses')
        + get_pkg_config_flags('glut'),
    }
