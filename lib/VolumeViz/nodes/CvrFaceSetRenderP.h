#ifndef CVR_FACESETRENDERP_H
#define CVR_FACESETRENDERP_H

/**************************************************************************\
 *
 *  This file is part of the SIM Voleon visualization library.
 *  Copyright (C) 2003-2004 by Systems in Motion.  All rights reserved.
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU General Public License
 *  ("GPL") version 2 as published by the Free Software Foundation.
 *  See the file LICENSE.GPL at the root directory of this source
 *  distribution for additional information about the GNU GPL.
 *
 *  For using SIM Voleon with software that can not be combined with
 *  the GNU GPL, and for taking advantage of the additional benefits
 *  of our support services, please contact Systems in Motion about
 *  acquiring a SIM Voleon Professional Edition License.
 *
 *  See <URL:http://www.coin3d.org/> for more information.
 *
 *  Systems in Motion, Teknobyen, Abels Gate 5, 7030 Trondheim, NORWAY.
 *  <URL:http://www.sim.no/>.
 *
\**************************************************************************/

// Internal class
#include "SoVolumeFaceSet.h"
#include "CvrNonIndexedSetRenderBaseP.h"

class CvrFaceSetRenderP : public CvrNonIndexedSetRenderBaseP {

public:
 
  CvrFaceSetRenderP(SoVolumeFaceSet * master) {
    this->master = master;
    this->cube = NULL;
    this->clut = NULL;
    this->parentnodeid = master->getNodeId();  
    this->type = CvrNonIndexedSetRenderBaseP::FACESET;
  }

  virtual void getVertexData(SoState *state, 
                             const SoCoordinateElement *&coords, 
                             const SbVec3f *&normals, 
                             const SbBool neednormals);
        
};

#endif // CVR_FACESETRENDERP_H