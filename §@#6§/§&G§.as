package §@#6§
{
   import §&#;§.AbstractPacket;
   import §;"?§.§#">§;
   
   public class §&G§ extends AbstractPacket
   {
      public var shooter:String;
      
      public var target:String;
      
      public var hitPoint:§#">§;
      
      public var weakeningCoeff:Number;
      
      public var isCritical:Boolean;
      
      public function §&G§(param1:String = "", param2:String = "", param3:§#">§ = null, param4:Number = 0, param5:Boolean = false)
      {
         super();
         this.shooter = param1;
         this.target = param2;
         this.hitPoint = param3;
         this.weakeningCoeff = param4;
         this.isCritical = param5;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.custom.CodecVector3d");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.primitive.BooleanCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.shooter = param1 as String;
               break;
            case 1:
               this.target = param1 as String;
               break;
            case 2:
               this.hitPoint = param1 as §#">§;
               break;
            case 3:
               this.weakeningCoeff = param1 as Number;
               break;
            case 4:
               this.isCritical = param1 as Boolean;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §&G§();
      }
      
      override public function §package package final§() : int
      {
         return 49;
      }
      
      override public function getPacketId() : int
      {
         return -1334002026;
      }
   }
}

