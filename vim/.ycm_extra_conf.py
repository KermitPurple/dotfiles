def Settings(**kwargs):
    return {
        'flags': [
            '-xc++',
            '-Iinclude',
            '-Isrc',
            '-I/opt/homebrew/Cellar/raylib/3.7.0/include',
            '-L/opt/homebrew/Cellar/raylib/3.7.0/lib',
            '-lraylib',
        ],
    }
