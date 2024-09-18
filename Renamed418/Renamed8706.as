package Renamed418
{
   import Renamed189.AbstractPacket;
   import Renamed602.Renamed603;
   
   public class Renamed8706 extends AbstractPacket
   {
      public var position:Renamed603;
      
      public var orientation:Renamed603;
      
      public function Renamed8706(param1:Renamed603 = null, param2:Renamed603 = null)
      {
         super();
         this.position = param1;
         this.orientation = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.position = param1 as Renamed603;
               break;
            case 1:
               this.orientation = param1 as Renamed603;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8706();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -157204477;
      }
   }
}

