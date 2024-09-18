package §set package native§
{
   import §&#;§.AbstractPacket;
   
   public class §extends set override§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var effectId:int;
      
      public var duration:int;
      
      public var activeAfterDeath:Boolean;
      
      public var effectLevel:int;
      
      public function §extends set override§(param1:String = "", param2:int = 0, param3:int = 0, param4:Boolean = false, param5:int = 0)
      {
         super();
         this.tankId = param1;
         this.effectId = param2;
         this.duration = param3;
         this.activeAfterDeath = param4;
         this.effectLevel = param5;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.IntCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         §with catch with§(param5);
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
               this.effectId = param1 as int;
               break;
            case 2:
               this.duration = param1 as int;
               break;
            case 3:
               this.activeAfterDeath = param1 as Boolean;
               break;
            case 4:
               this.effectLevel = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §extends set override§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1639713644;
      }
   }
}

