package Renamed363
{
   import Renamed189.AbstractPacket;
   
   public class Renamed8186 extends AbstractPacket
   {
      public var errorMessage:String;
      
      public function Renamed8186(param1:String = "")
      {
         super();
         this.errorMessage = param1;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.errorMessage = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8186();
      }
      
      override public function Renamed4883() : int
      {
         return 76;
      }
      
      override public function getPacketId() : int
      {
         return 138698791;
      }
   }
}

