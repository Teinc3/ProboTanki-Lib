package Renamed418
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8709 extends AbstractPacket
   {
      public var tankId:String;
      
      public var maxSpeed:Number;
      
      public var maxTurnSpeed:Number;
      
      public var maxTurretRotationSpeed:Number;
      
      public var acceleration:Number;
      
      public var specificationId:int;
      
      public function Renamed8709(param1:String = "", param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:int = 0)
      {
         super();
         this.tankId = param1;
         this.maxSpeed = param2;
         this.maxTurnSpeed = param3;
         this.maxTurretRotationSpeed = param4;
         this.acceleration = param5;
         this.specificationId = param6;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
         Renamed1258(param6);
         Renamed4880("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.maxSpeed = param1 as Number;
               break;
            case 2:
               this.maxTurnSpeed = param1 as Number;
               break;
            case 3:
               this.maxTurretRotationSpeed = param1 as Number;
               break;
            case 4:
               this.acceleration = param1 as Number;
               break;
            case 5:
               this.specificationId = param1 as int;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8709();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1672577397;
      }
   }
}

