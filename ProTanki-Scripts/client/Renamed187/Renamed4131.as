package Renamed4129
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.impl.LengthCodecHelper;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Renamed4131 implements ICodec
   {
      private var elementCodec:ICodec;
      
      private var Renamed5009:Boolean;
      
      public function Renamed4131(param1:Boolean)
      {
         super();
         this.Renamed5009 = param1;
      }
      
      public function init(param1:IProtocol) : void
      {
         this.elementCodec = param1.getCodec(new TypeCodecInfo(MultiframeImageResource,false));
         if(this.Renamed5009)
         {
            this.elementCodec = new OptionalCodecDecorator(this.elementCodec);
         }
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:int = LengthCodecHelper.decodeLength(param1);
         var _loc3_:Vector.<MultiframeImageResource> = new Vector.<MultiframeImageResource>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = MultiframeImageResource(this.elementCodec.decode(param1));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         var _loc3_:MultiframeImageResource = null;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:Vector.<MultiframeImageResource> = Vector.<MultiframeImageResource>(param2);
         var _loc5_:int = int(_loc4_.length);
         LengthCodecHelper.encodeLength(param1,_loc5_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            this.elementCodec.encode(param1,_loc4_[_loc6_]);
            _loc6_++;
         }
      }
   }
}

