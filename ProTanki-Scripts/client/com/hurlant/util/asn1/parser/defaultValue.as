package com.hurlant.util.asn1.parser
{
   public function defaultValue(param1:*, param2:ASN1Type) : ASN1Type
   {
      param2 = param2.clone();
      param2.defaultValue = param1;
      return param2;
   }
}

