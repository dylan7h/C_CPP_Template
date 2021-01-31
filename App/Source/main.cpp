#include <iostream>
#include "RegEdit.h"
using namespace std;

int main(void)
{
    DWORD dwResult; 
    CRegEdit::GetRegValue("HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Services/disk/Enum", "Count", dwResult);

    cout << "dwResult: " << dwResult << endl;

    return 0;
}
