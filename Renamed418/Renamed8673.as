package Renamed418
{
   import Renamed189.AbstractPacket;
   import Renamed461.Renamed2773;
   
   public class Renamed8672 extends AbstractPacket
   {
      public var tankId:String;
      
      public var rotateTurretCommand:Renamed2773;
      
      public function Renamed8672(param1:String = "", param2:Renamed2773 = null)
      {
         super();
         this.tankId = param1;
         this.rotateTurretCommand = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecRotateTurretCommand");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.rotateTurretCommand = param1 as Renamed2773;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed8672();
      }
      
      override public function Renamed4883() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 1927704181;
      }
   }
}

