#ifndef REGEDIT_H_
#define REGEDIT_H_

#include <Windows.h>
#include <vector>
#include <string>

class CRegEdit
{
private:
    static std::vector<std::string> RunRegexSplit(IN const std::string& s, OUT std::string rgx_str);
    static LSTATUS GetRootKey(IN const std::string& path, OUT PHKEY phkResult, OUT std::string& ReturnSubPath);

public:
    static LSTATUS GetRegValue(IN const std::string& path, IN const std::string& name, OUT DWORD& dwReturn);
    static LSTATUS GetRegValue(IN const std::string& path, IN const std::string& name, OUT std::string& strReturn); 
};

#endif  /* !REGEDIT_H_ */
