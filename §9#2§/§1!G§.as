package §9#2§
{
   import §&#;§.AbstractPacket;
   
   public class §1!G§ extends AbstractPacket
   {
      public var questId:int;
      
      public function §1!G§(param1:int = 0)
      {
         super();
         this.questId = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.questId = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §1!G§();
      }
      
      override public function §package package final§() : int
      {
         return 19;
      }
      
      override public function getPacketId() : int
      {
         return 326032325;
      }
   }
}

