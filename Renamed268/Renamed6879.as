package Renamed268
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.battleservice.Renamed1579;
   
   public class Renamed4169 extends AbstractPacket
   {
      public var params:Renamed1579;
      
      public function Renamed4169(param1:Renamed1579 = null)
      {
         super();
         this.params = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecBattleCreateParameters");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.params = param1 as Renamed1579;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4169();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 30;
      }
      
      override public function getPacketId() : int
      {
         return -2135234426;
      }
   }
}

