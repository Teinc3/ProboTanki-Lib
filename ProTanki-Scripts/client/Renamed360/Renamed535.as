package Renamed360
{
   import Renamed602.3DPositionVector;
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import Renamed461.Renamed2772;
   
   public class Renamed535 implements ICodec
   {
      private static const Renamed8159:Number = Math.PI / 4096;
      
      private static const Renamed8160:Number = 0.005;
      
      private static const Renamed8161:int = 17;
      
      private static const Renamed8162:int = 13;
      
      private static const Renamed8163:int = 13;
      
      private static const Renamed8164:int = 13;
      
      private static const Renamed8165:int = 21;
      
      public function Renamed535()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:Renamed2772 = Renamed2772(param2);
         param1.writeByte(_loc3_.control);
         var _loc4_:Renamed8157 = new Renamed8157([],Renamed8165);
         this.Renamed8166(_loc4_,_loc3_.position,Renamed8161,1);
         this.Renamed8166(_loc4_,_loc3_.orientation,Renamed8162,Renamed8159);
         this.Renamed8166(_loc4_,_loc3_.Renamed2904,Renamed8163,1);
         this.Renamed8166(_loc4_,_loc3_.angularVelocity,Renamed8164,Renamed8160);
         return this.Renamed8167(param1,_loc4_.getData(),Renamed8165) + 1;
      }
      
      private function Renamed8167(param1:IDataOutput, param2:Array, param3:int) : int
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
         var _loc3_:Renamed8157 = new Renamed8157(this.Renamed8168(param1,Renamed8165),Renamed8165);
         var _loc4_:3DPositionVector = this.Renamed8169(_loc3_,Renamed8161,1);
         var _loc5_:3DPositionVector = this.Renamed8169(_loc3_,Renamed8162,Renamed8159);
         var _loc6_:3DPositionVector = this.Renamed8169(_loc3_,Renamed8163,1);
         var _loc7_:3DPositionVector = this.Renamed8169(_loc3_,Renamed8164,Renamed8160);
         return new Renamed2772(_loc7_,_loc2_,_loc6_,_loc5_,_loc4_);
      }
      
      private function Renamed8168(param1:IDataInput, param2:int) : Array
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
      
      private function Renamed8169(param1:Renamed8157, param2:int, param3:Number) : 3DPositionVector
      {
         var _loc4_:Number = (param1.read(param2) - (1 << param2 - 1)) * param3;
         var _loc5_:Number = (param1.read(param2) - (1 << param2 - 1)) * param3;
         var _loc6_:Number = (param1.read(param2) - (1 << param2 - 1)) * param3;
         return new 3DPositionVector(_loc4_,_loc5_,_loc6_);
      }
      
      private function Renamed8166(param1:Renamed8157, param2:3DPositionVector, param3:int, param4:Number) : void
      {
         var _loc5_:* = 1 << param3 - 1;
         param1.write(param3,this.Renamed8170(param2.x,_loc5_,param4));
         param1.write(param3,this.Renamed8170(param2.y,_loc5_,param4));
         param1.write(param3,this.Renamed8170(param2.z,_loc5_,param4));
      }
      
      private function Renamed8170(param1:Number, param2:int, param3:Number) : int
      {
         var _loc4_:int = int(param1 / param3);
         var _loc5_:int = _loc4_ < -param2 ? int(0) : int(_loc4_ - param2);
         return int(Math.min(param2,_loc5_));
      }
   }
}

