package §3!t§
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.impl.LengthCodecHelper;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.resourcelocale.format.§super const function§;
   
   public class §each package var§ implements ICodec
   {
      private var elementCodec:ICodec;
      
      private var §?"_§:Boolean;
      
      public function §each package var§(param1:Boolean)
      {
         super();
         this.§?"_§ = param1;
      }
      
      public function init(param1:IProtocol) : void
      {
         this.elementCodec = param1.getCodec(new TypeCodecInfo(§super const function§,false));
         if(this.§?"_§)
         {
            this.elementCodec = new OptionalCodecDecorator(this.elementCodec);
         }
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:int = LengthCodecHelper.decodeLength(param1);
         var _loc3_:Vector.<§super const function§> = new Vector.<§super const function§>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = §super const function§(this.elementCodec.decode(param1));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Vector.<§super const function§> = Vector.<§super const function§>(param2);
         var _loc4_:int = int(_loc3_.length);
         LengthCodecHelper.encodeLength(param1,_loc4_);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            this.elementCodec.encode(param1,_loc3_[_loc5_]);
            _loc5_++;
         }
      }
   }
}

