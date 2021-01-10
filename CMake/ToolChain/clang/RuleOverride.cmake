# Config Building Architecture
if(${USE32bit})
    set(CMAKE_EXE_LINKER_FLAGS "-m32")
else()
    set(CMAKE_EXE_LINKER_FLAGS "-m64")
endif()

# Enable Warining Options
#
# -W                : 합법적이지만 모호한 코딩에 경고 출력
# -Wall             : 모호한 코딩에 경고 출력
# -ansi             : ANSI C 표준으로 문법 체크. (GNU C 확장 문법 사용 불가)
# -w                : 경고 메시지 제거하지
# -Werror           : 경고 발생시 컴파일 중단
# -pedantic         : ANSI C89 표준의 모든 경고 메시지 표시
# -pedantic-errors  : ANSI C89 표준의 모든 오류 메시지 표시
# -Wconversion      : 형변환(type conversion)과 관련되어서 잘못 사용된 코드에 대한 경고표시
# -Wshadow          : 선언된 변수명을 다른 scope에서 다시 선언한 경우 경고를 표시
# -Wcast-qual       : const와 같은 타입 제한자를 잘못 사용했을 경우 경고 표시
# -Wtraditional     : ANSI/ISO의 표준을 엄격하게 검사
set(CMAKE_C_FLAGS_INIT "-W -Wall -Wconversion -Wshadow -Wcast-qual")

