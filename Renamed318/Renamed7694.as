package Renamed318
{
   import AbstractPackets.AbstractPacket;
   
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
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
         addObjToAbsPacket(param4);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.FloatCodec");
         addObjToAbsPacket(param5);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
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
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed7694();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 62;
      }
      
      override public function getPacketId() : int
      {
         return 272183855;
      }
   }
}

