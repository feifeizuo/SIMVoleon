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

#include "CvrNonIndexedSetRenderBaseP.h"

#include <Inventor/C/glue/gl.h>
#include <Inventor/actions/SoGLRenderAction.h>
#include <Inventor/elements/SoClipPlaneElement.h>
#include <Inventor/elements/SoCoordinateElement.h>
#include <Inventor/elements/SoGLLazyElement.h>
#include <Inventor/elements/SoModelMatrixElement.h>
#include <Inventor/elements/SoTextureQualityElement.h>
#include <Inventor/errors/SoDebugError.h>
#include <Inventor/nodes/SoTriangleStripSet.h>

#include <VolumeViz/elements/SoTransferFunctionElement.h>
#include <VolumeViz/elements/SoVolumeDataElement.h>
#include <VolumeViz/misc/CvrCLUT.h>
#include <VolumeViz/misc/CvrUtil.h>
#include <VolumeViz/misc/CvrVoxelChunk.h>
#include <VolumeViz/nodes/SoVolumeData.h>

#include "SoVolumeFaceSet.h"

// FIXME: Lighting does not work properly as normals are ignored. (20040707 handegar)
// FIXME: The 'offset' field is ignored. (20040707 handegar)
// FIXME: Support for multiple materials is not testet properly yet. (20040707 handegar)

void
CvrNonIndexedSetRenderBaseP::GLRender(SoGLRenderAction * action, 
                                      const float offset,
                                      const SbBool clipGeometry,
                                      SoMFInt32 & numVertices)
{


  // FIXME: Support for 'offset' must be implemented. (20040628
  // handegar)
  if (offset != 0) {
    static SbBool flag = FALSE;
    if (!flag) {
      SoDebugError::postWarning("CvrNonIndexedSetRenderBaseP::GLRender", 
                                "Support for offset > 0 not implemented yet.");
      flag = TRUE;
    }
  }

  SoState * state = action->getState();

  const SoVolumeDataElement * volumedataelement = SoVolumeDataElement::getInstance(state);
  assert(volumedataelement != NULL);
  const SoVolumeData * volumedata = volumedataelement->getVolumeData();
  if (volumedata == NULL) { return; }

  // This must be done, as we want to control stuff in the GL state
  // machine. Without it, state changes could trigger outside our
  // control.
  state->push();

  SbMatrix volumetransform;
  CvrUtil::getTransformFromVolumeBoxDimensions(volumedataelement, volumetransform);
  SoModelMatrixElement::mult(state, this->master, volumetransform);
     
  SbVec3s dims = volumedataelement->getVoxelCubeDimensions();
  SbVec3f origo(-((float) dims[0]) / 2.0f, -((float) dims[1]) / 2.0f, -((float) dims[2]) / 2.0f);

  // Determiner rendering method.
  int rendermethod, storagehint; 
  rendermethod = CvrNonIndexedSetRenderBaseP::TEXTURE2D; // this is the default
  storagehint = volumedata->storageHint.getValue();
  if (storagehint == SoVolumeData::TEX3D || storagehint == SoVolumeData::AUTO) {
    const cc_glglue * glue = cc_glglue_instance(action->getCacheContext());
    if (cc_glglue_has_3d_textures(glue) && !CvrUtil::force2DTextureRendering()) {
      rendermethod = CvrNonIndexedSetRenderBaseP::TEXTURE3D;
    }
  }
  
  if (rendermethod == CvrNonIndexedSetRenderBaseP::TEXTURE2D) {    
    // 2D textures will not be supported for this node.
    static SbBool flag = FALSE;
    if (!flag) {
      SoDebugError::postWarning("SoVolumeFaceSet::GLRender", 
                                "2D textures not supported for this node.");
      flag = TRUE;
    }
  }
  else if (rendermethod == CvrNonIndexedSetRenderBaseP::TEXTURE3D) {       
    
    // This must be done, as we want to control stuff in the GL state
    // machine. Without it, state changes could trigger outside our
    // control.
    SoGLLazyElement::getInstance(state)->send(state, SoLazyElement::ALL_MASK);
    
    glPushAttrib(GL_ALL_ATTRIB_BITS);
    glEnable(GL_TEXTURE_3D);
    glEnable(GL_DEPTH_TEST);

    // FIXME: Should there be support for other blending methods aswell? (20040630 handegar)
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);       

    if (!this->cube) { this->cube = new Cvr3DTexCube(volumedata->getReader()); }

    const SoTransferFunctionElement * tfelement = SoTransferFunctionElement::getInstance(state);
    const CvrCLUT * c = CvrVoxelChunk::getCLUT(tfelement);
    if (this->clut != c) { 
      this->cube->setPalette(c); 
      this->clut = c;
    }
    
    // Fetch texture quality
    float texturequality = SoTextureQualityElement::get(state);
    Cvr3DTexSubCube::Interpolation interp;
    if (texturequality >= 0.1f) interp = Cvr3DTexSubCube::LINEAR;
    else interp = Cvr3DTexSubCube::NEAREST;

    // Fetch vertices and normals from the stack        
    const SoCoordinateElement * coords;
    const SbVec3f * normals;
    SbBool neednormals = FALSE;

   
    const SbVec3f * vertexarray;
    SoVertexProperty * vertprop = (SoVertexProperty *) this->master->vertexProperty.getValue();
    if (vertprop != NULL) vertexarray = vertprop->vertex.getValues(this->master->startIndex.getValue());
    else {
      this->getVertexData(state, coords, normals, neednormals);
      vertexarray = coords->getArrayPtr3();
    }
    
    // FIXME: Lighting is not properly handeled yet. (20040630 handegar)
    glDisable(GL_LIGHTING);
    
    const Cvr3DTexCube::NonindexedSetType type = ((this->type == FACESET) ? 
                                                  Cvr3DTexCube::FACE_SET : 
                                                  Cvr3DTexCube::TRIANGLESTRIP_SET);
    
    this->cube->renderNonindexedSet(action, origo, interp, 
                                    vertexarray, 
                                    numVertices.getValues(this->master->startIndex.getValue()),
                                    numVertices.getNum(),
                                    type);
   
    glPopAttrib();

  }
  else { assert(FALSE && "Unknown rendering method."); }

  // 'un-Transform' model matrix before rendering clip geometry.
  state->pop();
  
  // Render the geometry which are outside the volume cube as polygons.
  if (clipGeometry) {
    
    // Is there a clipplane left for us to use?
    GLint maxclipplanes = 0;
    glGetIntegerv(GL_MAX_CLIP_PLANES, &maxclipplanes);    
    const SoClipPlaneElement * elem = SoClipPlaneElement::getInstance(state);
    if (elem->getNum() > (maxclipplanes-1)) {
      static SbBool flag = FALSE;
      if (!flag) {
        flag = TRUE;
        SoDebugError::postWarning("CvrNonIndexedSetRenderBaseP::GLRender", 
                                  "\"clipGeometry TRUE\": Not enough clip planes available. (max=%d)", 
                                  maxclipplanes);
      }
      return;
    }

    if (this->parentnodeid != this->master->getNodeId()) { // Changed recently?

      SoVertexProperty * vertprop = (SoVertexProperty *) this->master->vertexProperty.getValue();
      if (vertprop != NULL) this->clipgeometryshape->vertexProperty.setValue(vertprop);             

      int32_t * idst;
      int i=0;

      if (this->type == FACESET) {
        ((SoFaceSet *) this->clipgeometryshape)->numVertices.setNum(numVertices.getNum());
        idst = ((SoFaceSet *) this->clipgeometryshape)->numVertices.startEditing();
        for (i=0;i<numVertices.getNum();++i) { *idst++ = numVertices[i]; }
        ((SoFaceSet *) this->clipgeometryshape)->numVertices.finishEditing();
      }
      else {
        ((SoTriangleStripSet *) this->clipgeometryshape)->numVertices.setNum(numVertices.getNum());
        idst = ((SoFaceSet *) this->clipgeometryshape)->numVertices.startEditing();
        for (i=0;i<numVertices.getNum();++i) { *idst++ = numVertices[i]; }
        ((SoTriangleStripSet *) this->clipgeometryshape)->numVertices.finishEditing();
      }

      // No need to copy texture coords as the face set shall always be untextured.
      this->parentnodeid = this->master->getNodeId();
    }
  
    SbPlane cubeplanes[6];
    SbVec3f a, b, c;
    
    // FIXME: Its really not necessary to calculate the clip planes
    // for each frame unless the volume has changed. This should be
    // optimized somehow.(20040629 handegar)
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(0.0f, dims[1], 0.0f)), a);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(0.0f, dims[1], dims[2])), b);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(dims[0], dims[1], 0.0f)), c);    
    cubeplanes[0] = SbPlane(a, b, c); // Top     
    volumetransform.multVecMatrix(SbVec3f(origo), a);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(dims[0], 0.0f, 0.0f)), b);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(0.0f, 0.0f, dims[2])), c);    
    cubeplanes[1] = SbPlane(a, b, c); // Bottom    
    volumetransform.multVecMatrix(SbVec3f(origo), a);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(dims[0], 0.0f, 0.0f)), b);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(0.0f, 0.0f, dims[2])), c);    
    cubeplanes[2] = SbPlane(a, b, c); // Back    
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(0.0f, 0.0f, dims[2])), a);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(dims[0], 0.0f, dims[2])), b);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(0.0f, dims[1], dims[2])), c);    
    cubeplanes[3] = SbPlane(a, b, c); // Front    
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(dims[0], 0.0f, 0.0f)), a);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(dims[0], dims[1], 0.0f)), b);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(dims[0], 0.0f, dims[2])), c);    
    cubeplanes[4] = SbPlane(a, b, c); // Right    
    volumetransform.multVecMatrix(SbVec3f(origo), a);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(0.0f, 0.0f, dims[2])), b);
    volumetransform.multVecMatrix(SbVec3f(origo + SbVec3f(0.0f, dims[1], 0.0f)), c);    
    cubeplanes[5] = SbPlane(a, b, c); // Left
    
    for (int i=0;i<6;++i) {
      state->push();       
      // FIXME: It would have been nice to have a 'remove' or a 'replace'
      // method in the SoClipPlaneElement so that we wouldn't have to
      // push and pop the state. (20040630 handegar)
      SoClipPlaneElement::add(state, this->master, cubeplanes[i]);    
      this->clipgeometryshape->GLRender(action);
      state->pop();
    }    
  }
  
 
}
