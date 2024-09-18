package Renamed4257
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class Renamed4261 extends AbstractPacket
   {
      public var Renamed5173:LayoutState;
      
      public function Renamed4261(param1:LayoutState = null)
      {
         super();
         this.Renamed5173 = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecLayoutState");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.Renamed5173 = param1 as LayoutState;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed4261();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 17;
      }
      
      override public function getPacketId() : int
      {
         return 377959142;
      }
   }
}

