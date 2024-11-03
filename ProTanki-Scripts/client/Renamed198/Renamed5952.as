package Renamed5947
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   
   public class Renamed5952 extends AbstractPacket
   {
      public var items:Vector.<GarageItemInfo>;
      
      public function Renamed5952(param1:Vector.<GarageItemInfo> = null)
      {
         super();
         this.items = param1;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecGarageItemInfo");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.items = param1 as Vector.<GarageItemInfo>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed5952();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 27;
      }
      
      override public function getPacketId() : int
      {
         return -47424608;
      }
   }
}

