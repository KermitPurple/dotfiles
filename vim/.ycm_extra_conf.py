import subprocess

def Settings(**kwargs):
    raylib_process = subprocess.Popen(
            '/bin/zsh -c "pkg-config --libs --cflags raylib"',
            shell=True,
            stdout=subprocess.PIPE
            )
    raylib_flags = raylib_process.stdout.read().decode('utf-8').split()
    print(raylib_flags)
    return {
        'flags': [
            '-xc++',
            '-Iinclude',
            '-Isrc',
        ] + raylib_flags,
    }
