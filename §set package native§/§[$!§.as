package §set package native§
{
   import §&#;§.AbstractPacket;
   
   public class §[$!§ extends AbstractPacket
   {
      public var tankId:String;
      
      public var maxSpeed:Number;
      
      public var maxTurnSpeed:Number;
      
      public var maxTurretRotationSpeed:Number;
      
      public var acceleration:Number;
      
      public var specificationId:int;
      
      public function §[$!§(param1:String = "", param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:int = 0)
      {
         super();
         this.tankId = param1;
         this.maxSpeed = param2;
         this.maxTurnSpeed = param3;
         this.maxTurretRotationSpeed = param4;
         this.acceleration = param5;
         this.specificationId = param6;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param6);
         §super for switch§("scpacker.networking.protocol.codec.primitive.ShortCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tankId = param1 as String;
               break;
            case 1:
               this.maxSpeed = param1 as Number;
               break;
            case 2:
               this.maxTurnSpeed = param1 as Number;
               break;
            case 3:
               this.maxTurretRotationSpeed = param1 as Number;
               break;
            case 4:
               this.acceleration = param1 as Number;
               break;
            case 5:
               this.specificationId = param1 as int;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §[$!§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return -1672577397;
      }
   }
}

