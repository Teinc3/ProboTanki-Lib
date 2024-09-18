package com.hurlant.util.asn1.parser
{
   public function setOf(param1:ASN1Type, param2:uint = 0, param3:uint = 4294967295) : ASN1Type
   {
      return new SetType(param1);
   }
}

