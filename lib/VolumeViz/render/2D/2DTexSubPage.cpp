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

#include <VolumeViz/render/2D/Cvr2DTexSubPage.h>

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif // HAVE_CONFIG_H

#include <Inventor/C/glue/gl.h>
#include <Inventor/C/tidbits.h>
#include <Inventor/actions/SoGLRenderAction.h>
#include <Inventor/errors/SoDebugError.h>

#include <VolumeViz/elements/CvrCompressedTexturesElement.h>
#include <VolumeViz/elements/SoTransferFunctionElement.h>
#include <VolumeViz/misc/CvrCLUT.h>
#include <VolumeViz/misc/CvrUtil.h>
#include <VolumeViz/misc/CvrVoxelChunk.h>
#include <VolumeViz/render/common/Cvr2DPaletteTexture.h>
#include <VolumeViz/render/common/Cvr2DRGBATexture.h>
#include <VolumeViz/render/common/resourcehandler.h>

#include "texmemfullimg.h"

// *************************************************************************

// FIXME: debugging, keep this around until the peculiar NVidia bug with
// 1- or 2-pixel width textures has been analyzed. 20031031 mortene.

// How to use this: just wrap the GL suspected of misdoings in
//
// GLCMD(glSomething(arg0, arg1, etc));
//
// ..and set the GLSYNCHRON define below to "1". Anything causing the
// GL driver to crash will then do so synchronously due to the
// glFinish() call.

#define GLSYNCHRON 0

#if GLSYNCHRON
#define GLCMD(x) do { printf("%s\n", #x); x; glFinish(); } while(0)
#else
#define GLCMD(x) do { x; } while(0)
#endif

// *************************************************************************

GLuint Cvr2DTexSubPage::emptyimgname[1] = { 0 };
SbBool Cvr2DTexSubPage::detectedtextureswapping = FALSE;

// *************************************************************************

// FIXME: first argument should be const. 20040716 mortene.
Cvr2DTexSubPage::Cvr2DTexSubPage(SoGLRenderAction * action,
                                 const CvrTextureObject * texobj,
                                 const SbVec2s & pagesize,
                                 const SbVec2s & texsize)
{
  this->bitspertexel = 0;
  this->clut = NULL;

  assert(pagesize[0] >= 0);
  assert(pagesize[1] >= 0);
  assert(coin_is_power_of_two(pagesize[0]));
  assert(coin_is_power_of_two(pagesize[1]));

  assert(texsize[0] <= pagesize[0]);
  assert(texsize[1] <= pagesize[1]);

  this->texobj = texobj;
  this->texobj->ref();

  const SbVec3s dims = this->texobj->getDimensions();
  assert((dims[2] == 1) && "Cannot initialize a 2D-texture subpage with a 3D-texture object");
  const SbVec2s texdims(dims[0], dims[1]);

  // Calculates part of texture to show.
  this->texmaxcoords = SbVec2f(1.0f, 1.0f);
  if (texdims != texsize) {
    this->texmaxcoords[0] = float(texsize[0]) / float(texdims[0]);
    this->texmaxcoords[1] = float(texsize[1]) / float(texdims[1]);
  }

  // Calculates part of GL quad to show.
  this->quadpartfactors = SbVec2f(1.0f, 1.0f);
  if (pagesize != texsize) {
    this->quadpartfactors[0] = float(texsize[0]) / float(pagesize[0]);
    this->quadpartfactors[1] = float(texsize[1]) / float(pagesize[1]);
  }

#if CVR_DEBUG && 0 // debug
  SoDebugError::postInfo("Cvr2DTexSubPage::Cvr2DTexSubPage",
                         "texsize==[%d, %d], "
                         "texobj->getDimensions()==[%d, %d], "
                         "this->texmaxcoords==[%f, %f]",
                         texsize[0], texsize[1],
                         this->texobj->getDimensions()[0],
                         this->texobj->getDimensions()[1],
                         this->texmaxcoords[0], this->texmaxcoords[1]);
#endif // debug
}

Cvr2DTexSubPage::~Cvr2DTexSubPage()
{
  this->texobj->unref();
  if (this->clut) this->clut->unref();
}

// *************************************************************************

SbBool
Cvr2DTexSubPage::isPaletted(void) const
{
  return this->texobj->isPaletted();
}

void
Cvr2DTexSubPage::setPalette(const CvrCLUT * newclut)
{
  if (this->clut) { this->clut->unref(); }
  this->clut = newclut;
  newclut->ref();
}

// *************************************************************************

// FIXME: this is as good as identical to the same function in
// Cvr3DTexSubCube, so move to CvrTextureObject. 20040720 mortene.
void
Cvr2DTexSubPage::activateTexture(const SoGLRenderAction * action,
                                 // FIXME: pass interpolation info on
                                 // the stack. 20040720 mortene.
                                 Interpolation interpolation) const
{
  const GLuint texid = this->texobj->getGLTexture(action);

  glEnable(GL_TEXTURE_2D);
  glBindTexture(GL_TEXTURE_2D, texid);

  GLenum interp = 0;
  switch (interpolation) {
  case NEAREST: interp = GL_NEAREST; break;
  case LINEAR: interp = GL_LINEAR; break;
  default: assert(FALSE); break;
  }

  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, interp);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, interp);

  assert(glGetError() == GL_NO_ERROR);

#if CVR_DEBUG && 0 // debug
  // FIXME: glAreTexturesResident() is OpenGL 1.1 only. 20021119 mortene.
  GLboolean residences[1];
  GLboolean resident = glAreTexturesResident(1, &(res->texid), residences);
  if (!resident) {
    SoDebugError::postWarning("Cvr2DTexSubPage::activateTexture",
                              "texture %d not resident", res->texid);
    Cvr2DTexSubPage::detectedtextureswapping = TRUE;
  }

  // For reference, here's some information from Thomas Roell of Xi
  // Graphics on glAreTexturesResident() from c.g.a.opengl:
  //
  // [...]
  //
  //   With regards to glAreTexturesResident(), this is kind of
  //   tricky. This function returns which textures are currently
  //   resident is HW accessable memory (AGP, FB, TB). It does not
  //   return whether a set of textures could be made resident at a
  //   future point of time. A lot of OpenGL implementations (APPLE &
  //   XiGraphics for example) do cache a texture upon first use with
  //   3D primitive. Hence unless you had used a texture before it
  //   will not be resident. N.b that usually operations like
  //   glBindTexture, glTex*Image and so on will not make a texture
  //   resident for such caching implementations.
  //
  // [...]
  //
  // Additional information from Ian D Romanick (IBM engineer doing
  // Linux OpenGL work):
  //
  // [...]
  //
  //   AreTexturesResident is basically worthless, IMO.  All OpenGL
  //   rendering happens in a VERY high latency pipeline.  When an
  //   application calls AreTexturesResident, the textures may all be
  //   resident at that time.  However, there may already be
  //   primitives in the pipeline that will cause those textures to be
  //   removed from texturable memory before more primitives can be
  //   put in the pipe.
  //
  // [...]
  //
  // 20021201 mortene.

#endif // debug
}

// Set up the image used (for debugging purposes) when texture memory
// is full.
void
Cvr2DTexSubPage::bindTexMemFullImage(const cc_glglue * glw)
{
  // FIXME: emptyimgname not yet bound to a specific context. Should
  // anyway find a better way to flag that no texture can be
  // made. 20040715 mortene.
#if 0 // disabled
  // FIXME: requires > OpenGL 1.0, should go through wrapper.
  // FIXME: bind to specific context. 20040715 mortene.
  glGenTextures(1, Cvr2DTexSubPage::emptyimgname);
  glBindTexture(GL_TEXTURE_2D, Cvr2DTexSubPage::emptyimgname[0]);
  // FIXME: never freed. 20021121 mortene.
    
  // Check format of GIMP-exported "texmem full" image.
  assert(coin_is_power_of_two(tex_image.width));
  assert(coin_is_power_of_two(tex_image.height));
  assert(tex_image.bytes_per_pixel == 4);

  glTexImage2D(GL_TEXTURE_2D,
               0,
               tex_image.bytes_per_pixel,
               tex_image.width, tex_image.height,
               0,
               GL_RGBA,
               GL_UNSIGNED_BYTE,
               tex_image.pixel_data);

  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);

  glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
  glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
#endif
}

// *************************************************************************

// FIXME: this is common with 3DTexSubCube -- move to
// CvrTextureObject? 20040720 mortene.

void
Cvr2DTexSubPage::activateCLUT(const SoGLRenderAction * action)
{
  assert(this->clut != NULL);

  // FIXME: should check if the same clut is already current 
  const cc_glglue * glw = cc_glglue_instance(action->getCacheContext());
  this->clut->activate(glw);
}


void
Cvr2DTexSubPage::deactivateCLUT(const SoGLRenderAction * action)
{
  assert(this->clut != NULL);

  // FIXME: should check if the same clut is already current 
  const cc_glglue * glw = cc_glglue_instance(action->getCacheContext());
  this->clut->deactivate(glw);
}

// *************************************************************************

void
Cvr2DTexSubPage::render(const SoGLRenderAction * action,
                        const SbVec3f & upleft,
                        SbVec3f widthvec, SbVec3f heightvec,
                        Interpolation interpolation)
{

  // Texture binding/activation must happen before setting the
  // palette, or the previous palette will be used.
  this->activateTexture(action, interpolation);
  if (this->isPaletted()) { this->activateCLUT(action); }

  // Scale span of GL quad to match the visible part of the
  // texture. (Border subpages shouldn't show all of the texture, if
  // the dimensions of the dataset are not a power of two, or if the
  // dimensions are less than the subpage size).

  widthvec *= this->quadpartfactors[0];
  heightvec *= this->quadpartfactors[1];

  // Find all corner points of the quad.

  SbVec3f lowleft = upleft + heightvec;
  SbVec3f lowright = lowleft + widthvec;
  SbVec3f upright = upleft + widthvec;

  if (CvrUtil::dontModulateTextures()) // Is texture mod. disabled by an envvar?
    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);

  // Texturecoords are set up so the texture is flipped in the
  // Y-direction, as the volume data and texture map data are oriented
  // in the opposite direction (top-to-bottom) from what the Y axis in
  // the OpenGL coordinate system uses (bottom-to-top).

  glBegin(GL_QUADS);

  glTexCoord2f(0.0f, this->texmaxcoords[1]);
  glVertex3f(lowleft[0], lowleft[1], lowleft[2]);

  glTexCoord2f(this->texmaxcoords[0], this->texmaxcoords[1]);
  glVertex3f(lowright[0], lowright[1], lowright[2]);

  glTexCoord2f(this->texmaxcoords[0], 0.0f);
  glVertex3f(upright[0], upright[1], upright[2]);

  glTexCoord2f(0.0f, 0.0f);
  glVertex3f(upleft[0], upleft[1], upleft[2]);

  glEnd();


  if (this->isPaletted()) // Switch OFF palette rendering
    this->deactivateCLUT(action);

  // This is a debugging backdoor: if the environment variable
  // CVR_SUBPAGE_FRAMES is set to a positive integer, a lineset will
  // be drawn around the border of each page.

  static int showsubpageframes = -1;
  if (showsubpageframes == -1) {
    const char * envstr = coin_getenv("CVR_SUBPAGE_FRAMES");
    if (envstr) { showsubpageframes = atoi(envstr) > 0 ? 1 : 0; }
    else showsubpageframes = 0;
  }

  if (showsubpageframes) {
    glDisable(GL_TEXTURE_2D);
    glLineStipple(1, 0xffff);
    glLineWidth(2);

    glBegin(GL_LINE_LOOP);
    glVertex3f(lowleft[0], lowleft[1], lowleft[2]);
    glVertex3f(lowright[0], lowright[1], lowright[2]);
    glVertex3f(upright[0], upright[1], upright[2]);
    glVertex3f(upleft[0], upleft[1], upleft[2]);
    glEnd();

    glEnable(GL_TEXTURE_2D);
  }
}
