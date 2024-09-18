package §else for implements§
{
   import §&#;§.AbstractPacket;
   
   public class §1!a§ extends AbstractPacket
   {
      public var advicedUids:Vector.<String>;
      
      public function §1!a§(param1:Vector.<String> = null)
      {
         super();
         this.advicedUids = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.complex.VectorCodecString");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.advicedUids = param1 as Vector.<String>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §1!a§();
      }
      
      override public function §package package final§() : int
      {
         return 8;
      }
      
      override public function getPacketId() : int
      {
         return 442888643;
      }
   }
}

