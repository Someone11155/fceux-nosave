# FCEUX 2.6.6 — "no save states" build

This is [FCEUX](https://github.com/TASEmulators/fceux) **v2.6.6** (GPL-2.0, see `COPYING`) with the
save-state feature removed from the Windows build. It is an unofficial modification; it is not
affiliated with or endorsed by the FCEUX project. Everything else is stock 2.6.6.

## What is removed

| Area | Change |
|---|---|
| Disk save states | `FCEUSS_Save` / `FCEUSS_Load` (`src/state.cpp`) never read or write a file. `FCEUI_SaveState` / `FCEUI_LoadState` only show *"Save states are disabled in this build"*. This also covers hotkeys (F5/F7, slots), *Save/Load State As/From*, drag-and-drop of `.fc0`–`.fc9`, `-loadstate`, and the movie "record from savestate" dialog. |
| Slots | `FCEUI_SelectState` / `FCEUI_SelectStateNext` do nothing; no slot overlay. |
| Auto features | Auto-savestates, "rewind to last auto-save" and "auto-resume old play session" are inert (`src/fceu.cpp`). |
| Menus | File > Savestate submenu; Config > Enable > Auto-savestates / Backup Savestates / Compress Savestates / Auto-resume; "Undo savestate", "Undo loadstate", "Rewind to last auto-save" in the context menus (`src/drivers/win/res.rc`). |
| Lua | The `savestate` library is not registered (`src/lua-engine.cpp`); scripts that use it fail with a nil-index error. |

## What is deliberately kept

The in-memory state engine (`FCEUSS_SaveMS` / `FCEUSS_LoadFP`) stays because other stock features are
built on it: **rewind**, the **TAS Editor** (greenzone, branches, bookmarks) and **movie** recording.
Those features keep working; this build only removes the user-facing save/load of state files.

Leftovers you may notice: the *Save States* path in Config > Directories, the savestate rows in the
hotkey list (the TAS Editor reuses them), and mentions in `fceux.chm`.

## Build

`BUILD-NOSAVE.bat` (MSVC Build Tools, x64, toolset v145) -> `vc\x64\PublicRelease\fceux64.exe`.
The release zip has the same layout as the official `fceux-2.6.6-win64.zip`
(exe, `lua5.1.dll`, `lua51.dll`, `7z_64.dll`, `auxlib.lua`, `*.chm`, `palettes`, `luaScripts`, `tools`).

## Verified

With the stock 2.6.6 exe as a control: Save State creates a state file and Load State changes the
picture; with this build the same commands leave an existing state file byte-identical and the picture
unchanged. The menu tree has 144 entries instead of 156 and no savestate-related entry. Not
verified: TAS Editor and rewind behaviour by hand (code untouched), the Qt/SDL front ends (not built).
