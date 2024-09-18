package §set package native§
{
   import §&#;§.AbstractPacket;
   
   public class §0$!§ extends AbstractPacket
   {
      public var tank:String;
      
      public function §0$!§(param1:String = "")
      {
         super();
         this.tank = param1;
         §with catch with§(param1);
         §super for switch§("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      override public function §for const while§(param1:Object, param2:int) : void
      {
         switch(param2)
         {
            case 0:
               this.tank = param1 as String;
         }
      }
      
      override public function §4#w§() : AbstractPacket
      {
         return new §0$!§();
      }
      
      override public function §package package final§() : int
      {
         return 39;
      }
      
      override public function getPacketId() : int
      {
         return 1719707347;
      }
   }
}

