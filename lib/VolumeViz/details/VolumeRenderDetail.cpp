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

/*!
  \class SoVolumeRenderDetail SoVolumeRenderDetail.h VolumeViz/details/SoVolumeRenderDetail.h
  \brief The SoVolumeRenderDetail stores ray intersection information through a volume.

  An SoVolumeRenderDetail contains the information about a ray
  intersecting of a volume rendered with the SoVolumeRender node.

  The detail contains a "profile" of voxel values through the volume,
  where the profile is defined by a start point and an end point.

  See the superclass documentation for information on how to extract
  the information about the ray profile.
*/

#include <VolumeViz/details/SoVolumeRenderDetail.h>
#include <Inventor/SbName.h>
#include <stddef.h>
#include <string.h>

// *************************************************************************

SO_DETAIL_SOURCE(SoVolumeRenderDetail);

// *************************************************************************

SoVolumeRenderDetail::SoVolumeRenderDetail(void)
{
  assert(SoVolumeRenderDetail::getClassTypeId() != SoType::badType());
}

SoVolumeRenderDetail::~SoVolumeRenderDetail()
{
}

// doc in super
void
SoVolumeRenderDetail::initClass(void)
{
  SO_DETAIL_INIT_CLASS(SoVolumeRenderDetail, SoVolumeDetail);
}
