#include <iostream>
#include <regex>
#include "RegEdit.h"

using namespace std;

vector<string> CRegEdit::RunRegexSplit(const string & s, string rgx_str)
{
    vector<string> elems;

    regex rgx (rgx_str);

    sregex_token_iterator iter(s.begin(), s.end(), rgx, -1);
    sregex_token_iterator end;

    while (iter != end)  
    {
        elems.push_back(*iter);
        ++iter;
    }

    return elems;
}

LSTATUS CRegEdit::GetRootKey(const string& path, PHKEY phkResult, string& ReturnSubPath)
{
    volatile uint32_t i;

    LSTATUS ReturnStatus = ERROR_INVALID_FUNCTION;
    vector<string> token;
    string strHKEY[] = {
        "HKEY_CLASSES_ROOT", "HKEY_CURRENT_USER", "HKEY_LOCAL_MACHINE", "HKEY_USERS",
        "HKEY_PERFORMANCE_DATA", "HKEY_PERFORMANCE_TEXT", "HKEY_PERFORMANCE_NLSTEXT",
        "HKEY_CURRENT_CONFIG", "HKEY_CURRENT_USER_LOCAL_SETTINGS"
    };
    HKEY hKeyLists[] = {
        HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_LOCAL_MACHINE, HKEY_USERS,
        HKEY_PERFORMANCE_DATA, HKEY_PERFORMANCE_TEXT, HKEY_PERFORMANCE_NLSTEXT,
        HKEY_CURRENT_CONFIG, HKEY_CURRENT_USER_LOCAL_SETTINGS
    };

    token = RunRegexSplit(path, "[/|\\\\]");

    for(i = 0U; i < ( sizeof(hKeyLists) / sizeof(HKEY) ); i++)
    {
        if(strHKEY[i] == token[0U])
        {
            *phkResult = hKeyLists[i];
            ReturnStatus = ERROR_SUCCESS;
            break;
        }
    }

    ReturnSubPath.clear();
    for(i = 1U; i < token.size(); i++)
    {
        ReturnSubPath += token[i];
        if(i != (token.size() - 1U))
        {
            ReturnSubPath += "\\";
        }
    }

    return ReturnStatus;
}

LSTATUS CRegEdit::GetRegValue(const string& path, const string& name, DWORD& dwReturn)
{
    HKEY hRootKey, hKey;
    string subpath;
    LSTATUS ReturnStatus;
    DWORD dwSizeOfBuffer = sizeof(DWORD);

    ReturnStatus = GetRootKey(path, &hRootKey, subpath);
    do {
        ReturnStatus = ::RegOpenKeyExA(hRootKey, subpath.c_str(), 0, KEY_READ, &hKey);
        if(ReturnStatus != ERROR_SUCCESS) {
            break;
        }

        ReturnStatus = ::RegQueryValueExA(hKey, name.c_str(), 0U, NULL, reinterpret_cast<LPBYTE>(&dwReturn), &dwSizeOfBuffer);
        RegCloseKey(hKey);
    } while(0U);
    
    return ReturnStatus;
}

LSTATUS CRegEdit::GetRegValue(const string& path, const string& name, string& strReturn)
{
    HKEY hRootKey, hKey;
    string subpath;
    LSTATUS ReturnStatus;

    char szBuffer[MAX_PATH];
    DWORD dwSizeOfBuffer = sizeof(szBuffer);

    ReturnStatus = GetRootKey(path, &hRootKey, subpath);
    do {
        ReturnStatus = ::RegOpenKeyExA(hRootKey, subpath.c_str(), 0, KEY_READ, &hKey);
        if(ReturnStatus != ERROR_SUCCESS) {
            break;
        }

        ReturnStatus = ::RegQueryValueExA(hKey, name.c_str(), 0U, NULL, reinterpret_cast<LPBYTE>(szBuffer), &dwSizeOfBuffer);
        if(ReturnStatus == ERROR_SUCCESS) {
            strReturn = string(szBuffer);
        }
        RegCloseKey(hKey);
    } while(0U);
    
    return ReturnStatus;
}
