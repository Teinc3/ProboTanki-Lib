package Renamed5154
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5155 extends AbstractPacket
   {
      public var itemId:String;
      
      public var time:int;
      
      public var decrease:Boolean;
      
      public function Renamed5155(param1:String = "", param2:int = 0, param3:Boolean = false)
      {
         super();
         this.itemId = param1;
         this.time = param2;
         this.decrease = param3;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.IntCodec");
         addObjToAbsPacket(param3);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.itemId = param1 as String;
               break;
            case 1:
               this.time = param1 as int;
               break;
            case 2:
               this.decrease = param1 as Boolean;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5155();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 43;
      }
      
      override public function getPacketId() : int
      {
         return 2032104949;
      }
   }
}

