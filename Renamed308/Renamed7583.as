package Renamed7581
{
   import Renamed189.AbstractPacket;
   import projects.tanks.client.achievements.model.achievements.Renamed2072;
   
   public class Renamed7582 extends AbstractPacket
   {
      public var achievement:Renamed2072;
      
      public var message:String;
      
      public function Renamed7582(param1:Renamed2072 = null, param2:String = "")
      {
         super();
         this.achievement = param1;
         this.message = param2;
         Renamed1258(param1);
         Renamed4880("scpacker.networking.protocol.codec.custom.CodecAchievement");
         Renamed1258(param2);
         Renamed4880("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function Renamed4881(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.achievement = param1 as Renamed2072;
               break;
            case 1:
               this.message = param1 as String;
         }
      }
      
      override public function Renamed4882() : AbstractPacket
      {
         return new Renamed7582();
      }
      
      override public function Renamed4883() : int
      {
         return 67;
      }
      
      override public function getPacketId() : int
      {
         return -1042583203;
      }
   }
}

