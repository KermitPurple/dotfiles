import subprocess

def get_pkg_config_flags(package: str) -> [str, ...]:
    process = subprocess.Popen(
            f'/bin/zsh -c "pkg-config --libs --cflags {package}"',
            shell=True,
            stdout=subprocess.PIPE
            )
    return process.stdout.read().decode('utf-8').split()

def Settings(**kwargs):
    print(raylib_flags)
    return {
        'flags': [
            '-xc++',
            '-Iinclude',
            '-Isrc',
        ] + get_pkg_config_flags('raylib')
        + get_pkg_config_flags('ncurses'),
        + get_pkg_config_flags('glut'),
    }
