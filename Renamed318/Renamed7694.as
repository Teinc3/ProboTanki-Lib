package Renamed318
{
   import Renamed189.AbstractPacket;
   
   public class Renamed7694 extends AbstractPacket
   {
      public var mineId:String;
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public var userId:String;
      
      public function Renamed7694(param1:String = "", param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:String = "")
      {
         super();
         this.mineId = param1;
         this.x = param2;
         this.y = param3;
         this.z = param4;
         this.userId = param5;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
         Renamed1258(param3);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
         Renamed1258(param4);
         Renamed4880("scpacker.networking.protocol.codec.primitive.FloatCodec");
         Renamed1258(param5);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.mineId = param1 as String;
               break;
            case 1:
               this.x = param1 as Number;
               break;
            case 2:
               this.y = param1 as Number;
               break;
            case 3:
               this.z = param1 as Number;
               break;
            case 4:
               this.userId = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7694();
      }
      
      override public function Renamed4883() : int
      {
         return 62;
      }
      
      override public function getPacketId() : int
      {
         return 272183855;
      }
   }
}

