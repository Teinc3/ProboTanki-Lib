package Renamed228
{
   import AbstractPackets.AbstractPacket;
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   
   public class Renamed6453 extends AbstractPacket
   {
      public var userId:String;
      
      public var usersInfo:Vector.<Renamed2737>;
      
      public function Renamed6453(param1:String = "", param2:Vector.<Renamed2737> = null)
      {
         super();
         this.userId = param1;
         this.usersInfo = param2;
         addObjToAbsPacket(param1);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.primitive.StringCodec");
         addObjToAbsPacket(param2);
         addCodecToAbsPacket("scpacker.networking.protocol.codec.custom.VectorCodecUserInfo");
      }
      
      override public function Implement(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
               break;
            case 1:
               this.usersInfo = param1 as Vector.<Renamed2737>;
         }
      }
      
      override public function getReference() : AbstractPacket
      {
         return new Renamed6453();
      }
      
      override public function getCorrespondingModel() : int
      {
         return 48;
      }
      
      override public function getPacketId() : int
      {
         return 862913394;
      }
   }
}

