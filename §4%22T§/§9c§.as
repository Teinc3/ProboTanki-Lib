package §4"T§
{
   import §&#;§.AbstractPacket;
   
   public class §9c§ extends AbstractPacket
   {
      public var userId:String;
      
      public function §9c§(param1:String = "")
      {
         super();
         this.userId = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.userId = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §9c§();
      }
      
      override public function §package package final§() : int
      {
         return 13;
      }
      
      override public function getPacketId() : int
      {
         return 650923390;
      }
   }
}

