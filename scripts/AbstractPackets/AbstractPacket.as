package AbstractPackets
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class AbstractPacket
   {
      public static var codecRegisterer:CodecRegisterer;
      
      public static const headerLength:int = 8;
      
      private var length:int = 8;
      
      private var codecList:Vector.<ICodec>;
      
      private var objectList:Vector.<Object>;
      
      private var packetByteArray:ByteArray;
      
      public function AbstractPacket()
      {
         this.codecList = new Vector.<ICodec>();
         this.objectList = new Vector.<Object>();
         this.packetByteArray = new ByteArray();
         super();
         codecRegisterer = CodecRegisterer(OSGi.getInstance().getService(CodecRegisterer));
      }
      
      public function wrap(param1:ByteArray) : void
      {
         var _loc2_:int = int(param1.position);
         var _loc3_:int = headerLength;
         param1.writeInt(_loc3_);
         param1.writeInt(this.getPacketId());
         var _loc4_:int = 0;
         while(_loc4_ < this.codecList.length)
         {
            _loc3_ += this.codecList[_loc4_].encode(this.packetByteArray,this.objectList[_loc4_]);
            _loc4_++;
         }
         codecRegisterer.getProtectionContext().encrypt(this.packetByteArray);
         param1.writeBytes(this.packetByteArray);
         this.packetByteArray.clear();
         this.packetByteArray.position = 0;
         var _loc5_:int = int(param1.position);
         param1.position = _loc2_;
         param1.writeInt(_loc3_);
         param1.position = _loc5_;
         this.setLength(_loc3_);
      }
      
      public function unwrap(param1:ByteArray) : void
      {
         var _loc3_:Object = null;
         param1.position = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.codecList.length)
         {
            _loc3_ = this.codecList[_loc2_].decode(param1);
            this.Implement(_loc3_,_loc2_);
            _loc2_++;
         }
      }
      
      public function addObjToAbsPacket(param1:Object) : void
      {
         this.objectList.push(param1);
      }
      
      public function addCodecToAbsPacket(param1:String) : void
      {
         this.codecList.push(codecRegisterer.getCodec(param1));
      }
      
      public function setLength(param1:int) : void
      {
         this.length = param1;
      }
      
      public function getLength() : int
      {
         return this.length;
      }
      
      public function getReference() : AbstractPacket
      {
         throw new Error("AbstractPacket::getReference must be overrided!");
      }
      
      public function Implement(param1:Object, param2:int) : void
      {
         throw new Error("Not implemented");
      }
      
      public function getCorrespondingModel() : int
      {
         return 0;
      }
      
      public function getPacketId() : int
      {
         return 0;
      }
      
      public function toString() : String
      {
         return "AbstractPacket[length = " + this.length + ", id = " + this.getPacketId() + "]";
      }
   }
}

