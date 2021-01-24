cmake_minimum_required(VERSION 3.15)

include(config.cmake)

project(
    # project name
    "dsrw"
    # description
    DESCRIPTION ""
    # version
    VERSION 0.0.1
    # URL
    HOMEPAGE_URL "https://github.com/dylan7h/cpp_study"
    # language
    LANGUAGES CXX
)

load_config()

make_autoconfig("Include")

build_exec()
