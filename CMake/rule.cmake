# Include ToolChain Configuration Scripts
include(${CMAKE_CURRENT_LIST_DIR}/ToolChain/${CompilerID}/ToolChain.cmake)
set(CMAKE_USER_MAKE_RULES_OVERRIDE ${CMAKE_CURRENT_LIST_DIR}/ToolChain/${CompilerID}/RuleOverride.cmake)

# Include AutoConfig Configuration Scripts
include(${CMAKE_CURRENT_LIST_DIR}/AutoConfig/rule.cmake)
