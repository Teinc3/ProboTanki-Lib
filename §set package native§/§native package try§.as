package §set package native§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §native package try§ extends AbstractPacket
   {
      public var position:§#">§;
      
      public var orientation:§#">§;
      
      public function §native package try§(param1:§#">§ = null, param2:§#">§ = null)
      {
         super();
         this.position = param1;
         this.orientation = param2;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.position = param1 as §#">§;
               break;
            case 1:
               this.orientation = param1 as §#">§;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §native package try§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -157204477;
      }
   }
}

