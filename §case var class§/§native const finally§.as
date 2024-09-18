package §case var class§
{
   import §&#;§.AbstractPacket;
   
   public class §native const finally§ extends AbstractPacket
   {
      public var mineId:String;
      
      public var x:Number;
      
      public var y:Number;
      
      public var z:Number;
      
      public var userId:String;
      
      public function §native const finally§(param1:String = "", param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:String = "")
      {
         super();
         this.mineId = param1;
         this.x = param2;
         this.y = param3;
         this.z = param4;
         this.userId = param5;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
         §with catch with§(param2);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param3);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param4);
         §super for switch§("scpacker.networking.protocol.codec.primitive.FloatCodec");
         §with catch with§(param5);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.mineId = param1 as String;
               break;
            case 1:
               this.x = param1 as Number;
               break;
            case 2:
               this.y = param1 as Number;
               break;
            case 3:
               this.z = param1 as Number;
               break;
            case 4:
               this.userId = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §native const finally§();
      }
      
      override public function §package package final§() : int
      {
         return 62;
      }
      
      override public function getPacketId() : int
      {
         return 272183855;
      }
   }
}

