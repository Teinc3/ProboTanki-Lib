package com.hurlant.util.asn1.parser
{
   public function optional(param1:ASN1Type) : ASN1Type
   {
      param1 = param1.clone();
      param1.optional = true;
      return param1;
   }
}

