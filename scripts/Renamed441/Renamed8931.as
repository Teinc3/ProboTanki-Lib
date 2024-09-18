package Renamed441
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class Renamed8931 extends AbstractPacket
   {
      public var origin:LayoutState;
      
      public var state:LayoutState;
      
      public function Renamed8931(param1:LayoutState = null, param2:LayoutState = null)
      {
         super();
         this.origin = param1;
         this.state = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecLayoutState");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.CodecLayoutState");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.origin = param1 as LayoutState;
               break;
            case 1:
               this.state = param1 as LayoutState;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed8931();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 12;
      }
      
      override public function getPacketId() : int
      {
         return -593368100;
      }
   }
}

