package §import catch static§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §function const extends§ extends AbstractPacket
   {
      public var §-#`§:int;
      
      public var shotId:int;
      
      public var §9!i§:Vector.<§#">§>;
      
      public function §function const extends§(param1:int = 0, param2:int = 0, param3:Vector.<§#">§> = null)
      {
         super();
         this.§-#`§ = param1;
         this.shotId = param2;
         this.§9!i§ = param3;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.VectorCodecVector3d");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.§-#`§ = param1 as int;
               break;
            case 1:
               this.shotId = param1 as int;
               break;
            case 2:
               this.§9!i§ = param1 as Vector.<§#">§>;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §function const extends§();
      }
      
      override public function §package package final§() : int
      {
         return 53;
      }
      
      override public function getPacketId() : int
      {
         return -1823935471;
      }
   }
}

