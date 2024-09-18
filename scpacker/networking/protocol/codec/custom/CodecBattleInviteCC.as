package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.client.panel.model.battleinvite.§ !&§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecBattleInviteCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §3!h§:ICodec;
      
      public function CodecBattleInviteCC(param1:§?"s§)
      {
         super();
         this.§3!h§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§ !&§ = new § !&§();
         _loc2_.§in package case§ = this.§3!h§.decode(param1) as SoundResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§ !&§ = § !&§(param2);
         this.§3!h§.encode(param1,_loc3_.§in package case§);
         return 4;
      }
   }
}

