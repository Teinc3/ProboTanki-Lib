package §final for while§
{
   import §;"?§.§#">§;
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import §with const throw§.§["R§;
   
   public class §if set var§ implements ICodec
   {
      private static const §-"5§:Number = Math.PI / 4096;
      
      private static const §package const return§:Number = 0.005;
      
      private static const §?"C§:int = 17;
      
      private static const §break set true§:int = 13;
      
      private static const §with set default§:int = 13;
      
      private static const §8!e§:int = 13;
      
      private static const §`#$§:int = 21;
      
      public function §if set var§()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:§["R§ = §["R§(param2);
         param1.writeByte(_loc3_.control);
         var _loc4_:§;@§ = new §;@§([],§`#$§);
         this.§dynamic catch get§(_loc4_,_loc3_.position,§?"C§,1);
         this.§dynamic catch get§(_loc4_,_loc3_.orientation,§break set true§,§-"5§);
         this.§dynamic catch get§(_loc4_,_loc3_.§const null§,§with set default§,1);
         this.§dynamic catch get§(_loc4_,_loc3_.angularVelocity,§8!e§,§package const return§);
         return this.§4!@§(param1,_loc4_.getData(),§`#$§) + 1;
      }
      
      private function §4!@§(param1:IDataOutput, param2:Array, param3:int) : int
      {
         var _loc4_:int = 0;
         while(_loc4_ < param3)
         {
            param1.writeByte(param2[_loc4_]);
            _loc4_++;
         }
         return _loc4_;
      }
      
      [Obfuscation(rename="false")]
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:int = param1.readByte();
         var _loc3_:§;@§ = new §;@§(this.§3a§(param1,§`#$§),§`#$§);
         var _loc4_:§#">§ = this.§const false§(_loc3_,§?"C§,1);
         var _loc5_:§#">§ = this.§const false§(_loc3_,§break set true§,§-"5§);
         var _loc6_:§#">§ = this.§const false§(_loc3_,§with set default§,1);
         var _loc7_:§#">§ = this.§const false§(_loc3_,§8!e§,§package const return§);
         return new §["R§(_loc7_,_loc2_,_loc6_,_loc5_,_loc4_);
      }
      
      private function §3a§(param1:IDataInput, param2:int) : Array
      {
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < param2)
         {
            _loc3_[_loc4_] = param1.readByte();
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function §const false§(param1:§;@§, param2:int, param3:Number) : §#">§
      {
         var _loc4_:Number = (param1.read(param2) - (1 << param2 - 1)) * param3;
         var _loc5_:Number = (param1.read(param2) - (1 << param2 - 1)) * param3;
         var _loc6_:Number = (param1.read(param2) - (1 << param2 - 1)) * param3;
         return new §#">§(_loc4_,_loc5_,_loc6_);
      }
      
      private function §dynamic catch get§(param1:§;@§, param2:§#">§, param3:int, param4:Number) : void
      {
         var _loc5_:* = 1 << param3 - 1;
         param1.write(param3,this.§function package include§(param2.x,_loc5_,param4));
         param1.write(param3,this.§function package include§(param2.y,_loc5_,param4));
         param1.write(param3,this.§function package include§(param2.z,_loc5_,param4));
      }
      
      private function §function package include§(param1:Number, param2:int, param3:Number) : int
      {
         var _loc4_:int = int(param1 / param3);
         var _loc5_:int = _loc4_ < -param2 ? int(0) : int(_loc4_ - param2);
         return int(Math.min(param2,_loc5_));
      }
   }
}

