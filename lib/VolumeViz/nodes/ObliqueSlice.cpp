#include <VolumeViz/nodes/SoObliqueSlice.h>
#include <Inventor/actions/SoGLRenderAction.h>
#include <Inventor/actions/SoRayPickAction.h>
#include <VolumeViz/elements/SoVolumeDataElement.h>
#include <VolumeViz/elements/SoTransferFunctionElement.h>

// *************************************************************************

SO_NODE_SOURCE(SoObliqueSlice);

// *************************************************************************

class SoObliqueSliceP {
public:
  SoObliqueSliceP(SoObliqueSlice * master)
  {
    this->master = master;
  }

private:
  SoObliqueSlice * master;
};

#define PRIVATE(p) (p->pimpl)
#define PUBLIC(p) (p->master)

// *************************************************************************

SoObliqueSlice::SoObliqueSlice(void)
{
  SO_NODE_CONSTRUCTOR(SoObliqueSlice);

  PRIVATE(this) = new SoObliqueSliceP(this);

  SO_NODE_DEFINE_ENUM_VALUE(Interpolation, NEAREST);
  SO_NODE_DEFINE_ENUM_VALUE(Interpolation, LINEAR);
  SO_NODE_SET_SF_ENUM_TYPE(interpolation, Interpolation);

  SO_NODE_DEFINE_ENUM_VALUE(AlphaUse, ALPHA_AS_IS);
  SO_NODE_DEFINE_ENUM_VALUE(AlphaUse, ALPHA_OPAQUE);
  SO_NODE_DEFINE_ENUM_VALUE(AlphaUse, ALPHA_BINARY);
  SO_NODE_SET_SF_ENUM_TYPE(alphaUse, AlphaUse);

  SO_NODE_ADD_FIELD(plane, (SbPlane(SbVec3f(0, 0, 1), 0)));
  SO_NODE_ADD_FIELD(interpolation, (LINEAR));
  SO_NODE_ADD_FIELD(alphaUse, (ALPHA_BINARY));
}

SoObliqueSlice::~SoObliqueSlice()
{
  delete PRIVATE(this);
}

// Doc from parent class.
void
SoObliqueSlice::initClass(void)
{
  SO_NODE_INIT_CLASS(SoObliqueSlice, SoShape, "SoShape");

  SO_ENABLE(SoGLRenderAction, SoVolumeDataElement);
  SO_ENABLE(SoGLRenderAction, SoTransferFunctionElement);

  SO_ENABLE(SoRayPickAction, SoVolumeDataElement);
  SO_ENABLE(SoRayPickAction, SoTransferFunctionElement);
}

void
SoObliqueSlice::GLRender(SoGLRenderAction * action)
{
  // FIXME: implement
}

void
SoObliqueSlice::rayPick(SoRayPickAction * action)
{
  // FIXME: implement
}

void
SoObliqueSlice::generatePrimitives(SoAction * action)
{
  // FIXME: implement
}

// doc in super
void
SoObliqueSlice::computeBBox(SoAction * action, SbBox3f & box, SbVec3f & center)
{
#if 0 // FIXME: code from SoVolumeRender, needs slight adjustments
  SoState * state = action->getState();

  const SoVolumeDataElement * volumedataelement =
    SoVolumeDataElement::getInstance(state);

  if (volumedataelement == NULL) return;

  SoVolumeData * volumedata = volumedataelement->getVolumeData();

  SbBox3f vdbox = volumedata->getVolumeSize();
  box.extendBy(vdbox);
  center = vdbox.getCenter();
#endif
}