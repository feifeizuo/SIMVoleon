# Microsoft Developer Studio Project File - Name="simvoleon2" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=simvoleon2 - Win32 DLL (Debug)
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "simvoleon2.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "simvoleon2.mak" CFG="simvoleon2 - Win32 DLL (Debug)"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "simvoleon2 - Win32 LIB (Release)" (based on "Win32 (x86) Static Library")
!MESSAGE "simvoleon2 - Win32 LIB (Debug)" (based on "Win32 (x86) Static Library")
!MESSAGE "simvoleon2 - Win32 DLL (Release)" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "simvoleon2 - Win32 DLL (Debug)" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SIMVOLEON_DEBUG=0" /D "HAVE_CONFIG_H" /D "SIMVOLEON_MAKE_DLL" /D "CVR_DEBUG=0" /D "SIMVOLEON_INTERNAL" /D "COIN_DLL" /I ".\lib" /I "..\..\lib" /I "$(COINDIR)\include" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "SIMVOLEON_DEBUG=0" /D "HAVE_CONFIG_H" /D "SIMVOLEON_MAKE_DLL" /D "CVR_DEBUG=0" /D "SIMVOLEON_INTERNAL" /D "COIN_DLL" /I ".\lib" /I "..\..\lib" /I "$(COINDIR)\include" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 $(COINDIR)\lib\coin2.lib opengl32.lib /nologo /dll /machine:I386
# ADD LINK32 $(COINDIR)\lib\coin2.lib opengl32.lib /nologo /dll /machine:I386 /out:"simvoleon2.dll" /opt:nowin98
# SUBTRACT LINK32 /pdb:none
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=install-dll-release.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SIMVOLEON_DEBUG=1" /D "HAVE_CONFIG_H" /D "SIMVOLEON_MAKE_DLL" /D "CVR_DEBUG=0" /D "SIMVOLEON_INTERNAL" /D "COIN_DLL" /I ".\lib" /I "..\..\lib" /I "$(COINDIR)\include" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "SIMVOLEON_DEBUG=1" /D "HAVE_CONFIG_H" /D "SIMVOLEON_MAKE_DLL" /D "CVR_DEBUG=0" /D "SIMVOLEON_INTERNAL" /D "COIN_DLL" /I ".\lib" /I "..\..\lib" /I "$(COINDIR)\include" /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 $(COINDIR)\lib\coin2d.lib opengl32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 $(COINDIR)\lib\coin2d.lib opengl32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept /out:"simvoleon2d.dll"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=install-dll-debug.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "StaticRelease"
# PROP BASE Intermediate_Dir "StaticRelease"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "StaticRelease"
# PROP Intermediate_Dir "StaticRelease"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_LIB" /D "SIMVOLEON_DEBUG=0"  /D "HAVE_CONFIG_H" /D "CVR_DEBUG=0" /D "SIMVOLEON_INTERNAL" /D "COIN_DLL" /I ".\lib" /I "..\..\lib" /I "$(COINDIR)\include" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_LIB" /D "SIMVOLEON_DEBUG=0"  /D "HAVE_CONFIG_H" /D "CVR_DEBUG=0" /D "SIMVOLEON_INTERNAL" /D "COIN_DLL" /I ".\lib" /I "..\..\lib" /I "$(COINDIR)\include" /YX /FD /c
# ADD BASE RSC /l 0x414 /d "NDEBUG"
# ADD RSC /l 0x414 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /machine:I386 /out:"simvoleon2s.lib"
# ADD LIB32 /nologo /machine:I386 /out:"simvoleon2s.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=install-lib-release.bat
# End Special Build Tool

!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "StaticDebug"
# PROP BASE Intermediate_Dir "StaticDebug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "StaticDebug"
# PROP Intermediate_Dir "StaticDebug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_LIB" /D "SIMVOLEON_DEBUG=1"  /D "HAVE_CONFIG_H" /D "CVR_DEBUG=0" /D "SIMVOLEON_INTERNAL" /D "COIN_DLL" /I ".\lib" /I "..\..\lib" /I "$(COINDIR)\include" /YX /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_LIB" /D "SIMVOLEON_DEBUG=1"  /D "HAVE_CONFIG_H" /D "CVR_DEBUG=0" /D "SIMVOLEON_INTERNAL" /D "COIN_DLL" /I ".\lib" /I "..\..\lib" /I "$(COINDIR)\include" /YX /FD /c
# ADD BASE RSC /l 0x414 /d "_DEBUG"
# ADD RSC /l 0x414 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LIB32=link.exe -lib
# ADD BASE LIB32 /nologo /machine:I386 /out:"simvoleon2sd.lib"
# ADD LIB32 /nologo /machine:I386 /out:"simvoleon2sd.lib"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=install-lib-debug.bat
# End Special Build Tool
!ENDIF

# Begin Target

# Name "simvoleon2 - Win32 DLL (Release)"
# Name "simvoleon2 - Win32 DLL (Debug)"
# Name "simvoleon2 - Win32 LIB (Release)"
# Name "simvoleon2 - Win32 LIB (Debug)"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;ic;icc"
# Begin Source File

SOURCE=..\..\lib\VolumeViz\caches\GLTextureCache.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\caches"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\caches"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\caches"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\caches"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\VolumeDetail.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\details"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\VolumeRenderDetail.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\details"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\VolumeSkinDetail.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\details"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\OrthoSliceDetail.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\details"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\ObliqueSliceDetail.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\details"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\details"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\elements\CompressedTexturesElement.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\elements"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\elements\GLInterpolationElement.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\elements"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\elements\PalettedTexturesElement.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\elements"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\elements\PageSizeElement.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\elements"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\elements\StorageHintElement.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\elements"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\elements\VoxelBlockElement.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\elements"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\elements\TransferFunctionElement.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\elements"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\elements\LightingElement.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\elements"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\elements"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\volumeraypickintersection.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\TransferFunction.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\VolumeData.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\VolumeRender.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\VolumeRendering.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\ObliqueSlice.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\OrthoSlice.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\VolumeSkin.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\VolumeFaceSet.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\VolumeIndexedFaceSet.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\VolumeTriangleStripSet.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\VolumeIndexedTriangleStripSet.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\CvrIndexedSetRenderBaseP.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\CvrNonIndexedSetRenderBaseP.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\CvrFaceSetRenderP.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\CvrIndexedFaceSetRenderP.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\CvrTriangleStripSetRenderP.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\CvrIndexedTriangleStripSetRenderP.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\nodes"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\nodes"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\misc\VoxelChunk.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\misc"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\misc\CLUT.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\misc"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\misc\Util.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\misc"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\misc\ResourceManager.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\misc"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\misc\GlobalRenderLock.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\misc"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\misc\GIMPGradient.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\misc"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\misc\Gradient.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\misc"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\misc\CentralDifferenceGradient.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\misc"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\misc"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\readers\VolumeReader.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\readers"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\readers"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\readers"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\readers"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\readers\VRVolFileReader.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\readers"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\readers"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\readers"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\readers"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\readers\VRMemReader.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\readers"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\readers"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\readers"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\readers"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\2D\PageHandler.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\2D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\2D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\2D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\2D"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\2D\2DTexSubPage.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\2D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\2D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\2D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\2D"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\2D\2DTexPage.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\2D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\2D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\2D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\2D"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\3D\CubeHandler.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\3D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\3D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\3D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\3D"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\3D\3DTexSubCube.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\3D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\3D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\3D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\3D"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\3D\3DTexCube.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\3D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\3D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\3D"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\3D"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\common\CvrTextureObject.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\common"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\common\CvrRGBATexture.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\common"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\common\CvrPaletteTexture.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\common"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\common\Cvr2DPaletteTexture.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\common"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\common\Cvr3DPaletteTexture.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\common"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\common\Cvr3DPaletteGradientTexture.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\common"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\common\Cvr2DRGBATexture.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\common"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\common\Cvr3DRGBATexture.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\common"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\common"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\render\Pointset\PointRendering.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\Pointset"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\Pointset"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\Pointset"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\Pointset"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\dummy.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\VolumeViz"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\VolumeViz"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\VolumeViz"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\VolumeViz"
!ENDIF 
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\Coin\gl\CoinGLPerformance.cpp
!IF  "$(CFG)" == "simvoleon2 - Win32 DLL (Release)"
# PROP Intermediate_Dir "Release\gl"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 DLL (Debug)"
# PROP Intermediate_Dir "Debug\gl"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Release)"
# PROP Intermediate_Dir "StaticRelease\gl"
!ELSEIF  "$(CFG)" == "simvoleon2 - Win32 LIB (Debug)"
# PROP Intermediate_Dir "StaticDebug\gl"
!ENDIF 
# End Source File
# End Group
# Begin Group "Public Headers"

# PROP Default_Filter "h"
# Begin Source File

SOURCE=lib\VolumeViz\C\basic.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\SoVolumeDetail.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\SoVolumeRenderDetail.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\SoVolumeSkinDetail.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\SoOrthoSliceDetail.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\details\SoObliqueSliceDetail.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoOrthoSlice.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoVolumeSkin.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoObliqueSlice.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoTransferFunction.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoVolumeData.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoVolumeRender.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoVolumeRendering.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoVolumeFaceSet.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoVolumeIndexedFaceSet.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoVolumeTriangleStripSet.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\nodes\SoVolumeIndexedTriangleStripSet.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\readers\SoVolumeReader.h
# End Source File
# Begin Source File

SOURCE=..\..\lib\VolumeViz\readers\SoVRVolFileReader.h
# End Source File
# End Group
# Begin Group "Private Headers"

# PROP Default_Filter "h;ic;icc"
# End Group
# End Target
# End Project
