#include <Windows.h>
#include <assert.h>
#include <tchar.h>

HINSTANCE g_hInstance;
LPCTSTR g_lpszClass = _T("Form");
LPCTSTR g_lpszTitle = _T("Form");

LRESULT CALLBACK WndProc(HWND hWnd, UINT32 nMsg, WPARAM wParam, LPARAM lParam);

INT32 APIENTRY _tWinMain(HINSTANCE hInstance, HINSTANCE hPreInstance, LPTSTR lpszCmdParam, INT32 nCmdShow)
{
    HWND hWnd;
    MSG Message;
    WNDCLASS WndClass;
    
    WndClass.cbClsExtra     = 0;
    WndClass.cbWndExtra     = 0;
    WndClass.hbrBackground  = (HBRUSH)(COLOR_WINDOW + 1U);
    WndClass.hCursor        = LoadCursor(NULL, IDC_ARROW);
    WndClass.hIcon          = LoadIcon(NULL, IDI_APPLICATION);
    WndClass.hInstance      = hInstance;
    WndClass.lpfnWndProc    = (WNDPROC)WndProc;
    WndClass.lpszClassName  = g_lpszClass;
    WndClass.lpszMenuName   = NULL;
    WndClass.style          = CS_HREDRAW | CS_VREDRAW;
    RegisterClass(&WndClass);

    hWnd = CreateWindow(g_lpszClass, g_lpszTitle, WS_OVERLAPPEDWINDOW,
        CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
        NULL, NULL, hInstance, NULL
    );
    assert(hWnd);

    ShowWindow(hWnd, nCmdShow);

    while(GetMessage(&Message, 0, 0, 0))
    {
        TranslateMessage(&Message);
        DispatchMessage(&Message);
    }

    return (INT32)Message.wParam;
}

LRESULT CALLBACK WndProc(HWND hWnd, UINT32 nMsg, WPARAM wParam, LPARAM lParam)
{
    switch (nMsg)
    {
    case WM_CREATE:
        /* code */
        break;
    
    case WM_DESTROY:
        PostQuitMessage(0);
        break;
    
    default:
        return DefWindowProc(hWnd, nMsg, wParam, lParam);
    }

    return 0;
}
