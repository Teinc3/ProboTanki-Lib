package §function set true§
{
   import §&#;§.AbstractPacket;
   
   public class §?#j§ extends AbstractPacket
   {
      public var battleId:String;
      
      public function §?#j§(param1:String = "")
      {
         super();
         this.battleId = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.battleId = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §?#j§();
      }
      
      override public function §package package final§() : int
      {
         return 14;
      }
      
      override public function getPacketId() : int
      {
         return -983139626;
      }
   }
}

