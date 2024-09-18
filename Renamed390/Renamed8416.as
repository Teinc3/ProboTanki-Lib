package Renamed390
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   
   public class Renamed8416 extends AbstractPacket
   {
      public var battleId:String;
      
      public var suspicionLevel:Renamed1620;
      
      public function Renamed8416(param1:String = "", param2:Renamed1620 = null)
      {
         super();
         this.battleId = param1;
         this.suspicionLevel = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleSuspicionLevel");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
               break;
            case 1:
               this.suspicionLevel = param1 as Renamed1620;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8416();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 32;
      }
      
      override public function getPacketId() : int
      {
         return -751613832;
      }
   }
}

