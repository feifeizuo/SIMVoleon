#ifndef COIN_SOOBLIQUESLICEDETAIL_H
#define COIN_SOOBLIQUESLICEDETAIL_H

#include <Inventor/details/SoDetail.h>
#include <Inventor/details/SoSubDetail.h>

class SbVec3f;


class SoObliqueSliceDetail : public SoDetail {
  typedef SoDetail inherited;

  SO_DETAIL_HEADER(SoObliqueSliceDetail);

public:
  static void initClass(void);
  SoObliqueSliceDetail(void);
  virtual ~SoObliqueSliceDetail();
 
  virtual SoDetail * copy(void) const;

  SbVec3f & getValueObjectPos(void) const;
  SbVec3f & getValueDataPos(void) const;
  unsigned int getValue(void) const;
};

#endif // !COIN_SOOBLIQUESLICEDETAIL_H