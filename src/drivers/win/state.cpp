#include "common.h"
#include "../../version.h"
#include "../../state.h"
#include <string>
#include <string.h>
#include <fstream>

using namespace std;

//Externs
extern string GetBackupFileName();			//Declared in src/state.cpp

/**
* Show an Save File dialog and save a savegame state to the selected file.
**/
void FCEUD_SaveStateAs()
{
	FCEUI_SaveState(0); // shows the 'disabled' message
}

/**
* Show an Open File dialog and load a savegame state from the selected file.
**/
void FCEUD_LoadStateFrom()
{
	FCEUI_LoadState(0); // shows the 'disabled' message
}