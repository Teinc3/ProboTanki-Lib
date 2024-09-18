package ProtectionContexts
{
   import flash.utils.ByteArray;
   
   public interface IProtectionContext
   {
      function encrypt(param1:ByteArray) : void;
      
      function decrypt(param1:ByteArray) : void;
   }
}

