package com.hurlant.util.asn1.parser
{
   public function extract(param1:ASN1Type) : ASN1Type
   {
      param1 = param1.clone();
      param1.extract = true;
      return param1;
   }
}

