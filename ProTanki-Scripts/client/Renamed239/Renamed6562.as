package Renamed239
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.models.commons.periodtime.TimePeriodModelCC;
   
   public class Renamed4123 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed6558:ICodec;
      
      private var Renamed6559:ICodec;
      
      private var Renamed6560:ICodec;
      
      private var Renamed6561:ICodec;
      
      public function Renamed4123()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.Renamed6558 = param1.getCodec(new TypeCodecInfo(Boolean,false));
         this.Renamed6559 = param1.getCodec(new TypeCodecInfo(Boolean,false));
         this.Renamed6560 = param1.getCodec(new TypeCodecInfo(int,false));
         this.Renamed6561 = param1.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:TimePeriodModelCC = new TimePeriodModelCC();
         _loc2_.isEnabled = this.Renamed6558.decode(param1) as Boolean;
         _loc2_.isTimeless = this.Renamed6559.decode(param1) as Boolean;
         _loc2_.timeLeftInSeconds = this.Renamed6560.decode(param1) as int;
         _loc2_.timeToStartInSeconds = this.Renamed6561.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:TimePeriodModelCC = TimePeriodModelCC(param2);
         this.Renamed6558.encode(param1,_loc3_.isEnabled);
         this.Renamed6559.encode(param1,_loc3_.isTimeless);
         this.Renamed6560.encode(param1,_loc3_.timeLeftInSeconds);
         this.Renamed6561.encode(param1,_loc3_.timeToStartInSeconds);
      }
   }
}

