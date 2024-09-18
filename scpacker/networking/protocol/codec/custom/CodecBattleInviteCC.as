package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.client.panel.model.battleinvite.ProtectionContexts1;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecBattleInviteCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10577:ICodec;
      
      public function CodecBattleInviteCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10577 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:ProtectionContexts1 = new ProtectionContexts1();
         _loc2_.Renamed2087 = this.Renamed10577.decode(param1) as SoundResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ProtectionContexts1 = ProtectionContexts1(param2);
         this.Renamed10577.encode(param1,_loc3_.Renamed2087);
         return 4;
      }
   }
}

