package Renamed304
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed7523 extends AbstractPacket
   {
      public var shooter:String;
      
      public var target:String;
      
      public var hitPoint:Renamed603;
      
      public var weakeningCoeff:Number;
      
      public var isCritical:Boolean;
      
      public function Renamed7523(param1:String = "", param2:String = "", param3:Renamed603 = null, param4:Number = 0, param5:Boolean = false)
      {
         super();
         this.shooter = param1;
         this.target = param2;
         this.hitPoint = param3;
         this.weakeningCoeff = param4;
         this.isCritical = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.target = param1 as String;
               break;
            case 2:
               this.hitPoint = param1 as Renamed603;
               break;
            case 3:
               this.weakeningCoeff = param1 as Number;
               break;
            case 4:
               this.isCritical = param1 as Boolean;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7523();
      }
      
      override public function Renamed4883() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return -1334002026;
      }
   }
}

