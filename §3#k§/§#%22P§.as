package §3#k§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.models.commons.periodtime.TimePeriodModelCC;
   
   public class §#"P§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §64§:ICodec;
      
      private var §"#w§:ICodec;
      
      private var §override set true§:ICodec;
      
      private var §6!%§:ICodec;
      
      public function §#"P§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§64§ = param1.getCodec(new TypeCodecInfo(Boolean,false));
         this.§"#w§ = param1.getCodec(new TypeCodecInfo(Boolean,false));
         this.§override set true§ = param1.getCodec(new TypeCodecInfo(int,false));
         this.§6!%§ = param1.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:TimePeriodModelCC = new TimePeriodModelCC();
         _loc2_.isEnabled = this.§64§.decode(param1) as Boolean;
         _loc2_.isTimeless = this.§"#w§.decode(param1) as Boolean;
         _loc2_.timeLeftInSeconds = this.§override set true§.decode(param1) as int;
         _loc2_.timeToStartInSeconds = this.§6!%§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:TimePeriodModelCC = TimePeriodModelCC(param2);
         this.§64§.encode(param1,_loc3_.isEnabled);
         this.§"#w§.encode(param1,_loc3_.isTimeless);
         this.§override set true§.encode(param1,_loc3_.timeLeftInSeconds);
         this.§6!%§.encode(param1,_loc3_.timeToStartInSeconds);
      }
   }
}

