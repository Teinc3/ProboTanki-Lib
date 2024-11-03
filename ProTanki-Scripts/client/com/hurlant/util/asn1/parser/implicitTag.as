package com.hurlant.util.asn1.parser
{
   public function implicitTag(param1:int, param2:int, param3:ASN1Type) : ASN1Type
   {
      param3 = param3.clone();
      param3.implicitTag = param1;
      param3.implicitClass = param2;
      return param3;
   }
}

