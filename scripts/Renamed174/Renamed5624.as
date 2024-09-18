package Renamed4312
{
   import AbstractPackets.AbstractPacket;
   
   public class Renamed5624 extends AbstractPacket
   {
      public var oldName:String;
      
      public var newName:String;
      
      public function Renamed5624(param1:String = "", param2:String = "")
      {
         super();
         this.oldName = param1;
         this.newName = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.oldName = param1 as String;
               break;
            case 1:
               this.newName = param1 as String;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5624();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -1968445033;
      }
   }
}

