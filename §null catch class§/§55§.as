package §null catch class§
{
   import §&#;§.AbstractPacket;
   
   public class §55§ extends AbstractPacket
   {
      public var protectionData:Vector.<int>;
      
      public function §55§(param1:Vector.<int> = null)
      {
         super();
         this.protectionData = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecByte");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.protectionData = param1 as Vector.<int>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §55§();
      }
      
      override public function §package package final§() : int
      {
         return 4;
      }
      
      override public function getPacketId() : int
      {
         return 2001736388;
      }
   }
}

