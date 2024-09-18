package org.swiftsuspenders
{
   function getConstructor(param1:Object) : Class
   {
      var _loc2_:String = null;
      if(param1 is Proxy || param1 is Number || param1 is XML || param1 is XMLList)
      {
         _loc2_ = getQualifiedClassName(param1);
         return Class(getDefinitionByName(_loc2_));
      }
      return param1.constructor;
   }
}

