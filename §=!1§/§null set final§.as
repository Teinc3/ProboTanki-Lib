package §=!1§
{
   import §&#;§.AbstractPacket;
   import §'!@§.§,!;§;
   
   public class §null set final§ extends AbstractPacket
   {
      public var damages:Vector.<§,!;§>;
      
      public function §null set final§(param1:Vector.<§,!;§> = null)
      {
         super();
         this.damages = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecTargetTankDamage");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.damages = param1 as Vector.<§,!;§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §null set final§();
      }
      
      override public function §package package final§() : int
      {
         return 47;
      }
      
      override public function getPacketId() : int
      {
         return -1165230470;
      }
   }
}

