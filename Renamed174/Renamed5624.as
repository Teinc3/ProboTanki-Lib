package Renamed4312
{
   import Renamed189.AbstractPacket;
   
   public class Renamed5624 extends AbstractPacket
   {
      public var oldName:String;
      
      public var newName:String;
      
      public function Renamed5624(param1:String = "", param2:String = "")
      {
         super();
         this.oldName = param1;
         this.newName = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
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
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed5624();
      }
      
      override public function Renamed4883() : int
      {
         return 34;
      }
      
      override public function getPacketId() : int
      {
         return -1968445033;
      }
   }
}

