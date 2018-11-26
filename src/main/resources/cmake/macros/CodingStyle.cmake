set (UNCRUSTIFY_CONFIG "${PROJECT_SOURCE_DIR}/src/main/resources/configs/cpp101-style.cfg")
set (UNCRUSTIFY_FLAGS -q --if-changed --no-backup -l CPP  -c ${UNCRUSTIFY_CONFIG})

find_program(UNCRUSTIFY uncrustify
    DOC "Code Source beautofyer"
)

function(apply_style_targets TARGET_NAME BASE_DIRECTORY)
    if(UNCRUSTIFY)

        mark_as_advanced(UNCRUSTIFY)

        if(NOT TARGET ${TARGET_NAME}-style) 

            file(GLOB_RECURSE SRC ${BASE_DIRECTORY} *.cpp *.hpp)

            add_custom_target(${TARGET_NAME}-style
                COMMENT "[Code Beautifying] : ${TARGET_NAME} in  ${BASE_DIRECTORY}"     
                COMMAND "${UNCRUSTIFY}"  ${UNCRUSTIFY_FLAGS} ${SRC}
                WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
            )

        endif()

    else(UNCRUSTIFY)
        add_custom_target(${TARGET_NAME}-style 
            COMMAND ${CMAKE_COMMAND} -E echo "[---SKIPPED---] Code formating not applied"
        )
    endif(UNCRUSTIFY)

    add_dependencies( configure ${TARGET_NAME}-style)

endfunction()



function(apply_style_targets_command TARGET_NAME BASE_DIRECTORY)
    if(UNCRUSTIFY)

        mark_as_advanced(UNCRUSTIFY)

        if(NOT TARGET ${TARGET_NAME}-style)

            file(GLOB_RECURSE SRC ${BASE_DIRECTORY} *.cpp *.hpp)

            add_custom_command( TARGET ${TARGET_NAME} PRE_BUILD

                COMMAND 
                    "${UNCRUSTIFY}"  ${UNCRUSTIFY_FLAGS} ${SRC}
                WORKING_DIRECTORY 
                    "${CMAKE_CURRENT_SOURCE_DIR}"
                COMMENT 
                    "[Code Beautifying] : ${TARGET_NAME} in  ${BASE_DIRECTORY}"
            )

        endif()

    else(UNCRUSTIFY)
        add_custom_command( TARGET ${TARGET_NAME} PRE_BUILD
            COMMAND ${CMAKE_COMMAND} -E echo "[---SKIPPED---] Code formating not applied"
        )
    endif(UNCRUSTIFY)
endfunction()

