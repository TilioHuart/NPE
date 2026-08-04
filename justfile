set export

OUTDIR := env("BUILD_OUT", ".build")
DEBUG_DIR := env("DEBUG_DIR", "cmake-build-cache")
CPM_SOURCE_CACHE := env("CPM_SOURCE_CACHE", ".cpm_cache")

release: (_build "Release")

debug: (_build "Debug")

asan: (_build "Asan")

_build type extra='':
    cmake -S . -B {{ OUTDIR }} -DCMAKE_BUILD_TYPE={{ type }} -DCMAKE_EXPORT_COMPILE_COMMANDS=ON {{extra}}
    cmake --build {{ OUTDIR }} -j {{ num_cpus() }}

    cp {{ OUTDIR }}/sandbox .

clean:
    rm -rf {{ OUTDIR }}
    rm -rf {{ DEBUG_DIR }}
    rm -f sandbox
    find . -type d -name ".build" -exec rm -rf {} +

purge: clean
    find . -type d -name ".cache" -exec rm -rf {} +
    find . -type d -name ".cpm_cache" -exec rm -rf {} +

re: clean release
