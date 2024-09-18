package §set package native§
{
   import §&#;§.AbstractPacket;
   
   public class §break const continue§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var control:int;
      
      public function §break const continue§(param1:String = "", param2:int = 0)
      {
         super();
         this.tankId = param1;
         this.control = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.control = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §break const continue§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -301298508;
      }
   }
}

