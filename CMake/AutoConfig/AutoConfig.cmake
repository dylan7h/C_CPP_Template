macro(add_symbol)
    if(${ARGC} MATCHES 1)
        list(APPEND ${PROJECT_NAME}_DEFINE_SYMBOL ${ARGV0})
    else()
        list(APPEND ${PROJECT_NAME}_DEFINE_SYMBOL ${ARGV0}=${ARGV1})
    endif()
endmacro()


function(make_autoconfig root_dir)
    if(NOT "${${PROJECT_NAME}_DEFINE_SYMBOL}" STREQUAL "${PREV_${PROJECT_NAME}_DEFINE_SYMBOL}")
        # 0. set target
        set(AC_TARGET "${root_dir}/AutoConfig_${PROJECT_NAME}.h")
        string(TOUPPER ${PROJECT_NAME} TO_UPPER_PROJECT)

        # 1. Get Current Date
        string(TIMESTAMP AutoConfigGenYear "%Y")
        string(TIMESTAMP AutoConfigGenDate "%Y-%m-%d")

        # 2. Read MIT Permit
        file(READ "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/MIT_License.txt" MIT_PERMIT_TEMPLATE)

        # 3. Replace Template
        string(REPLACE "<year>" "${AutoConfigGenYear}" MIT_PERMIT_TEMPLATE ${MIT_PERMIT_TEMPLATE})
        string(REPLACE "<date>" "${AutoConfigGenDate}" MIT_PERMIT_TEMPLATE ${MIT_PERMIT_TEMPLATE})

        # 4. Start Write
        file(WRITE "${AC_TARGET}" "${MIT_PERMIT_TEMPLATE}")
        file(APPEND "${AC_TARGET}" "#ifndef AUTO_CONFIG_${TO_UPPER_PROJECT}_H_\n")
        file(APPEND "${AC_TARGET}" "#define AUTO_CONFIG_${TO_UPPER_PROJECT}_H_\n\n")

        # 5. Write Symbols
        foreach(var ${${PROJECT_NAME}_DEFINE_SYMBOL})
            # 5-1. Parsing Symbol
            string(REGEX REPLACE "()=()" ";" var ${var})

            # 5-2. Analysis psrser
            list(LENGTH var ARG_CNT)
            list(GET var 0 MACRO_SYMBOL)

            # 5-3. Write
            file(APPEND "${AC_TARGET}" "#ifndef ${MACRO_SYMBOL}\n")
            if(${ARG_CNT} MATCHES 1)
                file(APPEND "${AC_TARGET}" "#define ${MACRO_SYMBOL}\n")
            else()
                list(GET var 1 ARG_VAL)
                file(APPEND "${AC_TARGET}" "#define ${MACRO_SYMBOL} ${ARG_VAL}\n")
            endif()
            file(APPEND "${AC_TARGET}" "#endif /* !${MACRO_SYMBOL} */\n\n")
        endforeach()

        # 6. End Write
        file(APPEND "${AC_TARGET}" "#endif /* !AUTO_CONFIG_${TO_UPPER_PROJECT}_H_ */\n\n")

        # 7. Update Cache Data
        set(PREV_${PROJECT_NAME}_DEFINE_SYMBOL CACHE INTERNAL "Update Previous Symbol Data" FORCE)
    endif()
endfunction()
